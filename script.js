$(setup);

var lastMarginBoxBottom;

function setup() {
    MathJax.Hub.Register.StartupHook("End",spaceOutMarginBoxes);
    spaceOutMarginBoxes();
    // onload, spaceOut is ok.  It needs to run after MathJax is done,
    // but that is noticeably longer.
    wrapSolutions();
    $("[id]:has(.ltx_font_bold+.ltx_font_bold)").each(addPermaLink);
    removeTitlePageExtras();
    fixFirefoxAnchorBug();
}

function spaceOutMarginBoxes() {
    lastMarginBoxBottom = 0;
    $(".marginbox").each(spaceOutBox);
}

function spaceOutBox() {
    var thisJq = $(this);
    var offset = thisJq.offset();
    var newTop = thisJq.offset().top;
    if ( offset.top < lastMarginBoxBottom+20 ) {
	offset.top = lastMarginBoxBottom+20;
	thisJq.offset(offset);
    }
    lastMarginBoxBottom = offset.top + thisJq.height();
}

function wrapSolutions() {
    $("section.solutions .ltx_para:has(ol)").each(wrapSet);
}

function wrapSet() {
    $(this).find("ol").wrapAll('<div class="sectionSolutions"></div>');
}

function addPermaLink() {
    $(this).find(".ltx_font_bold").last().after('<a class="permaLink" title="Permalink" href="#'+this.id+'">\u00B6</a>');
}

function removeTitlePageExtras() {
    if ( $("head link[rel='start'][href='.'][title='']").length ) {
	$("body.hasIframe > div.ltx_page_main > header.ltx_page_header > div > a.ltx_ref[href='.'][title=''][rel='prev']").remove();
	$("body.hasIframe > div.ltx_page_main > div.ltx_page_content > section.ltx_chapter > h1.ltx_title.ltx_title_chapter").remove();
    }
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
