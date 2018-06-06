$(setup);

var lastMarginBoxBottom;
var entriesIn = {};

if ( typeof window.MathJax === 'undefined' ) {
    window.MathJax = {
	AuthorInit: function() {
	    MathJax.Hub.Register.StartupHook("End",spaceOutMarginBoxes);
	}
    };
} else {
    MathJax.Hub.Register.StartupHook("End",spaceOutMarginBoxes);
}
// onload, spaceOut is ok.  It needs to run after MathJax is done,
// but that is noticeably longer, and tricky to hook into

function setup() {
    spaceOutMarginBoxes();
    addPermaLinkFor('.ltx_theorem[id]:has(>h6.ltx_title.ltx_title_theorem)',
		    "h6.ltx_title.ltx_title_theorem");
    addPermaLinkFor('figure.marginnote',"figcaption");
    if ( $("section.ltx_index ul.ltx_indexlist").length ) {
	// add an A-Z to the index
	$("section.ltx_index ul.ltx_indexlist li.ltx_indexentry")
	    .not('li.ltx_indexentry ul.ltx_indexlist li.ltx_indexentry')
	    .each(readIndexEntry);
	$('<div id="indexContents"></div>')
	    .insertAfter("h1.ltx_title.ltx_title_index");
	$.each(entriesIn,wrapEntries);
    }
    fixFirefoxAnchorBug();
}

function addPermaLinkFor(parents,child) {
    $(parents).each(function() {
	$(this).children(child).first()
	    .append('<a class="permaLink" title="Permalink" href="#'+this.id+'">\u00B6</a>');
    });
}

function addPermaLink() {
    $(this).children("h6.ltx_title.ltx_title_theorem,figcaption").first()
	.append('<a class="permaLink" title="Permalink" href="#'+this.id+'">\u00B6</a>');
}

function spaceOutMarginBoxes() {
    lastMarginBoxBottom = 0;
    $("figure.marginnote").each(spaceOutBox);
}

function spaceOutBox() {
    var thisJq = $(this);
    var offset = thisJq.offset();
    if ( offset.top < lastMarginBoxBottom+20 ) {
	offset.top = lastMarginBoxBottom+20;
	thisJq.offset(offset);
    }
    lastMarginBoxBottom = offset.top + thisJq.height();
}

function readIndexEntry(ignoreIndex,indexEntry) {
    //return;
    var firstLetter = this.id.charAt(0).toLocaleUpperCase();
    if ( entriesIn[firstLetter] ) {
	entriesIn[firstLetter] = entriesIn[firstLetter].add(this);
    } else {
	entriesIn[firstLetter] = $(this);
    }
}

function wrapEntries(firstLetter,indexEntries) {
    $("#indexContents").append('<a href="#'+firstLetter+'_entries">'+firstLetter+'</a>');
    indexEntries.wrapAll('<li id="'+firstLetter+'_entries"><ul></ul></li>');
    indexEntries.parent().before('<span>'+firstLetter+'</span>');
}

/** Taken from Python docs
 *  workaround a firefox stupidity
 *  see: https://bugzilla.mozilla.org/show_bug.cgi?id=645075 */
function fixFirefoxAnchorBug() {
    if (document.location.hash) {
	window.setTimeout(function() {
            document.location.href += '';
	}, 10);
    }
}
