%% formatPlot.m
% 
% Format plots
%
%% Description
%
% This script formats plots by setting default properties for figures and axes. 
%
% The script also defines settings to format line plots and scatter plots. Each setting is contained in a cell array:
%
% * purpleSetting – Settings for regular purple line
% * graySetting – Settings for thin gray line
% * xSetting – Settings for x-axis of line plot
% * scatterSetting – Settings for scatter plot
%
% Finally, the script defines a color palette composed of purple, pink, and gray. Each color is specified in hexadecimal format (hex triplet) and encoded as a string.
%
%% Examples
%
%   plot(x, y, purpleSetting{:})
%   plot(x, y, scatterSetting{:})
%   set(gca, xSetting{:})
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

%% Settings for line plots

% Purple line
purpleSetting.Color = purple;
purpleSetting.LineWidth = 3;
purpleSetting = [fieldnames(purpleSetting), struct2cell(purpleSetting)]';

% Gray line
graySetting.Color = gray;
graySetting.LineWidth = 1;
graySetting = [fieldnames(graySetting), struct2cell(graySetting)]';

% X-axis
xSetting.XLim = [0, 1];
xSetting.XTick = [0:0.2:1];
xSetting = [fieldnames(xSetting), struct2cell(xSetting)]';

%% Settings for scatter plots

scatterSetting.MarkerFaceColor = pink;
scatterSetting.MarkerEdgeColor = pink;
scatterSetting.LineStyle = 'none';
scatterSetting.Marker = 'o';
scatterSetting.MarkerSize = 15;
scatterSetting = [fieldnames(scatterSetting), struct2cell(scatterSetting)]';