% [data,errmsg]=nrn_vread(FileName,machineformat)
% machineformat like in fopen (i.e. 'b' for big endian, 'l' for little endian)
%
% reads binary files, that was written with Vector.vwrite in NEURON

function [data,errmsg]=nrn_mread(FileName,ncols)
machineformat = 'n';

data = [];

[fid,errmsg] = fopen(FileName,'r',machineformat);
if fid==-1
    error('Couldnt open file');
   return;
else
   errmsg = sprintf('File opened successfully');
end
i=1;
while(1)
    [header,cnt]=fread(fid,2,'int32');
    if cnt~=2
       errmsg = sprintf('Could not read the vwrite header');
       fclose(fid);
       return;
    end

    precision = 'double'; % to avoid Matlab warning
    if header(2)==4
       precision = 'double';
    elseif header(2)==3
       precision = 'float32';
    elseif header(2)==5
       precision = 'int';
    elseif header(2)==2
       precision = 'short';
    else
       errmsg = sprintf('Unsupported precision argument');
       fclose(fid);
       return;
    end

    [currdata,cnt]=fread(fid,ncols,precision);
    if (header(1) ~=1 &&cnt~=header(1))
       errmsg = sprintf('Only %d instead of %d Samples read',cnt,header(1));
       data = [];
       fclose(fid);
       return;
    else
       errmsg = sprintf('Successfully read %d Samples',cnt);
    end
    data(i,:)=currdata;
    i=i+1;
end


fclose(fid);