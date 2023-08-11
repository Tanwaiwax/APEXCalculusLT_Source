$(setup);

var entriesIn = {};

function setup() {
    addPermaLinkFor('.ltx_theorem[id]:has(>h6.ltx_title.ltx_title_theorem)',
		    'h6.ltx_title.ltx_title_theorem');
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
    }
}

function addPermaLinkFor(parents,child) {
    $(parents+':has(>'+child+')').each(function() {
	$(this).children(child).first()
	    .append('<a class="permaLink" title="Permalink" href="#'+this.id+'">\u00B6</a>');
    });
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
