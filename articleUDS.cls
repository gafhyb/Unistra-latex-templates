%  %NAME%    : ArticleUDS
%  %AUTHOR%  : Virgile Gerecke - Université de Strasbourg
%  %EMAIL%   : virgile.gerecke@unistra.fr
%  %VERSION% : v2.0
%% 
%% This is file `articleUDS.cls'.

%    ****************************************
%    *             PREAMBULE                *
%    ****************************************

\NeedsTeXFormat{LaTeX2e}

\RequirePackage[paper=a4paper]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[francais]{babel}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{color}
\urlstyle{sf}
\RequirePackage{lastpage}
\RequirePackage{tikz}
\RequirePackage{bbding}
\RequirePackage{ifmtarg}

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
\lfoot{\Projet}
\rfoot{\@title}
\lhead
{
\vspace{-10mm}
\raisebox{-6mm}{
\includegraphics[scale=0.2]{logo-uds.pdf}}
}
\rhead{\Emetteur}
\cfoot{\thepage / \pageref{LastPage}}
}

\fancypagestyle{fancyplain} % Style des pages suivantes
{
\setlength{\textheight}{250mm}  	% Hauteur de la zone de texte
\setlength{\headsep}{10mm}  	% Entre le haut de page et le texte 

\lfoot{\Projet}
\rfoot{\@title}
\lhead
{
\vspace{-10mm}
\raisebox{-6mm}{
\includegraphics[scale=0.2]{logo-uds.pdf}}
}
\rhead{\Emetteur}
\cfoot{\thepage / \pageref{LastPage}}
}

\definecolor{shade}{HTML}{DDDDDD}

%    ****************************************
%    *          VARIABLES                   *
%    ****************************************
%

\newenvironment{projet}[1]
{
\def\Projet{#1}
}

\projet{}

\newenvironment{emetteur}[1]
{
\def\Emetteur{#1}
}

\emetteur{}

\newenvironment{etat}[1]
{
\def\Etat{#1}
}

\etat{}

\newenvironment{objet}[1]
{
\def\Objet{#1}
}

\objet{}

\newenvironment{diffusion}[1]
{
\def\Diffusion{#1}
}

\diffusion{}

\newenvironment{presents}[1]
{
\def\Presents{#1}
}

\presents{}

\newenvironment{excuses}[1]
{
\def\Excuses{#1}
}

\excuses{}

\newenvironment{absents}[1]
{
\def\Absents{#1}
}

\absents{}

%    ****************************************
%    *          Page de garde                   *
%    ****************************************
%

\renewcommand\maketitle{\begin{titlepage}%
  \begin{figure}[h]
  \vspace{10mm}
  \hspace{1mm}
  \includegraphics[scale=0.6]{logo-uds.pdf}
  \vspace{50mm}
  \end{figure}
  \vspace{-92mm}

\hspace*{0.45\linewidth}
\begin{minipage}[t][-35mm]{0.55\linewidth}
{\Huge \Projet}
\bigskip
\bigskip
\bigskip

{\Large \@title}
\end{minipage}


  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  
  \null\vfil
  \vskip 40\p@

\begin{tikzpicture}
\node [fill=shade,rounded corners=5pt]
{
\begin{tabular}{p{0.2\textwidth}|p{0.66\textwidth}}
  \textbf{Date} &  \@date \\
  \textbf{Etat} & \Etat \\
  \textbf{Pages} & \pageref{LastPage} \\
  \textbf{Diffusion} & \Diffusion \\
\end{tabular}
};
\end{tikzpicture}

\@ifmtarg{\Objet}{
 \vskip 40\p@
\begin{tikzpicture}
\node [fill=shade,rounded corners=5pt]
{
\begin{tabular}{p{0.2\textwidth}|p{0.66\textwidth}}
  \textbf{Objet} & \Objet  \\
\end{tabular}
};
\end{tikzpicture}
}

 \vskip 40\p@
 \begin{tikzpicture}
 \node [fill=shade,rounded corners=5pt]
 {
 \begin{tabular}{p{0.2\textwidth}|p{0.66\textwidth}}
   \textbf{Présents} & \Presents  \\
%   \textbf{Excusé(s)} & \Excuses  \\
 \@ifmtarg{\Absents}{  \textbf{Absent(s)} & \Absents  \\}
 \end{tabular}
 };
 \end{tikzpicture}
 


  \par
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
