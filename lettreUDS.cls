%  %NAME%    : LettreUDS
%  %AUTHOR%  : Virgile Gerecke - Université de Strasbourg
%  %EMAIL%   : virgile.gerecke@unistra.fr
%  %VERSION% : v1.0
%% 
%% This is file `lettreUDS.cls'.

%    ****************************************
%    *             PREAMBULE                *
%    ****************************************

\NeedsTeXFormat{LaTeX2e}

\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage[utf8]{inputenc}
\RequirePackage[francais]{babel}
\RequirePackage{graphicx}
\RequirePackage{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{textcomp}

\ProvidesClass{lettreUDS}[2009/08/22 v1.0]

\LoadClass[a4paper,10pt]{letter}

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

\newenvironment{service}
{\begin{textblock*}{45mm}[0,0](10mm,100mm)
\bf
\footnotesize
}
{\end{textblock*}}

\newenvironment{expediteur}
{\begin{textblock*}{45mm}[0,0](10mm,125mm)
\footnotesize
}
{\end{textblock*}}

\newenvironment{departement}
{\begin{textblock*}{45mm}[0,0](10mm,270mm)
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

\newcommand\logo
{\begin{textblock*}{45mm}[0,0](10mm,15mm)
\includegraphics[scale=0.37]{logo-uds.pdf}
\end{textblock*}}

\newenvironment{lieu}[1]
{{\footnotesize
#1, le \today}

}

\newenvironment{objet}[1]
{{\footnotesize
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
\setlength{\textheight}{215mm}  	% Hauteur de la zone de texte
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[R]{\includegraphics[scale=0.20]{logo-uds.pdf} \vspace{-10mm}}
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
