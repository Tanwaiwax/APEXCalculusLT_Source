$(setup);

const minSepPixels = 20;

var lastMarginBoxBottom;
var entriesIn = {};

MathJax = {
	AuthorInit: function() {
        // see https://github.com/brucemiller/LaTeXML/issues/1708
        // and https://github.com/mathjax/MathJax/issues/487
        // MathJax can't handle any tags within mtext
        // change struts to mspace
        $('mtext').has('span.ltx_rule[style*="width:0.0pt"][style*="height"]').each(function() {
            const jThis = $(this),
                height = jThis
                    .children('span.ltx_rule[style*="width:0.0pt"][style*="height"]')
                    .get(0).style.height;
            jThis.replaceWith('<mspace height="'+height+'" />');
        });
        // remove all other tags from within mtext
        $('mtext').has('*').each(function() {
            const jThiss = $(this);
            jThiss.html(jThiss.text());
        });
	    MathJax.Hub.Register.StartupHook('End',spaceOutMarginBoxes);
	}
};
// onload, spaceOut is ok.  It needs to run after MathJax is done,
// but that is noticeably longer, and tricky to hook into

function setup() {
    spaceOutMarginBoxes();
    addPermaLinkFor('.ltx_theorem[id]:has(>h6.ltx_title.ltx_title_theorem)',
		    'h6.ltx_title.ltx_title_theorem');
    //addPermaLinkFor('figure.marginnote','figcaption');
    addPermaLinkFor('span.ltx_figure','span.ltx_caption')
    if ( $('section.ltx_index ul.ltx_indexlist').length ) {
	// add an A-Z to the index
        // the first few entries are math, and shouldn't be counted with the A-Z
        // we'll find the first non-math entry, and then add the others
        // then we need to remove sub entries
	$('section.ltx_index ul.ltx_indexlist li.ltx_indexentry:not(:has(.ltx_Math))')
        .eq(0)
        .nextAll('section.ltx_index ul.ltx_indexlist li.ltx_indexentry')
        .addBack()
	    .not('li.ltx_indexentry ul.ltx_indexlist li.ltx_indexentry')
	    .each(readIndexEntry);
	$('<div id="indexContents"></div>')
	    .insertAfter('h1.ltx_title.ltx_title_index');
	$.each(entriesIn,wrapEntries);
        // todo latexml
        $('.ltx_indexentry span[style="font-size:90%;"]').removeAttr('style');
    }
    // todo latexml
    $('.ltx_note.ltx_role_margin > .ltx_note_outer > .ltx_note_content > .ltx_inline-para > .ltx_para > .ltx_p')
        .filter(function() { return $(this).text()==='\u039B'; })
        .remove();
    fixFirefoxAnchorBug();
}

function addPermaLinkFor(parents,child) {
    $(parents+':has(>'+child+')').each(function() {
	$(this).children(child).first()
	    .append('<a class="permaLink" title="Permalink" href="#'+this.id+'">\u00B6</a>');
    });
}

/*
function addPermaLink() {
    $(this).children('h6.ltx_title.ltx_title_theorem,figcaption').first()
	.append('<a class="permaLink" title="Permalink" href="#'+this.id+'">\u00B6</a>');
}
*/

function spaceOutMarginBoxes() {
    lastMarginBoxBottom = 0;
    $('span.ltx_note.ltx_role_margin span.ltx_note_content').each(spaceOutBox);
}

function spaceOutBox() {
    var thisJq = $(this);
    var offset = thisJq.offset();
    if ( offset.top < lastMarginBoxBottom+minSepPixels ) {
	offset.top = lastMarginBoxBottom+minSepPixels;
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
    indexEntries.wrapAll('<li id="'+firstLetter+'_entries" class="entry_wrapper"><ul></ul></li>');
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
