library(md)
dat<-read.csv("_permuted_wind_speed_data.csv",header=FALSE)
dat<-dat[dat!=0]
bw<-md(dat,h_no,ds)
write(bw,'_wind_speed_bandwidth.csv')