# 合肥工业大学课程设计 LaTeX 模板

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![XeLaTeX](https://img.shields.io/badge/engine-XeLaTeX-blue)](https://ctan.org/pkg/xetex)
[![GitHub last commit](https://img.shields.io/github/last-commit/dotm5/HFUT-CourseDesign-LaTeX)](https://github.com/dotm5/HFUT-CourseDesign-LaTeX/commits/main)

本项目是合肥工业大学**本科课程设计**的 LaTeX 模板，依据学校课程设计报告（论文）格式要求自主编写。模板兼容 TeX Live、MacTeX、MiKTeX 发行版，支持跨平台使用。

**注意：**

1. 本模板要求 TeX Live / MacTeX / MiKTeX 不低于 2017 年的发行版，且尽可能升级到最新。

2. 模板仅支持 XeLaTeX 编译，不支持 pdfLaTeX 或 CTeX 套装。

3. 使用模板前，请先仔细阅读本文档的编译说明和字体配置章节。

## 文件结构

```
hfut_course_design_template.tex  # 主文件：组织封面、任务书与正文分章
hfutsetup.tex                    # 配置文件：填写基本信息、任务书内容
hfutcourse.cls                   # 文档类：封面、任务书、章节样式
contents/                        # 正文分章文件
  01-requirements.tex            # 题目要求
  02-design.tex                  # 设计过程
  03-results.tex                 # 结果分析
assets/                          # 图片与其他静态资源
  hfut_logo.jpeg                 # 校名字样图片
latexmkrc                        # 构建配置：latexmk 自动化编译
```

模板已将样式、配置与正文分离：`hfutcourse.cls` 负责封面、任务书表格、章节格式等全部样式定义；`hfutsetup.tex` 负责课程设计基本信息和任务书内容；`contents/` 负责正文分章。用户通常只需修改 `hfutsetup.tex` 和 `contents/` 下的正文文件。

## 使用方法

### 1. 基本信息

在 `hfutsetup.tex` 中修改以下字段：

```tex
\renewcommand{\HFUTDesignTitle}{课程设计题目}  % 课程名称/设计题目
\renewcommand{\HFUTStudentName}{学生姓名}      % 学生姓名
\renewcommand{\HFUTStudentID}{学号}            % 学号
\renewcommand{\HFUTMajorClass}{专业班级}        % 专业班级
\renewcommand{\HFUTAdvisor}{指导老师}           % 指导老师
\renewcommand{\HFUTDepartment}{院系名称}        % 院系名称
\renewcommand{\HFUTYear}{20XX}                 % 年
\renewcommand{\HFUTMonth}{6}                   % 月
\renewcommand{\HFUTDay}{20}                    % 日
% \renewcommand{\HFUTScore}{90}                % 成绩（评出后取消注释）
```

### 2. 填写正文

在 `contents/` 目录下撰写课程设计报告正文。默认提供三个分章文件：

- `contents/01-requirements.tex`：题目要求
- `contents/02-design.tex`：设计过程
- `contents/03-results.tex`：结果分析

如需增加章节，可新建 `.tex` 文件，并在 `hfut_course_design_template.tex` 中添加对应的 `\input{contents/...}`。模板默认只保留通用占位内容，发布版不包含个人信息或具体课程报告内容。

任务书主要内容可通过 `\HFUTTaskContent` 修改，指导教师评语提示可通过 `\HFUTTeacherComment` 修改。

### 3. 编译文档

**推荐方式（自动化）：**

```bash
latexmk
```

`latexmk` 会根据 `latexmkrc` 自动调用 XeLaTeX 并按需多次编译，生成 `build/hfut_course_design_template.pdf`。

**手动方式：**

```bash
xelatex hfut_course_design_template.tex
xelatex hfut_course_design_template.tex   # 两次编译以正确定位封面元素
```

**清理临时文件：**

```bash
latexmk -c
```

## 字体配置

模板默认不指定字体方案（由 `ctexart` 自动检测平台适配）：

| 平台 | 自动适配字体 |
|------|-------------|
| Windows | 宋体 (SimSun) + 黑体 (SimHei) |
| macOS | 苹方 (PingFang) 系列 |
| Linux | 根据系统安装的字体自动选择 |

**指定 Noto 字体（推荐 Linux / Overleaf）：**

```tex
\documentclass[fontset=noto]{hfutcourse}
% 或
\documentclass[noto]{hfutcourse}
```

使用 Noto 字体前，需确保系统中已安装 Noto Serif CJK SC、Noto Sans CJK SC 等字体。

**Windows 用户无需额外配置**，模板会自动选中合适的系统字体。

## 封面与任务书

模板自动生成以下页面（见 `hfutcourse.cls`）：

- **封面页**：校名图片、课程设计标题、学生信息等
- **任务书页**：「合肥工业大学课程设计任务书」标题、设计题目、主要内容、成绩、指导教师评语与签名

封面元素使用 TikZ 绝对定位，校名字样图片位于 `assets/hfut_logo.jpeg`。如需调整排版，请编辑 `hfutcourse.cls` 中的 `\HFUTCoverPage` 和 `\HFUTTaskFormPage`。

## 章节与排版

- 一级标题自动编号为「1.」「2.」……
- 正文为 12pt 字号、A4 纸张，页边距已按课程设计报告要求设置
- 模板默认不生成目录页；如课程要求目录，可在正文前自行加入 `\tableofcontents`
- 如需附录，可使用 LaTeX 标准 `\appendix` 命令并按课程要求调整标题样式

## 反馈问题

如果发现模板有问题，请按照以下步骤操作：

1. 阅读学校的课程设计格式标准，判断是否符合要求；
2. 将 TeX 发行版和宏包升级到最新，查看问题是否已修复；
3. 如问题仍然存在，请附上以下信息以便排查：
   - 使用的 TeX 发行版及版本（TeX Live / MacTeX / MiKTeX）
   - 具体的问题描述
   - 期望的正确结果
   - 相关源码或截图（如有必要）

## License

This project is licensed under the MIT License.
