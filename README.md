This is a LaTeX class for creating scientific posters in the corporate design
of the
[Institute for Web Science and Technologies (WeST)](http://west.uni-koblenz.de/).
It's style was adapted by Lukas from the
`WeST - Poster Template - 2015-03-23.ppt` powerpoint template.
It is implemented as a theme for LaTeX poster class
[tikzposter](https://www.ctan.org/pkg/tikzposter), so you should probably
have a look at its manual.

## Usage

Have a look [example_poster.tex](blob/master/example_poster.tex) for how to use
this class.

Currently the code can only be build using
[LuaLaTex](https://www.ctan.org/pkg/lualatex-doc), so make sure you have that
installed.
For compilation [latexmk](https://www.ctan.org/pkg/latexmk/) is recommended, if
you have it installed you just have to perform:

    git clone https://github.com/Institute-Web-Science-and-Technologies/WeSTposter.git
    cd WeSTposter
    latexmk

Of course you can also compile this class by calling `lualatex` manually.

Currently only A0 is supported as a paper size.

## ToDo

Bus:

- Vertical spacing between title and content depending on title size.
- Vertical spacing between paragraphs.
- Vertical spacing between items in itemize environment (`\itemsep`).
- Move all code from packages section of .tex file into .cls file.
- Have better example content.

Additional Features:

- Supporting paper sizes other than A0.
- Subtitle command.
- Improve design of author field (move to the left?).
- Optional author picture.
- Support other latex engines (`pdftex`, etc).
