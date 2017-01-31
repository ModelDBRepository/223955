function [TausNa] = getTauDecay(VoltsActNa,times)
TausNa = [];
for i =18:30
    currTrace = VoltsActNa(:,i);
    [peak peakInd] = min(currTrace);
    onePrecentOfPeakInd = find(currTrace(peakInd:end)>0.01*peak,1,'first');
    onePrecentOfPeakInd = onePrecentOfPeakInd+peakInd-1;
    x = times(peakInd:onePrecentOfPeakInd)-times(peakInd);
    y = currTrace(peakInd:onePrecentOfPeakInd);
    %plot(x,y)
    [rsq fitresult] = fitKdata2(x,y);
    %plot(fitresult,x,y,'blue');
    TausNa(end+1) = fitresult.b;
    
end