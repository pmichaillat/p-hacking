%% visualDisplay.m
% 
% Set up visual display of results
%
%% Description
%
% This script sets up the visual display of the paper's results. It first defines a black color and a gray color. Each color is specified with an hexadecimal color code, encoded as a string. The script then formats figures, axes, and plots to display the results. 
%
% The script formats figures and axes by modifying their default properties. It formats plots by predefining properties that can be called upon. Each set of properties is contained in a cell array:
%
% * blackLine – Properties for solid black line
% * grayLine – Properties for thin gray line
% * dashedLine – Properties for thin dashed black line with black dots
% * blackDot – Properties for black dots
% * gammaAxis – Properties for completion probability on x-axis
% * stepAxis – Properties for corrective step on x-axis
%
%% Examples
%
%   plot(x, y, blackLine{:})
%   plot(x, y, grayLine{:})
%   set(gca, gammaAxis{:})
%

createProperty = @(obj) [fieldnames(obj), struct2cell(obj)]';

%% Color palette

% Black color
black = '#000000';

% Gray color
gray = '#c0c0c0';

%% Set default properties for figures

figureWidth = 8.5;
figureHeight = 6.375;
set(groot, 'defaultFigureUnits', 'inches')
set(groot, 'defaultFigurePosition', [1,1,figureWidth,figureHeight]);
set(groot, 'defaultFigurePaperPosition', [0, 0, figureWidth,figureHeight]);
set(groot, 'defaultFigurePaperSize', [figureWidth,figureHeight]);

%% Set default properties for axes

set(groot, 'defaultAxesFontName', 'Helvetica')
set(groot, 'defaultAxesFontSize', 22)
set(groot, 'defaultAxesLabelFontSizeMultiplier', 1)
set(groot, 'defaultAxesTitleFontSizeMultiplier', 1)
set(groot, 'defaultAxesTitleFontWeight', 'normal')
set(groot, 'defaultAxesXColor', 'k')
set(groot, 'defaultAxesYColor', 'k')
set(groot, 'defaultAxesGridColor', 'k')
set(groot, 'defaultAxesLineWidth', 1)
set(groot, 'defaultAxesYGrid', 'on')
set(groot, 'defaultAxesXGrid', 'on')
set(groot, 'defaultAxesTickDirMode',  'manual')
set(groot, 'defaultAxesTickLength', [0 0])
set(groot, 'defaultAxesBox', 'off')

%% Predefine properties for plots

% Black line
clear obj
obj.Color = black;
obj.LineWidth = 3;
blackLine = createProperty(obj);

% Gray line
clear obj
obj.Color = gray;
obj.LineWidth = 1;
grayLine = createProperty(obj);

% Dashed line with dots
clear obj
obj.Color = black;
obj.LineWidth = 1;
obj.LineStyle = '--';
obj.MarkerFaceColor = black;
obj.MarkerEdgeColor = black;
obj.Marker = 'o';
obj.MarkerSize = 11;
dashedLine = createProperty(obj);

% Black dots
clear obj
obj.LineStyle = 'none';
obj.MarkerFaceColor = black;
obj.MarkerEdgeColor = black;
obj.Marker = 'o';
obj.MarkerSize = 11;
blackDot = createProperty(obj);

% X-axis with completion probability
clear obj
obj.XLim = [0, 1];
obj.XTick = [0:0.2:1];
obj.xTickLabel = ['  0%';' 20%';' 40%';' 60%';' 80%';'100%'];
gammaAxis = createProperty(obj);

% X-axis with corrective steps
clear obj
obj.XLim = [1, 4];
obj.XTick = [1:1:4];
stepAxis = createProperty(obj);