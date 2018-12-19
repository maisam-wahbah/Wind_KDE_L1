# A Combinatorial Method for Bandwidth Selection in Wind Speed Kernel Density Estimation

The goal of this README file is to guide the user through the steps required to compute the appropriate L1-optimized bandwidth and build the Kernel Density Estimator (KDE) for use in MATLAB. This should be read in conjunction with the paper entitled “A combinatorial method for bandwidth selection in wind speed kernel density estimation” submitted for publication in IET Renewable Power Generation.
The end result is a MATLAB file ‘wind_KDE_L1_PD.m’ which will return and plot an estimate of the probability density of wind speed. The user is encouraged to read and edit the code to optimize for his/her situation.

### Setting up the work environment
- It is assumed that the user already has MATLAB installed on their system.
- The user also needs to download and install the freely available open-source R and the md package from the CRAN repository on their system. After that he/she should be set to follow the instructions below.
- Download this folder of code from ’https://github.com/maisam-wahbah/Wind_KDE_L1’ onto your computer.

### Data pre-processing
1) In your current working directory, save your wind speed data in a ‘.csv’ file and name it ‘wind_speed_data.csv’, without headers. In this tutorial, wind speed data is assumed to be in meters per second.
2) Open MATLAB and set your working directory to where your data and the Wind_KDE_L1 code reside.
3) Open ‘permute_wind_data.m’ and run it in MATLAB. This scrambles your data before fitting an estimator, which is always good practice. Your data are saved (by default) in a new file, `_permuted_wind_speed_data.csv`.

### Computing L1–optimized bandwidth
1) Run R and set the working directory (e.g. setwd(<directory_path>) ) to where your data and the Wind_KDE_L1 code reside.
2) Open the R script ‘get_bandwidth_L1.R’, which uses the md package to compute the appropriate optimized bandwidth.
3) Edit line no. 4 to set the number of bandwidth values to be investigated (h_no), and the rate of data split (ds = 1 – m/n). Typical values of h_no are 60 or higher. The value of ds should be close to 1 (e.g. 0.8 or higher).
4) Type and run the command ‘source("get_bandwidth_L1.R") ’. This executes the minimum distance analysis on the processed data to obtain the optimal bandwidth H. The computed bandwidth values is saved (by default) in ‘_wind_speed_bandwidth.csv’. This may take a minute to run, depending on the speed of your computer.
 5) Once R returns back to its command prompt, you may close R. If asked, you do not need to save a workspace image.

### Building the L1–based KDE Model
1) Open ‘wind_KDE_L1_PD.m’.
2) Edit line no. 11 to set the required number of histogram bins.
3) Edit line no. 12 to set the value of ds (use the same value previously used in R).
4) Edit line no. 13 to enter the value of H obtained from R.
5) Run the file in MATLAB. This computes the probability density of wind speed using the KDE approach utilizing the L1-optimized bandwidth. The produced figure is saved (by default) in a new ‘.fig’ file, `_permuted_wind_speed_data_PD.fig`.
