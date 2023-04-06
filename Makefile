NAME ?= vkr
ENGINE ?= xelatex # Only `xelatex` or `lualatex` are allowed here

.PHONY: $(NAME).pdf clean dist-clean depext depext-deb

all: $(NAME).pdf

$(NAME).pdf:
	latexmk -$(ENGINE) -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape $(NAME).tex

clean:
	latexmk -c $(NAME).tex

dist-clean:
	latexmk -C $(NAME).tex

aspell:
	aspell --mode=tex -l ru --home-dir=. --personal=personal_dict.txt  -c $(FILE)

depext: depext-deb

# Not a full list of external dependencies. To be extended...
depext-deb:
	sudo apt install fonts-cmu texlive-lang-cyrillic texlive-xetex texlive-bibtex-extra texlive-science texlive-plain-generic --yes
  # for pzdr font
	sudo apt install texlive-fonts-recommended --yes
	sudo apt install hunspell-ru --yes
