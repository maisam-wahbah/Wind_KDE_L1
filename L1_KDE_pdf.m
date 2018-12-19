% xq is a strictly increasing grid for positive reals.
function mypdf=L1_KDE_pdf(xq,data,bwparam,ds)
    if nargin<2
        [mydat,bwparam]=get_default_data_KDE();
    else
        [mydat,bwparam,ds]=get_default_data_KDE(data,bwparam,ds);
    end
    if xq(1)<0
        mypdf=nan;
        disp('Error')
        return
    else
        mypdf=ksdensity(mydat,xq,'bandwidth',bwparam,'function','pdf');
    end
end