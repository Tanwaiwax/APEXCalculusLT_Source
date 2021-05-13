ORDER = main pt1 pt2
LATEXMLBIN = ../../../LaTeXML/bin
VERBOSITY = --quiet --quiet
#--verbose --verbose
#

define \n


endef

all: $(foreach base,$(ORDER),$(base).html)

%.xml: %.tex
	$(LATEXMLBIN)/latexml --dest=$*.xml $* $(VERBOSITY)

PRESCANCMD = $(LATEXMLBIN)/latexmlpost --prescan --split --db=my.db $(VERBOSITY)
NOSCANCMD  = $(LATEXMLBIN)/latexmlpost  --noscan --split --db=my.db $(VERBOSITY)

my.db: $(foreach base,$(ORDER),$(base).xml)
	$(foreach base,$(ORDER), $(PRESCANCMD) --dest=$(base).html $(base) ${\n} )

%.html: my.db %.xml
	$(NOSCANCMD) --dest=$*.html $*.xml
