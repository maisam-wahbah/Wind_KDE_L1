%% Kernel Density Estimator using L1-optimized Bandwidth
%{
This file computes the probability density of wind speed using the Kernel
Density Estimation (KDE) approach utilizing the L1-optimized bandwidth
(H) computed in R using the minimum distance method as proposed by
Devroye and Lugosi (1996).
%}
clc;close all;clear;

%% Reading the data
histogramBins=histogramBins_value; %number of histogram bins
ds=ds_value; %the value of ds (use the same value previously used in R)
H=H_value; %the value of H obtained from R

filename={'_permuted_wind_speed_data.csv'};
dat=csvread(char(filename),0,0);

%% Data Histogram
FigHandle(1)=figure(1);
set(FigHandle(1),'Name','Data histogram','Units','inches','Position',[0.5 2 6 3]);
hist_pdf=histogram(dat,histogramBins,'Normalization','pdf','LineWidth',1);
set(gca,'FontWeight','bold');ylabel('Probability Density');
grid on;grid minor;xlabel('Wind Speed (m/s)');

hist_BinWidth=hist_pdf.BinWidth;
hist_BinEdges=hist_pdf.BinEdges;
hist_BinCenter=hist_BinEdges(1:end-1)+hist_BinWidth/2;
close(1);

%% L1–based KDE Model
kde_L1=L1_KDE_pdf(hist_BinCenter,dat,H,ds);

%% Plotting Wind Speed Probability Density
FigHandle(2)=figure(2);
set(FigHandle(2),'Name','Wind Speed Probability Density',...
    'Units','inches','Position',[0.5 2 6 3]);
histogram(dat,histogramBins,'Normalization','pdf','LineWidth',1);hold on;
PlotHandle1=plot(hist_BinCenter,kde_L1,'k','LineWidth',1.5,'LineStyle','-');
hold off;set(gca,'FontWeight','bold');grid on;grid minor;
xlabel('Wind Speed (m/s)');ylabel('Probability Density');
legend(PlotHandle1,'L_1–based KDE Model (D-L)','Location','NE');
[~,fname,~]=fileparts(char(filename));
saveas(FigHandle(2),[fname,'_PD'],'fig');
