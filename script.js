
document.addEventListener('DOMContentLoaded',setup);

const minSepPixels = 20;

let lastMarginBoxBottom;
const entriesIn = {};

MathJax = {
    startup: {
        ready: function() {
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
            MathJax.startup.defaultReady();
            MathJax.startup.promise.then(spaceOutMarginBoxes);
            // onload, spaceOut is ok.  It needs to run after MathJax is done,
            // but that is noticeably longer
        }
    },
    Hub: {
        Queue: function() {}
    }
}

function setup() {
    spaceOutMarginBoxes();
    addPermaLinkFor('.ltx_theorem[id]:has(>h6.ltx_title.ltx_title_theorem)',
		    'h6.ltx_title.ltx_title_theorem');
    //addPermaLinkFor('figure.marginnote','figcaption');
    addPermaLinkFor('span.ltx_figure','span.ltx_caption')
    addAtoZindex();
    fixFirefoxAnchorBug();
}

function addPermaLinkFor(parents,child) {
    if ( window.$ && window.jQuery && $===jQuery ) {
        $(parents+':has(>'+child+')').each(function() {
            $(this).children(child).first()
                .append('<a class="permaLink" title="Permalink" href="#'+this.id+'">\u00B6</a>');
            });
    }
}

function addAtoZindex() {
    if ( document.querySelector('section.ltx_index ul.ltx_indexlist') ) {
        const indexEntries = Array.from(document.querySelectorAll('section.ltx_index > ul.ltx_indexlist > li.ltx_indexentry'));
        // the first few entries are math, and shouldn't be counted with the A-Z
        // this wouldn't work if the first non-math entry also had some math in it
        while ( indexEntries[0].querySelector('.ltx_Math') ) {
            indexEntries.shift();
        }
        indexEntries.forEach(readIndexEntry);
        const divTag = document.createElement('div');
        divTag.id = 'indexAtoZ';
        document.querySelector('h1.ltx_title.ltx_title_index')
            .insertAdjacentElement('afterend',divTag);
        Object.entries(entriesIn).forEach(wrapEntries);
        // todo latexml https://github.com/brucemiller/LaTeXML/issues/1731
        Array.from(document.querySelectorAll('.ltx_indexentry span[style="font-size:90%;"]'))
            .forEach( function(span) {
                span.removeAttribute('style');
            });
    }
}

function readIndexEntry(indexEntry) {
    const firstLetter = indexEntry.id.charAt(0).toLocaleUpperCase();
    if ( entriesIn[firstLetter] ) {
        entriesIn[firstLetter].push(indexEntry);
    } else {
        entriesIn[firstLetter] = [indexEntry];
    }
}

function wrapEntries([firstLetter,indexEntriesForLetter]) {
    const aTag = document.createElement('a');
    aTag.setAttribute('href','#'+firstLetter+'_entries');
    aTag.textContent = firstLetter;
    document.getElementById('indexAtoZ').appendChild(aTag);
    const liTag = document.createElement('li');
    liTag.id = firstLetter+'_entries';
    liTag.className = 'entry_wrapper';
    const spanTag = document.createElement('span');
    spanTag.textContent = firstLetter;
    liTag.appendChild(spanTag);
    const ulTag = document.createElement('ul');
    liTag.appendChild(ulTag);
    indexEntriesForLetter[0].insertAdjacentElement('beforebegin',liTag);
    indexEntriesForLetter.forEach( function(entry) {
        ulTag.appendChild(entry);
    })
}

function spaceOutMarginBoxes() {
    if ( window.$ && window.jQuery && $===jQuery ) {
        lastMarginBoxBottom = 0;
        $('span.ltx_note.ltx_role_margin span.ltx_note_content').each(spaceOutBox);
    }
}

function spaceOutBox() {
    const thisJq = $(this);
    const offset = thisJq.offset();
    if ( offset.top < lastMarginBoxBottom+minSepPixels ) {
        offset.top = lastMarginBoxBottom+minSepPixels;
        thisJq.offset(offset);
    }
    lastMarginBoxBottom = offset.top + thisJq.height();
}

/** Taken from Python docs
 *  workaround a firefox bug
 *  see: https://bugzilla.mozilla.org/show_bug.cgi?id=645075
 *  this has been closed as fixed, but doesn't seem fixed */
function fixFirefoxAnchorBug() {
    if (document.location.hash) {
        window.setTimeout(function() {
                document.location.href += '';
        }, 10);
    }
}
