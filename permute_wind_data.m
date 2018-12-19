% This file permutes wind speed data
clc;clear;close;

%% Reading the data
filename='wind_speed_data.csv';

%% Permute the data
dat=load(filename);
dat(dat<=0)=[]; %remove negative and zero wind speed values,
                  %which represent corrupted data
rng(20180607); %seed the permutation for reproducability
dat_prmted=dat(randperm(length(dat)));

[~,fname,fext]=fileparts(filename);
csvwrite(['_permuted_',fname,fext],dat_prmted);