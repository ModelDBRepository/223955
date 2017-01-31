function [out] =  removeFollowers(inds)
inds(1) = 0;
out = [];
for i=1:length(inds)-1
    if(inds(i+1)-inds(i) ~= 1)
        out(end+1) = inds(i+1);
    end
end
end
