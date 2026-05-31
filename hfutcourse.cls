% hfutcourse.cls — 合肥工业大学课程设计 LaTeX 模板
% 编译方式：latexmk 或 xelatex 两次
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hfutcourse}[2026/06/01 v2.0 HFUT Course Design Template]

% ===== 选项处理 =====
\newif\ifhfut@noto
\DeclareOption{noto}{\hfut@nototrue\PassOptionsToClass{fontset=none}{ctexart}}
\DeclareOption{fontset=noto}{\hfut@nototrue\PassOptionsToClass{fontset=none}{ctexart}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[UTF8,a4paper,12pt]{ctexart}

% ===== 依赖包 =====
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amssymb}
\RequirePackage{hyperref}
\hypersetup{hidelinks}
\graphicspath{{assets/}{./}}

% ===== Noto 字体方案 =====
\ifhfut@noto
  \setCJKmainfont{Noto Serif CJK SC}
  \setCJKsansfont{Noto Sans CJK SC}
  \setCJKmonofont{Noto Sans Mono CJK SC}
  \setmainfont{Noto Serif}
  \setsansfont{Noto Sans}
  \setmonofont{Noto Sans Mono}
  \newCJKfontfamily\song{Noto Serif CJK SC}
  \newCJKfontfamily\hei{Noto Sans CJK SC}
\else
  % ctex 内置字体方案使用 \songti / \heiti，提供 \song / \hei 别名
  \providecommand{\song}{\songti}
  \providecommand{\hei}{\heiti}
\fi

% ===== 页面设置 =====
\geometry{left=31.75mm,right=31.75mm,top=25.4mm,bottom=25.4mm}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\onehalfspacing

% ===== 章节样式 =====
\ctexset{
  section = {
    format = \raggedright\hei\zihao{2}\bfseries,
    name = {},
    number = \arabic{section},
    aftername = .\quad,
    beforeskip = 18bp,
    afterskip = 18bp
  },
  subsection = {
    format = \hei\zihao{4}\bfseries,
    beforeskip = 12bp,
    afterskip = 6bp
  },
  subsubsection = {
    format = \hei\zihao{-4}\bfseries,
    beforeskip = 8bp,
    afterskip = 4bp
  }
}

\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}

% ===== 基本信息（带缺省值）=====
\newcommand{\HFUTDesignTitle}{课程设计题目}
\newcommand{\HFUTStudentName}{学生姓名}
\newcommand{\HFUTStudentID}{学号}
\newcommand{\HFUTMajorClass}{专业班级}
\newcommand{\HFUTAdvisor}{指导老师}
\newcommand{\HFUTDepartment}{院系名称}
\newcommand{\HFUTYear}{20XX}
\newcommand{\HFUTMonth}{6}
\newcommand{\HFUTDay}{20}
\newcommand{\HFUTScore}{}

\newcommand{\HFUTTaskContent}{%
  一、课程设计第一部分\par
  在此填写课程设计的主要内容、任务要求、完成范围和成果形式。\par
  二、课程设计第二部分\par
  在此填写需要提交的程序、报告、图表、数据或其他材料。%
}

\newcommand{\HFUTTeacherComment}{%
  建议：从学生的工作态度、工作量、设计（论文）的创造性、学术性、实用性及书面表达能力等方面给出评价。%
}

\newcommand{\HFUTTableCenterBox}[2]{%
  \begin{minipage}[t][#1][c]{\linewidth}%
    \vspace*{-0.8mm}\centering #2%
  \end{minipage}%
}

\newcommand{\HFUTTableLeftMiddleBox}[2]{%
  \begin{minipage}[t][#1][c]{\dimexpr\linewidth-4mm\relax}%
    \vspace*{-0.8mm}\raggedright #2%
  \end{minipage}%
}

\newcommand{\HFUTTableTopLeftBox}[2]{%
  \begin{minipage}[t][#1][t]{\dimexpr\linewidth-4mm\relax}%
    \vspace{2mm}%
    \raggedright #2%
  \end{minipage}%
}

\newcommand{\HFUTTeacherCommentBox}[3]{%
  \begin{minipage}[t][#1][t]{\dimexpr\linewidth-4mm\relax}%
    \vspace{2mm}%
    \raggedright #2%
    \vfill
    \hfill{\song\zihao{-4}#3}%
    \vspace{3mm}%
  \end{minipage}%
}

% ===== 封面辅助命令 =====
\newcommand{\HFUTCoverField}[2]{%
  \makebox[38mm][l]{\song\bfseries\addCJKfontfeatures{FakeBold=2.5}\fontsize{22bp}{26bp}\selectfont #1：}%
  \underline{\makebox[78mm][c]{\song\bfseries\addCJKfontfeatures{FakeBold=2.5}\fontsize{22bp}{26bp}\selectfont #2}}%
}

\newcommand{\HFUTCoverPage}{%
  \clearpage
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north,inner sep=0pt] at ([xshift=0mm,yshift=-27mm]current page.north)
      {\IfFileExists{assets/hfut_logo.jpeg}{%
        \includegraphics[width=104.8mm]{assets/hfut_logo.jpeg}%
      }{%
        \IfFileExists{hfut_logo.jpeg}{%
          \includegraphics[width=104.8mm]{hfut_logo.jpeg}%
        }{%
          \hei\fontsize{28bp}{34bp}\selectfont 合肥工业大学%
        }%
      }};

    \node[anchor=north,inner sep=0pt] at ([xshift=0mm,yshift=-67mm]current page.north)
      {\hei\bfseries\addCJKfontfeatures{FakeBold=2.5}\fontsize{72bp}{86bp}\selectfont 课程设计};

    \node[anchor=north west,inner sep=0pt] at ([xshift=46mm,yshift=-118mm]current page.north west){%
      \begin{minipage}{125mm}
        \setlength{\baselineskip}{18mm}
        \HFUTCoverField{课程名称}{\HFUTDesignTitle}\\[5mm]
        \HFUTCoverField{学生姓名}{\HFUTStudentName}\\[7mm]
        \HFUTCoverField{学\hspace{1.2em}号}{\HFUTStudentID}\\[7mm]
        \HFUTCoverField{专业班级}{\HFUTMajorClass}\\[7mm]
        \HFUTCoverField{指导老师}{\HFUTAdvisor}\\[7mm]
        \HFUTCoverField{院系名称}{\HFUTDepartment}
      \end{minipage}%
    };
  \end{tikzpicture}
  \null
  \clearpage
}

% ===== 任务书表格 =====
\newcommand{\HFUTTaskFormPage}{%
  \clearpage
  \thispagestyle{empty}
  \vspace*{0mm}
  \noindent\makebox[\textwidth][c]{%
    {\hei\fontsize{22bp}{28bp}\selectfont 合肥工业大学课程设计任务书}%
  }\par
  \vspace{2mm}
  \noindent\makebox[\textwidth][c]{%
    \setlength{\tabcolsep}{0pt}%
    \begin{tabular}{|p{17.34mm}|p{101.55mm}|p{14.82mm}|p{26.95mm}|}
      \hline
      \HFUTTableCenterBox{12.15mm}{\song\bfseries\zihao{5}\shortstack{设计\\题目}} &
      \hspace{2mm}\HFUTTableLeftMiddleBox{12.15mm}{\song\bfseries\zihao{4}\HFUTDesignTitle} &
      \hspace{2mm}\HFUTTableLeftMiddleBox{12.15mm}{\song\bfseries\zihao{4}成绩} &
      \HFUTTableCenterBox{12.15mm}{\song\zihao{4}\HFUTScore} \tabularnewline \hline
      \HFUTTableCenterBox{134.81mm}{\song\bfseries\zihao{5}\shortstack{课\\程\\设\\计\\主\\要\\内\\容}} &
      \multicolumn{3}{>{\raggedright\arraybackslash}p{143.32mm}|}{%
        \hspace{2mm}\HFUTTableTopLeftBox{134.81mm}{\song\zihao{-4}\HFUTTaskContent}%
      } \tabularnewline \hline
      \HFUTTableCenterBox{72.21mm}{\song\bfseries\zihao{5}\shortstack{指\\导\\教\\师\\评\\语}} &
      \multicolumn{3}{>{\raggedright\arraybackslash}p{143.32mm}|}{%
        \hspace{2mm}\HFUTTeacherCommentBox{72.21mm}{\song\zihao{5}\HFUTTeacherComment}{签名：\hspace{28mm}20\hspace{8mm}年\hspace{8mm}月\hspace{8mm}日}%
      } \tabularnewline \hline
    \end{tabular}%
  }
  \clearpage
}

% ===== 任务书标题页 =====
\newcommand{\HFUTTaskTitlePage}{%
  \clearpage
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west,inner sep=0pt] at ([xshift=32mm,yshift=-28mm]current page.north west)
      {\song\fontsize{15bp}{18bp}\selectfont 附件三};
    \node[anchor=north west,inner sep=0pt] at ([xshift=53mm,yshift=-27mm]current page.north west)
      {\song\fontsize{22bp}{28bp}\selectfont 合肥工业大学课程设计任务书};
  \end{tikzpicture}
  \null
  \clearpage
}

\endinput
