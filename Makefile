PACKAGES=".:./packages/:"
GENERATED=generated

ifneq ($(MAKECMDGOALS),new)
	include .PROJECT
endif

all: $(GENERATED)/$(PROJECT).pdf

new:
	@echo -n "Please enter project name: " ; \
	read PROJECT ; \
	echo "PROJECT=$${PROJECT}" > .PROJECT ; \
	cp packages/template.tex $${PROJECT}.tex

pdf: $(GENERATED)/$(PROJECT).aux
	env TEXINPUTS=$(PACKAGES) pdflatex -output-directory=$(GENERATED)/ $(PROJECT).tex

view: $(GENERATED)/$(PROJECT).pdf
	exo-open $(GENERATED)/$(PROJECT).pdf

$(GENERATED)/$(PROJECT).pdf:
	$(MAKE) pdf

$(GENERATED)/$(PROJECT).aux: $(PROJECT).tex
	env TEXINPUTS=$(PACKAGES) pdflatex -output-directory=$(GENERATED)/ -draftmode $(PROJECT).tex

clean:
	rm -f $(GENERATED)/*.{log,toc,aux,out}

cclean: clean
	rm -f $(GENERATED)/*.pdf

.PROJECT:
	$(error Please run "make new" first)

.PHONY: clean cclean pdf view new
