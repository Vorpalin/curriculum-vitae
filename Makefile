# Compile les CV (une/deux colonnes x fr/en) dans build/
# Usage : make          -> tous les PDF
#         make build/cv_two_columns_fr.pdf
#         make clean
TEMPLATES := cv_one_column cv_two_columns
LANGS     := fr en
PDFS      := $(foreach t,$(TEMPLATES),$(foreach l,$(LANGS),build/$(t)_$(l).pdf))

.PHONY: all clean
all: $(PDFS)

define build_rule
build/$(1)_$(2).pdf: $(1).tex content/$(2).tex content/personal.tex $(wildcard photo.jpg)
	@mkdir -p build
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build \
	  -jobname=$(1)_$(2) "\def\cvlang{$(2)}\input{$(1).tex}" > build/$(1)_$(2).log.txt \
	  || (tail -n 30 build/$(1)_$(2).log.txt; exit 1)
endef
$(foreach t,$(TEMPLATES),$(foreach l,$(LANGS),$(eval $(call build_rule,$(t),$(l)))))

clean:
	rm -rf build
