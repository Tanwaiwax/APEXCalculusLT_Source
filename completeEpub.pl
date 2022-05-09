# this file is in the Public Domain

# this creates an epub version 2 or 3 file, mostly following
# https://www.hxa.name/articles/content/epub-guide_hxa7241_2007.html
# or
# https://www.w3.org/publishing/epub/epub-overview.html
# respectively

# I think one big difference is that EPUB2 isn't allowed to have MathML

my $usage = 'perl completeEpub.pl options.json';

# required keys in the options.json file:
# input_directory
# output_file
# identifier (a probably unique string: URI or ISBN would be good)
# title
# language (eg, en-US)

# optional keys:
# creator
# tocFile: a file containing the table of contents
# (The file must exist.
# Without the key, we will guess which file it is by looking for the xpath
# //html:article//html:ul[contains(@class,"ltx_toclist")]//html:a[@href].
# Look for the key is_toc down below.)
# EPUB_VERSION: defaults to the string "3.0"

# title, language, and creator could come from the xml file

use strict;
use warnings;

use Archive::Zip;
use DateTime;
use DateTime::Format::RFC3339;
use JSON;
use Time::Piece;
use XML::LibXML;
#use XML::LibXSLT;

if ( scalar @ARGV != 1 ) {
    die "Usage: $usage\n";
}
my $options_file = $ARGV[0];

my $options_text = do {
    open(my $JSONFH,'<',$options_file) or die 'Cannot read options file';
    local $/;
    <$JSONFH>;
};
my $json = JSON->new;
my $options = $json->decode($options_text);

my $EPUB_VERSION = $options->{EPUB_VERSION} // '3.0';

my %fileProperties;

#my $FH;

# we need to get some information
# ideally, this would be passed in by latexmlpost
# or created by the epub xslt
opendir my $epubdir, $options->{input_directory} or die $!;
my @epubFiles = readdir $epubdir;
closedir $epubdir;

my %nstag = (
    scripted => '//html:script',
    mathml => '//mathml:math',
    svg => '//svg:svg'
);
my %namespace = (
    html => 'http://www.w3.org/1999/xhtml',
    mathml => 'http://www.w3.org/1998/Math/MathML',
    svg => 'http://www.w3.org/2000/svg'
);

foreach my $epubfile ( @epubFiles ) {
    unless ( $epubfile =~ /.xhtml/ ) {
        next;
    }
    my $xml = XML::LibXML->load_xml(location=>$options->{input_directory}."/".$epubfile);
    my $dom = XML::LibXML::XPathContext->new( $xml->documentElement() );
    foreach my $ns ( keys %namespace ) {
        $dom->registerNs($ns=>$namespace{$ns});
    }
    # see https://github.com/brucemiller/LaTeXML/issues/1763
    if ( $dom->exists('//html:span[@colspan]') ) {
        print "$epubfile has ". $dom->findnodes('//html:span/@colspan')->size() . " occurences of span[colspan]\n";
    }
    my %properties = (
        is_toc => $dom->exists('//html:article//html:ul[contains(@class,"ltx_toclist")]//html:a[@href]'),
        next_file => $dom->findvalue('//html:link[@rel="next"]/@href'),
        prev_file => $dom->findvalue('//html:link[@rel="prev"]/@href'),
    );
    my @propsList;
    foreach my $prop ( keys %nstag ) {
        $properties{"has_$prop"} = $dom->exists($nstag{$prop});
        if ( $properties{"has_$prop"} ) {
            push @propsList, $prop;
        }
    }
    if ( $epubfile eq 'toc.xhtml' ) {
        $properties{is_toc} = 0;
        $properties{next_file} = 0;
        $properties{prev_file} = 0;
        push @propsList, 'nav';
    }
    $properties{xmlManifestProps} = join(' ',@propsList);
    $fileProperties{$epubfile} = \%properties;
}

sub getTocFile {
    foreach my $filename ( keys %fileProperties) {
        if ( $fileProperties{$filename}->{is_toc} ) {
            return $filename;
        }
    }
    die 'TOC file not found';
}

sub getFirstFile {
    my $firstFile = shift;
    while ( $fileProperties{$firstFile}->{prev_file} ) {
        $firstFile = $fileProperties{$firstFile}->{prev_file};
    }
    return $firstFile;
}

unlink($options->{input_directory}.'/LaTeXML.cache');

# container.xml
my $container = XML::LibXML->createDocument('1.0','utf-8');
my $containerRoot = $container->createElement('container');
$containerRoot->setAttribute(version=>'1.0');
$containerRoot->setAttribute(xmlns=>
                             'urn:oasis:names:tc:opendocument:xmlns:container');
$container->setDocumentElement($containerRoot);
 my $rootfiles = $container->createElement('rootfiles');
 $containerRoot->appendChild($rootfiles);
  my $rootfile = $container->createElement('rootfile');
  $rootfile->setAttribute('full-path'=>'package.opf');
  $rootfile->setAttribute('media-type'=>'application/oebps-package+xml');
  $rootfiles->appendChild($rootfile);
unless ( -e $options->{input_directory}.'/META-INF' ) {
    mkdir $options->{input_directory}.'/META-INF';
}
$container->toFile($options->{input_directory}.'/META-INF/container.xml',1);
# maybe write this directly to zip instead of to the file

my $tocFile = $options->{tocFile} // getTocFile();
my $tocxml = XML::LibXML->load_xml(location=>$options->{input_directory}."/$tocFile");
my $tocDom = XML::LibXML::XPathContext->new( $tocxml->documentElement() );
$tocDom->registerNs('html','http://www.w3.org/1999/xhtml');

my %mediatype = (
    ncx => 'application/x-dtbncx+xml',
    css => 'text/css',
    svg => 'image/svg+xml',
    xhtml => 'application/xhtml+xml',
    html => 'application/xhtml+xml',
    png => 'image/png',
    jpg => 'image/jpeg',
    js => 'application/javascript',
);

sub getManifestEntry {
    my ($filename,$content) = @_;
    my $entry = $content->createElement('item');
    my $fileSuffix = $filename;
    $fileSuffix =~ s/^.*\.//;
    if ( $fileSuffix eq 'xhtml' and $EPUB_VERSION eq '3.0' and $fileProperties{$filename}->{xmlManifestProps} ) {
        $entry->setAttribute(properties=>
                            $fileProperties{$filename}->{xmlManifestProps});
    }
    $entry->setAttribute(href=>$filename);
    my $id = $filename;
    $id =~ s[/][-SLASH-]g;
    $entry->setAttribute(id=>$id);
    unless ( $mediatype{$fileSuffix} ) {
        print "$filename needs a media-type (or should be deleted)\n";
    }
    $entry->setAttribute('media-type'=>$mediatype{$fileSuffix});
    return $entry;
}
sub getSpineEntry {
    my ($filename,$content) = @_;
    my $entry = $content->createElement('itemref');
    $filename =~ s[/][-SLASH-]g;
    $entry->setAttribute(idref=>$filename);
    return $entry;
}

sub getFiles {
    my $dir = $_[0];
    my @ret = glob("$dir/*.*");
    foreach my $file ( glob("$dir/*") ) {
        if ( -d $file ) {
            @ret = (@ret,getFiles($file));
        }
    }
    return @ret;
}

# how should this discover all the files in the directory tree?
@epubFiles = getFiles($options->{input_directory});

# package.opf
my $content = XML::LibXML->createDocument('1.0', 'utf-8');
my $package = $content->createElement('package');
$package->setAttribute(xmlns=>'http://www.idpf.org/2007/opf');
$package->setAttribute('unique-identifier'=>'dcidid');
$package->setAttribute(version=>$EPUB_VERSION);
$content->setDocumentElement($package);
  my $metadata = $content->createElement('metadata');
  $metadata->setAttribute('xmlns:dc'=>'http://purl.org/dc/elements/1.1/');
  $metadata->setAttribute('xmlns:dcterms'=>'http://purl.org/dc/terms/');
  $metadata->setAttribute('xmlns:xsi'=>
                          'http://www.w3.org/2001/XMLSchema-instance');
  $metadata->setAttribute('xmlns:opf'=>'http://www.idpf.org/2007/opf');
  $package->appendChild($metadata);
    $metadata->appendTextChild('dc:title',$options->{title});
    if ( $options->{creator} ) {
      my $dccreator = $content->createElement('dc:creator');
      if ( $EPUB_VERSION eq '2.0' ) {
        $dccreator->setAttribute('opf:role'=>'aut');
      }
      $dccreator->appendTextNode($options->{creator});
      $metadata->appendChild($dccreator);
    }
    my $dclanguage = $content->createElement('dc:language');
    if ( $EPUB_VERSION eq '2.0' ) {
      $dclanguage->setAttribute('xsi:type'=>'dcterms:RFC3066');
    }
    $dclanguage->appendTextNode($options->{language});
    $metadata->appendChild($dclanguage);
    my $dcidentifier = $content->createElement('dc:identifier');
    $dcidentifier->setAttribute(id=>'dcidid');
    if ( $EPUB_VERSION eq '2.0' ) {
      $dcidentifier->setAttribute('opf:scheme'=>
                    $options->{identifier} =~ /^(97(8|9))?\d{9}(\d|X)$/ ? 'ISBN' : 'URI' );
    }
    $dcidentifier->appendTextNode($options->{identifier});
    $metadata->appendChild($dcidentifier);
    my $dcdate;
    if ( $EPUB_VERSION eq '2.0' ) {
      $dcdate = $content->createElement('dc:date');
      $dcdate->setAttribute('xsi:type'=>'dcterms:W3CDTF');
    } else {
      $dcdate = $content->createElement('meta');
      $dcdate->setAttribute(property=>'dcterms:modified');
    }
    $dcdate->appendTextNode(DateTime::Format::RFC3339->new()->format_datetime(DateTime->now()));
    # surely there's a better way to do that?
    $metadata->appendChild($dcdate);
  my %skipInManifest = (
      'toc.ncx' => 1,
      'toc.xhtml' => 1,
      'content.opf' => 1,
      'package.opf' => 1,
      'META-INF/container.xml' => 1,
  );
  my $manifest = $content->createElement('manifest');
    if ( $EPUB_VERSION eq '2.0' ) {
      $manifest->appendChild(getManifestEntry('toc.ncx',$content));
    } else {
      $manifest->appendChild(getManifestEntry('toc.xhtml',$content));
    }
    my $input_directory_length = length($options->{input_directory});
    foreach my $dirfile ( @epubFiles ) {
        my $file = substr($dirfile,$input_directory_length+1);
        $file =~ s[^epub/][];
        unless ( $skipInManifest{$file} ) {
            $manifest->appendChild(getManifestEntry($file,$content));
        }
    }
  $package->appendChild($manifest);
  my $spine = $content->createElement('spine');
  if ( $EPUB_VERSION eq '2.0' ) {
    $spine->setAttribute(toc=>'toc.ncx');
  }
  my $spinefile = getFirstFile($tocFile);
  while ( $spinefile ) {
      $spine->appendChild(getSpineEntry($spinefile,$content));
      $spinefile = $fileProperties{$spinefile}->{next_file};
  }
  $package->appendChild($spine);
$content->toFile($options->{input_directory}.'/package.opf',1);
# maybe write this to zip instead of to the file?

system('xsltproc',
       '--output',
       $options->{input_directory}
       . ( $EPUB_VERSION eq '2.0' ? '/toc.ncx' : '/toc.xhtml' ),
       'epubtoc.xsl',$options->{input_directory}."/$tocFile");

# this might be the only thing that *must* be in Perl
# everything else could(?) be done through epub's XSLT
my $zipped = Archive::Zip->new();
# the first item in the zip has to be this
# no newline allowed at the end
# must have no compression
$zipped->addString({
    string => 'application/epub+zip',
    zipName => 'mimetype',
    compressionLevel => Archive::Zip::COMPRESSION_LEVEL_NONE
});
$zipped->addTree($options->{input_directory},'',sub { ! m[(/|^)\.]; } );
# skip dot files
$zipped->writeToFileNamed($options->{output_file}) == Archive::Zip::AZ_OK
    or die 'write error';

# command line:
# zip -X -q0 media.epub mimetype # ?!?!?! not working !?!?!?!
# zip -qrD media.epub *
# check:
# unzip -v media.epub
