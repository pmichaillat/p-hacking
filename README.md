# Critical Values Robust to P-hacking: Code and Data

This repository contains the code and data accompanying the paper "Critical Values Robust to P-hacking", written by [Adam McCloskey](https://adammccloskey.com) and [Pascal Michaillat](https://pascalmichaillat.org), and posted on [arXiv](https://arxiv.org/abs/2005.04141v7) in July 2023.

## Paper webpage

The paper is available at https://pascalmichaillat.org/12/.

## Code

The results in the paper are produced with MATLAB code. The code is stored in the folder `code`. 

The figures in the paper are produced by the following scripts:

+ `figure1A.m` – Produce figure 1A
+ `figure1B.m` - Produce figure 1B
+ `figure2A.m` - Produce figure 2A
+ `figure2B.m` - Produce figure 2B
+ `figure3A.m` - Produce figure 3A
+ `figure3B.m` - Produce figure 3B

Each script produces a figure in a MATLAB window, saves a copy of the figure in PDF format, and saves a copy of the data plotted in the figure in an Excel file.

The figure-producing scripts call the helper script `formatPlot.m` to customize the appearance of plots.

## Figures

The 6 figures produced by the code are stored in the folder `figures`.

+ The figures are saved as PDF files and stored in the subfolder `pdf`. Any PDF file titled `figureX.pdf` corresponds to figure X in the paper.
+ The data underlying the figures are saved as Excel files and stored in the subfolder `xlsx`. Any Excel file titled `figureX.xlsx` contains the data plotted in figure X in the paper.

## Software

The results were obtained on a Mac running macOS Ventura 13.2 with MATLAB R2022b and Microsoft Excel 16.71.

## License

The content of this repository is licensed under the terms of the MIT License.
