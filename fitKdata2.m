function [ rsq fitresult] = fitKdata2( x,y )
a=nan;
b=nan;
c=nan;
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[xData yData] = prepareCurveData( x, y );


% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [-2.8760196252657 -3.46831677055282];



try
[fitresult, gof(1)] = fit( xData, yData, ft, opts );
catch exception
    gof.rsquare = nan;
end

%h = plot( fitresult{1}, xData, yData );
if(~isnan(gof.rsquare))
rsq = gof.rsquare;

else 
    b=1e9;
    rsq = 0.01;
end