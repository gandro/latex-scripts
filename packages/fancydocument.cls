\ProvidesClass{fancydocument}
\LoadClass[a4paper,12pt]{article}

\RequirePackage{fancyger}
\RequirePackage{fancypdf}
\RequirePackage{fancycode}

\RequirePackage{palatino}
\RequirePackage{fullpage}

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\linespread{1.1}

\makeatletter
	\renewcommand{\title}[1]{
		\renewcommand{\@title}{#1}
		\newcommand{\thetitle}{#1}
	}

	\pagestyle{fancy}
	\fancyhf{}

	\fancyhead[L]{\thetitle}
	\fancyhead[R]{\nouppercase{\rightmark}}

	\fancyfoot[C]{Seite \thepage{} von \pageref{LastPage}}

	\setlength{\headheight}{16pt}
	\setlength{\headsep}{12pt}
	\renewcommand{\headrulewidth}{0.4pt}

	\renewcommand{\footrulewidth}{0.4pt}
\makeatother
