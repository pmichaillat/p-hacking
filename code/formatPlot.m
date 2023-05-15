%% formatPlot.m
% 
% Format plots
%
%% Description
%
% This script formats plots by setting default properties for figures and axes. 
%
% The script also predefines properties that can be used to format line plots and scatter plots. Each set of properties is contained in a cell array:
%
% * purpleProperties – Properties for regular purple line
% * grayProperties – Properties for thin gray line
% * xProperties – Properties for x-axis of line plot
% * scatterProperties – Properties for scatter plot
%
% Finally, the script defines a color palette composed of purple, pink, and gray. Each color is specified in hexadecimal format (hex triplet) and encoded as a string.
%
%% Examples
%
%   plot(x, y, purpleProperties{:})
%   plot(x, y, scatterProperties{:})
%   set(gca, xProperties{:})
%

%% Set default properties for figures

set(groot,'defaultFigureUnits', 'inches')
set(groot,'defaultFigurePosition', [1,1,7.7779,5.8334]);
set(groot,'defaultFigurePaperPosition', [0, 0, 7.7779,5.8334]);
set(groot,'defaultFigurePaperSize', [7.7779,5.8334]);

%% Set default properties for axes

set(groot,'defaultAxesFontName','Helvetica')
set(groot,'defaultAxesFontSize',22)
set(groot,'defaultAxesLabelFontSizeMultiplier',1)
set(groot,'defaultAxesTitleFontSizeMultiplier',1)
set(groot,'defaultAxesTitleFontWeight','normal')
set(groot,'defaultAxesXColor','k')
set(groot,'defaultAxesYColor','k')
set(groot,'defaultAxesGridColor','k')
set(groot,'defaultAxesLineWidth',1)
set(groot,'defaultAxesYGrid','on')
set(groot,'defaultAxesXGrid','on')
set(groot, 'defaultAxesTickDirMode', 'manual')
set(groot,'defaultAxesTickLength',[0.0 0.0])
set(groot, 'defaultAxesTickDir', 'out')
set(groot,'defaultAxesBox','off')

%% Color palette

purple = '#7570b3';
pink = '#e7298a';
gray = '#bfbfbf';

%% Predefine properties for line plots

% Purple line
purpleProperties.Color = purple;
purpleProperties.LineWidth = 3;
purpleProperties = [fieldnames(purpleProperties), struct2cell(purpleProperties)]';

% Gray line
grayProperties.Color = gray;
grayProperties.LineWidth = 1;
grayProperties = [fieldnames(grayProperties), struct2cell(grayProperties)]';

% X-axis
xProperties.XLim = [0, 1];
xProperties.XTick = [0:0.2:1];
xProperties = [fieldnames(xProperties), struct2cell(xProperties)]';

%% Predefine properties for scatter plots

scatterProperties.MarkerFaceColor = pink;
scatterProperties.MarkerEdgeColor = pink;
scatterProperties.LineStyle = 'none';
scatterProperties.Marker = 'o';
scatterProperties.MarkerSize = 15;
scatterProperties = [fieldnames(scatterProperties), struct2cell(scatterProperties)]';