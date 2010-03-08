%  %NAME%    : ArticleUDS
%  %AUTHOR%  : Virgile Gerecke - Université de Strasbourg
%  %EMAIL%   : virgile.gerecke@unistra.fr
%  %VERSION% : v1.0
%% 
%% This is file `articleUDS.cls'.

%    ****************************************
%    *             PREAMBULE                *
%    ****************************************

\NeedsTeXFormat{LaTeX2e}

\RequirePackage{geometry} % see geometry.pdf on how to lay out the page. There's lots.
\RequirePackage[utf8]{inputenc}
\RequirePackage[francais]{babel}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\urlstyle{sf}
\RequirePackage{lastpage}

\ProvidesClass{articleUDS}[2009/10/22 v1.0]

\LoadClass[a4paper,11pt]{article}

%    ****************************************
%    *             MISE EN PAGE             *
%    ****************************************
%
\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial
\renewcommand{\headrulewidth}{0pt} % Suppression de la ligne d'en tete

\geometry{margin={50pt}}
\fancyhf{} % Suppression du style existant
\setlength{\textheight}{255mm}  	% Hauteur de la zone de texte 
 
\fancypagestyle{plain} % Style de la premiere page
{
\setlength{\headsep}{10mm}  	% Entre le haut de page et le texte 
\lhead{\includegraphics[scale=0.4]{logo-uds.pdf}}
\rfoot{}
\lfoot{\tp}
}	 

\fancypagestyle{fancyplain} % Style des pages suivantes
{
\setlength{\textheight}{250mm}  	% Hauteur de la zone de texte
\setlength{\headsep}{-10mm}  	% Entre le haut de page et le texte 
\rfoot{\vspace{-8mm}\includegraphics[scale=0.2]{logo-uds.pdf}}
\lfoot{\tp}
\cfoot{\thepage / \pageref{LastPage}}
}

%    ****************************************
%    *          VARIABLES                   *
%    ****************************************
%

\newenvironment{titrePage}[1]
{
\def\tp{#1}
}

\AtBeginDocument{%
\pagestyle{fancyplain}
 
}%