% [data,errmsg]=nrn_vread(FileName,machineformat)
% machineformat like in fopen (i.e. 'b' for big endian, 'l' for little endian)
%
% reads binary files, that was written with Vector.vwrite in NEURON

function [errmsg]=nrn_mwrite(FileName,mat)
machineformat = 'n';
precision = 'double';
nrnprec = 4;
nrows = size(mat,1);

[fid,errmsg] = fopen(FileName,'w',machineformat);
if fid==-1
   return;
else
   errmsg = sprintf('File opened successfully');
end
for i=1:nrows
    
    currRow = mat(i,:);
    len = length(currRow);
    
    fwrite(fid,[len nrnprec],'int32');
    fwrite(fid,currRow,precision);
    
end

fclose(fid);