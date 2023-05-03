%  %NAME%    : LettreUDS
%  %AUTHOR%  : Virgile Gerecke - Université de Strasbourg
%  %EMAIL%   : virgile.gerecke@unistra.fr
%  %VERSION% : v1.0
%% 
%% This is file `lettreUDS.cls'.

%    ****************************************
%    *             PREAMBULE                *
%    ****************************************

\LoadClass[a4paper,10pt]{letter}

\NeedsTeXFormat{LaTeX2e}

\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{helvet}
\RequirePackage{fancyhdr}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{textcomp}

\RequirePackage[quiet]{fontspec}
% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Unistra A}
\newfontfamily\unistraSymbol[]{Unistra Symbol}
\newfontfamily\encadre[]{Unistra Encadre}
\newfontfamily\headingfont[Scale=0.85]{Helvetica Neue Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Scale=0.85]{Unistra A}

\ProvidesClass{lettreUDS}[2009/10/30 v2.0]

%    ****************************************
%    *             MISE EN PAGE             *
%    ****************************************
%
%\TPshowboxestrue % commenter une fois fini
%\TPshowboxesfalse % décommenter pour faire disparaitre les boites
\textblockorigin{0mm}{0mm} % origine des positions

\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial

\setlength{\oddsidemargin}{40mm}  	% Marge gauche sur pages impaires
\setlength{\evensidemargin}{40mm} 	% Marge gauche sur pages paires 
\setlength{\textwidth}{133mm}  	% Largeur de la zone de texte
\setlength{\headsep}{20mm}  	% Entre le haut de page et le texte 
\setlength{\textheight}{225mm}  	% Hauteur de la zone de texte

\pagestyle{empty}

%    ****************************************
%    *          ENVIRONNEMENTS              *
%    ****************************************
%

\newenvironment{expediteur}
{\begin{textblock*}{41mm}[0,0](10mm,225mm)
\footnotesize
}
{\end{textblock*}}

\newenvironment{departement}
{\begin{textblock*}{41mm}[0,0](10mm,260mm)
\footnotesize
}
{\\
\textbf{www.unistra.fr}
\end{textblock*}}

\newenvironment{destinataire}
{
\hspace*{0.3\linewidth}
\begin{minipage}[t][35mm]{0.7\linewidth}
}
{
\end{minipage}
}

\newenvironment{service}[1]
{\def\svc{#1}
}

\newenvironment{organisme}[1]
{\def\orgunit{#1}
}

\newenvironment{symboles}[1]
{\def\unistraSymbols{#1}
}

\newcommand\logo
{\begin{textblock*}{45mm}[0,0](10mm,15mm)
\ifdefined\unistraSymbols
{\color{red} \fontsize{60}{70} \unistraSymbol \unistraSymbols}\\
\fi
~{\Large \encadre (\svc\_))\_)\vspace*{-0.075\baselineskip} \hspace*{10mm}(\_)))\orgunit)\_)}
\end{textblock*}}

\newenvironment{lieu}[1]
{{
#1, le \today}

}

\newenvironment{objet}[1]
{\textbf{
Objet : #1\\}
}

\newenvironment{reference}[1]
{{\footnotesize
Réf. : #1}

}

\newenvironment{ouverture}[1]
{
#1

}

\newenvironment{signataire}[1]
{
	
\hspace*{0.4\linewidth}
\begin{minipage}[b][15mm]{0.7\linewidth}
#1
\end{minipage}
}

\fancypagestyle{plain}{
\bodyfont
\setlength{\textheight}{215mm}  	% Hauteur de la zone de texte
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
%\fancyfoot[R]{\includegraphics[scale=0.20]{logo-uds.pdf} \vspace{-10mm}}
}

\AtBeginDocument{%
\pagestyle{plain}
\thispagestyle{empty}

 \@donnees

\logo
}%

\def\@donnees{\makeatletter
         \input{default.ins}%
         \makeatother}%
