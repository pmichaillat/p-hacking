# Critical Values Robust to P-hacking: Code and Data

This repository contains the code and data accompanying the paper "Critical Values Robust to P-hacking", written by [Adam McCloskey](https://adammccloskey.com) and [Pascal Michaillat](https://pascalmichaillat.org), and published in the [Review of Economics and Statistics](https://doi.org/10.1162/rest_a_01456) in April 2024.

## Paper webpage

The paper is available at https://pascalmichaillat.org/12/.

## Code

The results in the paper are obtained using MATLAB. The MATLAB code is located in the `code` folder.

### Main script

The main script, `main.m`, orchestrates the production of the results in the paper. The script calibrates the model parameters and produces the 9 figures presented in the paper.

### Formatting script

Before producing the figures, the main script calls the `formatFigure.m` script to preformat figures and predefine figure properties. The figure properties are stored in variables in the MATLAB workspace.

### Production scripts

The main script then produces the figures using a collection of scripts:

+ `figure1A.m` - Produce figure 1A
+ `figure1B.m` - Produce figure 1B
+ `figure2A.m` - Produce figure 2A
+ `figure2B.m` - Produce figure 2B
+ `figure3A.m` - Produce figure 3A
+ `figure3B.m` - Produce figure 3B
+ `figure4.m` - Produce figure 4A, figure 4B, and figure 4C

The scripts display the figures in MATLAB figure windows, save each figure as a PDF file, and save the underlying data as CSV files.

## Figures

The figures produced by the code are saved as PDF files. The data used to generate the figures are saved as CSV files. All the files are located in the `figures` folder, each corresponding to a specific figure in the paper:

+ `figure1A.pdf`, `figure1A.csv` - Figure 1A
+ `figure1B.pdf`, `figure1B.csv` - Figure 1B
+ `figure2A.pdf`, `figure2A.csv` - Figure 2A
+ `figure2B.pdf`, `figure2B.csv` - Figure 2B
+ `figure3A.pdf`, `figure3A.csv` - Figure 3A
+ `figure3B.pdf`, `figure3B.csv` - Figure 3B
+ `figure4A.pdf`, `figure4A.csv` - Figure 4A
+ `figure4B.pdf`, `figure4B.csv` - Figure 4B
+ `figure4C.pdf`, `figure4C.csv` - Figure 4C

## Usage

1. Clone the repository to your local machine using Git or by downloading the ZIP file.

2. Open MATLAB and set the `code` folder as the current folder.

3. To generate the figures presented in the paper, run the following command in the MATLAB command window:

```matlab
run('main.m')
```

4. By default, the main script overwrites the files in the `figures` folder. To preserve existing files, make a copy of the folder before running the script.

## Software

The results were obtained using MATLAB R2023b on macOS Sonoma (Apple silicon). Some scripts required the Statistics and Machine Learning Toolbox.

## License

This repository is licensed under the [MIT License](LICENSE.md).