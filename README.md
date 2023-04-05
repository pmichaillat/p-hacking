# Critical Values Robust to P-hacking: Code and Data

This repository contains the code and data accompanying the paper "Critical Values Robust to P-hacking", written by [Adam McCloskey](https://adammccloskey.com) and [Pascal Michaillat](https://pascalmichaillat.org), and posted on [arXiv](https://doi.org/10.48550/arXiv.2005.04141) in March 2023.

## Paper webpage

The paper is available at https://pascalmichaillat.org/12/.

## Data

<!-- The data on the lifecycle of scientific studies used to produce table 1 are stored in the Excel file `table1.xlsx`, which is placed in the folder `data`.  -->
The data on the lifecycle of scientific studies used to calibrate the completion probability are stored in the Excel file `completion.xlsx`, which is placed in the folder `data`. 

## Code

The Matlab code used to produce the results in the paper is placed in the folder `code`. 

To produce the figures in the paper, run the following scripts:

+ `figure1A.m` – Produce figure 1A
+ `figure1B.m` - Produce figure 1B
+ `figure2A.m` - Produce figure 2A
+ `figure2B.m` - Produce figure 2B
+ `figure3A.m` - Produce figure 3A
+ `figure3B.m` - Produce figure 3B

Each script produces a figure in a Matlab window, saves a copy of the figure in PDF format, and saves a copy of the data plotted in the figure in an Excel file.

The figure-producing scripts call the helper script `formatPlot.m` to customize the appearance of plots.

## Figures

The 6 figures produced by the code are stored in the folder `figures`.

+ The figures are saved as PDF files and stored in the subfolder `pdf`. Any PDF file titled `figureX.pdf` corresponds to figure X in the paper.
+ The data underlying the figures are saved as Excel files and stored in the subfolder `xlsx`. Any Excel file titled `figureX.xlsx` contains the data plotted in figure X in the paper.

## Software

The results were obtained on a Mac running macOS Ventura 13.2 with Matlab R2022b and Microsoft Excel 16.71.

## License

The content of this repository is licensed under the terms of the MIT License.