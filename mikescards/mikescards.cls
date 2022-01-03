
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mikescards}[2022/01/03 Mike's Recipe Cards class]

\RequirePackage{
  calc,
  ifthen,
  boxedminipage,
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

% \newlength{\@ingredientlist} \newlength{\@cardheight}


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
  \noindent\textbox{#1\hfill}\textbox{\hfil #3\hfil}\textbox{\hfill #2}
  % create spacing and horizontal rule. 
  % docs: https://tex.stackexchange.com/questions/371286/draw-a-horizontal-line-in-latex/371469
  % \par\noindent\rule[4pt]{\textwidth}{1.0pt}
  \vspace{3pt}\hrule\relax\vspace{3pt}
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






% \textbox is used for constructing the title line
\newcommand\textbox[1]{%
  \parbox{.333\textwidth}{#1}%
}

\renewcommand{\normalsize}{
  \fontsize{10pt}{12pt}%
  \usefont{T1}{ptm}{m}{n}%
  \selectfont
}

\setcounter{secnumdepth}{0}