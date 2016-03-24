% !Mode:: "TeX:UTF-8"

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WeSTposter}[2016/02/14 v1.0 WeSTPoster]


% ==============================================================================
% Data

\newcommand*\authormail[1]{\def\@authormail{#1}}


% ==============================================================================
% Document Class

\LoadClass[
  a0paper, % paper format
  portrait, % portrait vs landscape
]{tikzposter}


% ==============================================================================
% Packages

\newcommand*\RequireOptionsPackage[2][]{
  \PassOptionsToPackage{#1}{#2}
  \RequirePackage{#2}
}


% Ability to change line height locally via \setstretch
\RequirePackage{setspace}

% Position TikZ elements relative to each other
\usetikzlibrary{positioning}

% For different arrow tips
\usetikzlibrary{arrows.meta}

% Font selection.
\RequirePackage{fontspec}

% Micro-typographic extensions.
\RequirePackage{microtype}


% ==============================================================================
% Theme

% Use Sans-Serif
\renewcommand{\familydefault}{\sfdefault}

% Font Families
\setsansfont{TeX Gyre Heros} % Sans-serif

% Font Sizes
\renewcommand{\tiny}{\fontsize{17.28}{22}\selectfont}
\renewcommand{\scriptsize}{\fontsize{20.74}{25}\selectfont}
\renewcommand{\footnotesize}{\fontsize{24.88}{30}\selectfont}
\renewcommand{\small}{\fontsize{29.86}{37}\selectfont}
% \renewcommand{\tiny}{\fontsize{20.74}{25}\selectfont}
% \renewcommand{\scriptsize}{\fontsize{24.88}{30}\selectfont}
% \renewcommand{\footnotesize}{\fontsize{29.86}{37}\selectfont}
% \renewcommand{\small}{\fontsize{35.83}{45}\selectfont}
\renewcommand{\normalsize}{\fontsize{35.83}{45}\selectfont}
\renewcommand{\large}{\fontsize{43}{54}\selectfont}
\renewcommand{\Large}{\fontsize{51.6}{64}\selectfont}
\renewcommand{\LARGE}{\fontsize{61.92}{77}\selectfont}
\renewcommand{\huge}{\fontsize{80}{90}\selectfont}
\renewcommand{\Huge}{\fontsize{100}{120}\selectfont}

% Increase space between bullet points and items
\setlength\labelsep{\dimexpr\labelsep + 25pt\relax}
\setlength\leftmargini{\dimexpr\leftmargini + 25pt\relax}

% Disable "LaTeX TikZ poster" comment in bottom right corner
\tikzposterlatexaffectionproofoff

% Colorpalette -----------------------------------------------------------------
\definecolorpalette{WeST}{
  % WeST-Blue, WeST-Orange, WeST-Red
  \definecolor{colorOne}{HTML}{0C3875}
  \definecolor{colorTwo}{HTML}{FFAE00}
  \definecolor{colorThree}{HTML}{DD4814}
}

% Colorstyle -------------------------------------------------------------------
\definecolorstyle{WeST}{
  % WeST-Blue, WeST-Orange, WeST-Red
  \definecolor{colorOne}{HTML}{0C3875}
  \definecolor{colorTwo}{HTML}{FFAE00}
  \definecolor{colorThree}{HTML}{DD4814}
}{
  % Background Colors
  \colorlet{backgroundcolor}{white}
  \colorlet{framecolor}{colorOne}
  % Title Colors
  \colorlet{titlefgcolor}{colorOne}
  \colorlet{titlebgcolor}{white}
  % Block Colors
  \colorlet{blocktitlebgcolor}{white}
  \colorlet{blocktitlefgcolor}{colorOne}
  \colorlet{blockbodybgcolor}{white}
  \colorlet{blockbodyfgcolor}{black}
  % Innerblock Colors
  \colorlet{innerblocktitlebgcolor}{colorTwo}
  \colorlet{innerblocktitlefgcolor}{black}
  \colorlet{innerblockbodybgcolor}{white}
  \colorlet{innerblockbodyfgcolor}{black}
  % Note colors
  \colorlet{notefgcolor}{black}
  \colorlet{notebgcolor}{colorThree}
  \colorlet{notefrcolor}{black}
}

% Backgroundstyle --------------------------------------------------------------
\definebackgroundstyle{WeST}{
  \fill[inner sep = 0pt, line width = 0pt, color = backgroundcolor]
    (bottomleft) rectangle (topright);
  \node[below, inner sep = 0] (bg_top) at (0, 0.5\textheight)
    {\includegraphics[width = \paperwidth]{bg_top}};
  \node[above, inner sep = 0] (bg_bot) at (0, -0.5\textheight)
    {\includegraphics[width = \paperwidth]{bg_bot}};
  \node[left = 20pt of bg_top.east, inner sep = 5pt, fill = white, draw = black,
      thick]
    (logo_west) {\includegraphics[height = 180pt]{logo_west}};
  \node[above right = 40pt and 40pt of bg_bot.north west, inner sep = 0]
    (logo_uni) {\includegraphics[height = 120pt]{logo_uni}};
}

% Titlestyle -------------------------------------------------------------------
\definetitlestyle{WeST}{
  titletotopverticalspace = 0.085\textheight,
  titletoblockverticalspace = -170pt,
}{
  \node[right = 120pt of logo_uni, align = left] {
     \textbf{\@author}\\[0.25em]
     \@institute\\[0.2em]
     \texttt{\@authormail}
  };
%   \node[text = colorThree, font = \bfseries, rotate = -45]
%     at (0.38\textwidth, 0.36\textheight) {\huge Phd Proposal};
}

% Remove author and institute from title because we typeset them ourselves
\settitle{
  \centering
  \setstretch{1.1}
  \fontsize{160}{180}\selectfont
  \textcolor{titlefgcolor}{
    \textbf{\@title}
  }
}

% Remove \scalebox around title so words can break
\renewcommand*\title[1]{\gdef\@title{#1}}

% Blockstyle -------------------------------------------------------------------
\defineblockstyle{WeST}{
  titlecenter,
  bodyoffsety = -0.5cm,
  linewidth = 0.15cm,
  titleinnersep = 1cm,
  bodyinnersep = 1cm,
}{
  \begin{scope}[line width = \blocklinewidth,
      rounded corners = \blockroundedcorners]
    \ifBlockHasTitle
      \draw[color = blocktitlefgcolor, shorten >= 1cm, shorten <= 1cm]
        (blocktitle.south west) -- (blocktitle.south east);
    \fi
  \end{scope}
}

% Innerblockstyle --------------------------------------------------------------
\defineinnerblockstyle{WeST}{
  titlecenter,
  titleinnersep = 0.5cm,
  bodyinnersep = 0.5cm,
}{
  \begin{scope}[line width = \blocklinewidth,
     rounded corners = \blockroundedcorners]
     \ifInnerblockHasTitle
       \draw[color = innerblocktitlebgcolor, fill=innerblocktitlebgcolor]
         (innerblockbody.south west) rectangle (innerblocktitle.north east);
     \else
       \draw[color = innerblocktitlebgcolor, fill=innerblocktitlebgcolor]
         (innerblockbody.south west) rectangle (innerblockbody.north east);
     \fi
  \end{scope}
}

% Layouttheme ------------------------------------------------------------------
\definelayouttheme{WeST}{
  \usecolorstyle{WeST}
  \usebackgroundstyle{WeST}
  \usetitlestyle{WeST}
  \useblockstyle{WeST}
  \useinnerblockstyle{WeST}
  \usenotestyle{Default}
}

% Redefine tikzfigure environment for different style
\renewenvironment{tikzfigure}[1][]{
  \def \rememberparameter{#1}
  \vspace{10pt}
  \refstepcounter{figurecounter}
}{
  \ifx\rememberparameter\@empty
  \else %nothing
    \\[10pt]
    \textbf{Fig.~\thefigurecounter}: \rememberparameter
  \fi
}

\usetheme{WeST}
