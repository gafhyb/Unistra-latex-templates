%  %NAME%    : reportUDS
%  %AUTHOR%  : Virgile Gerecke - Université de Strasbourg
%  %EMAIL%   : virgile.gerecke@unistra.fr
%  %VERSION% : v1.0
%% 
%% This is file `reportUDS.cls'.

%    ****************************************
%    *             PREAMBULE                *
%    ****************************************

\LoadClass[a4paper,11pt]{report}

\NeedsTeXFormat{LaTeX2e}

\RequirePackage{geometry} % see geometry.pdf on how to lay out the page. There's lots.
%\RequirePackage[utf8]{inputenc}
\RequirePackage[francais]{babel}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\urlstyle{same}
\RequirePackage{lastpage}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{textcomp}
\RequirePackage{color}

\RequirePackage{fontspec}
\RequirePackage{unicode-math}

\ProvidesClass{reportUDS}[2017/10/30 v2.0]

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Scale=0.85]{Unistra A}

\newfontfamily\bodyfont[]{Unistra A}
\newfontfamily\picto[]{Unistra Symbol}
\newfontfamily\encadre[]{Unistra Encadre}
\newfontfamily\headingfont[Scale=0.85]{Unistra A}

\newcommand{\unistra}{\fontfamily{Unistra A}\selectfont} % Latin Modern Roman


\newenvironment{service}[1]
{\def\svc{#1}
}

\newenvironment{organisme}[1]
{\def\orgunit{#1}
}

\newenvironment{pictoList}[1]
{\def\pictos{#1}
}

\newcommand\logo
{\begin{textblock*}{65mm}[0,0](10mm,15mm)
{\color{red} \fontsize{60}{70} \picto \pictos}\\
~{\Large \encadre (\svc\_))\_)\vspace*{-0.075\baselineskip} \hspace*{10mm}(\_)))\orgunit)\_)}
\end{textblock*}}

%    ****************************************
%    *             MISE EN PAGE             *
%    ****************************************
%
\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial
\renewcommand{\headrulewidth}{0pt} % Suppression de la ligne d'en tete

\geometry{margin={50pt}}
\fancyhf{} % Suppression du style existant
 
\fancypagestyle{plain} % Style de la premiere page
{
\lfoot{\tp}
\cfoot{\thepage / \pageref{LastPage}}
}	 

\fancypagestyle{fancyplain} % Style des pages suivantes
{

\fancyhf{}
\setlength{\textheight}{270mm}  	% Hauteur de la zone de texte
\setlength{\headsep}{0mm}  	% Entre le haut de page et le texte 
\lfoot{\tp}
\cfoot{\thepage / \pageref{LastPage}}
\rfoot{\encadre (\svc\_))\_)}
}

%    ****************************************
%    *          VARIABLES                   *
%    ****************************************
%

\newenvironment{titrePage}[1]
{
\def\tp{#1}
}

\renewcommand\maketitle{\begin{titlepage}%
  \begin{figure}[h]
  \vspace{10mm}
  \hspace{-10mm}
 \logo
  \vspace{50mm}
  \end{figure}
  \vspace{-50mm}

  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}



\AtBeginDocument{%
\pagestyle{fancyplain}
 
}%
