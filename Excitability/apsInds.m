function[Inds] = apsInds(volts,thresh)
    numOfTraces = size(volts,2);
    for i=1:numOfTraces
        indOfAP= find(volts(:,i)>thresh);
        Inds(i) = length(removeFollowers(indOfAP));

    end
        
end