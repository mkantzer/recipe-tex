\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mikescards}[2022/01/03 Mike's Recipe Cards class]

\RequirePackage{
  calc,
  ifthen,
  boxedminipage,
  xparse,
  % fancyhdr
}

% set up deafult geometry
\RequirePackage[
  a6paper,
  landscape,
  noheadfoot,
  margin=10.0pt,
  % showframe,
]{geometry}

\DeclareOption{nothing}{\relax}
\DeclareOption*{\typeout{What's \CurrentOption?}}

\ProcessOptions\relax


% \newenvironment{boxed}{before}{after}
% the recipe environment expects 2 arguments: the first is the _name_ of the recipe, the second is the length of time to cook it. We may later expand this to _also_ include source. Alternatively, these may end up being set above or inside the block. Not sure yet. 
\newenvironment{recipe}[3]{%
  % begining code
  % Essentially, the idea is to, at the _begining_ of the environment, do a bunch of set-up:
  % - render the title line (that should only be informed by the arguments)
  % - create/initialize any lists that need initializing (specifically: ingredients, steps)
  % - create/manage the various blocks that the sheet is made of, especially if using boxed/minipage
  % -----------
  % Write the header line:
  % docs: https://tex.stackexchange.com/questions/55472/how-to-make-text-aligned-left-center-right-in-the-same-line
  \titleline[t]{#1}{#2}{#3}
  % create spacing and horizontal rule. 
  % docs: https://tex.stackexchange.com/questions/371286/draw-a-horizontal-line-in-latex/371469
  \vspace{1pt}\hrule\relax\vspace{3pt}
}{
  % ending code
  % Here goes the code that gets run at the _end_ of your enviornment block. 
  % This basically finalizes everything. 
  % This _probably_ also renders the contents of the environment?
  % - assuming within env, we add to lists of ingredients and steps
  % - render ingredients into their column on the left
  % - render steps into their column on the right
  % - render any added notes in italics at the end?
}


% Constructing the title box
\newcommand\titleline[4][t]{%
  \noindent\parbox[#1]{.333\textwidth}{\raggedright{\textbf{#2}}}%
  \parbox[#1]{.333\textwidth}{\centering\emph{#4}}%
  \parbox[#1]{.333\textwidth}{\raggedleft{#3}}\par%
}

\renewcommand{\normalsize}{
  \fontsize{10pt}{12pt}%
  \usefont{T1}{ptm}{m}{n}%
  \selectfont
}

\setcounter{secnumdepth}{0}


% list management
% source: https://tex.stackexchange.com/questions/489335/create-a-list-through-commands
