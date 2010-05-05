%  %NAME%    : reportUDS
%  %AUTHOR%  : Virgile Gerecke - Université de Strasbourg
%  %EMAIL%   : virgile.gerecke@unistra.fr
%  %VERSION% : v2.0
%% 
%% This is file `reportUDS.cls'.

%    ****************************************
%    *             PREAMBULE                *
%    ****************************************

\NeedsTeXFormat{LaTeX2e}

\RequirePackage[T1]{fontenc}
\RequirePackage{geometry} % see geometry.pdf on how to lay out the page. There's lots.
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

\ProvidesClass{reportUDS}[2009/12/01 v2.0]

\LoadClass[a4paper,11pt]{report}

%    ****************************************
%    *             MISE EN PAGE             *
%    ****************************************
%
\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial
\renewcommand{\headrulewidth}{0pt} % Suppression de la ligne d'en tete

\geometry{margin={65pt}}
\fancyhf{} % Suppression du style existant
 
\fancypagestyle{plain} % Style de la premiere page
{
\lfoot{\Projet}
\rfoot{\@title}
\rhead
{
\vspace{-10mm}
\raisebox{-6mm}{
\includegraphics[scale=0.2]{logo-uds.pdf}}
}
\lhead{\Emetteur}
\cfoot{\thepage / \pageref{LastPage}}
}	 

\fancypagestyle{fancyplain} % Style des pages suivantes
{
\setlength{\textheight}{250mm}  	% Hauteur de la zone de texte
\setlength{\headsep}{10mm}  	% Entre le haut de page et le texte 

\lfoot{\Projet}
\rfoot{\@title}
\rhead
{
\vspace{-10mm}
\raisebox{-6mm}{
\includegraphics[scale=0.2]{logo-uds.pdf}}
}
\lhead{\Emetteur}
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

\newenvironment{version}[1]
{
\def\Version{#1}
}

\version{}

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

%    ****************************************
%    *          Tableau de revisions               *
%    ****************************************
%
\newenvironment{revision}[4]
{
 #1 & #2 & #3 & #4\\
 \hline
}

\newenvironment{revisions}
{
\section*{Mises à jour du document}
\begin{tabular}{|p{0.09\textwidth}|p{0.13\textwidth}|p{0.25\textwidth}|p{0.38\textwidth}|}
\hline
\textbf{Version} & \textbf{Date} & \textbf{Rédacteur} & \textbf{Objet de la mise à jour}\\
\hline
}
{
\end{tabular}
}

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
\begin{tabular}{p{0.3\textwidth}|p{0.56\textwidth}}
  \textbf{Dernière mise à jour} &  \@date \\
  \textbf{Version} & \Version\\
  \textbf{Etat} & \Etat \\
  \textbf{Pages} & \pageref{LastPage} \\
  \textbf{Diffusion} & \Diffusion \\
\end{tabular}
};
\end{tikzpicture}

 \vskip 40\p@
\begin{tikzpicture}
\node [fill=shade,rounded corners=5pt]
{
\begin{tabular}{p{0.3\textwidth}|p{0.56\textwidth}}
  \textbf{Objet} & \Objet  \\
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
