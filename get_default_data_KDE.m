function [split_dat,bwparam,ds]=get_default_data_KDE(data,bwparam,ds)
    if nargin<1
        disp('Error')
    end
    n=length(data);
    split_dat=data(1:(round(ds*n)));
end