%% main.m
% 
% Main script
%
%% Description
%
% This is the main script for the paper. It calibrates the model parameters and produces the 9 figures included in the paper. In all figures, the significance level is set to 5%. 
%
%% Output
%
% * The figures are saved as PDF files.
% * The figure data are saved as CSV files.
%

%% Clear MATLAB

% Close figure windows
close all

% Clear workspace
clear

% Clear command window
clc

%% Specify output folder

outputFolder = fullfile('..', 'figures');

%% Calibrate model parameters

% Significance level
alpha = 0.05;

% Range of completion probabilities
gammaArray = [0 : 0.01 : 0.99, 0.9999];

% Calibrated completion probability
gamma = 0.8;

% Index of calibrated completion probability in array
iGamma = find(gammaArray == gamma);

%% Produce figures

% Format figures and predefine figure properties
formatFigure

% Produce individual figures
figure1A
figure1B
figure2A
figure2B
figure3A
figure3B
figure4