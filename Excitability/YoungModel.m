clear all
close all

GFactors = 1:-0.1:0;
namps = 0.5:0.05:3;
nampsEp = 0:0.05:3;
NRuns = length(namps)*length(GFactors);
minVForAP = -10;
dvdtThresh = 38;
dt=0.01;
load('KColormap.mat');
FNSoma = '.\YoungOrig\Volts.csv';
somaVolts = csvread(FNSoma,1,0);
somaVolts = reshape(somaVolts(:,1:length(namps)*length(GFactors)),10001,length(namps),length(GFactors));

FNSoma = '.\YoungD82G\Volts.csv';
somaVoltsD82G = csvread(FNSoma,1,0);
somaVoltsD82G = somaVoltsD82G(:,1:length(namps));


FNSoma = '.\YoungD82GRed\Volts.csv';
somaVoltsD82GRed = csvread(FNSoma,1,0);
somaVoltsD82GRed = somaVoltsD82GRed(:,1:length(namps));

FNSoma = '.\YoungD12N\Volts.csv';
somaVoltsD12N = csvread(FNSoma,1,0);
somaVoltsD12N = somaVoltsD12N(:,1:length(namps));



FNSoma = '.\YoungT1420MRed\Volts.csv';
somaVoltsT1420MRed = csvread(FNSoma,1,0);
somaVoltsT1420MRed = somaVoltsT1420MRed(:,1:length(namps));

FNSoma = '.\YoungL1536V\Volts.csv';
somaVoltsL1536V = csvread(FNSoma,1,0);
somaVoltsL1536V = somaVoltsL1536V(:,1:length(namps));

FNSoma = '.\YoungL1330F\Volts.csv';
somaVoltsL1330F = csvread(FNSoma,1,0);
somaVoltsL1330F = somaVoltsL1330F(:,1:length(namps));

FNSoma = '.\YoungI1473M\Volts.csv';
somaVoltsI1473M = csvread(FNSoma,1,0);
somaVoltsI1473M = somaVoltsI1473M(:,1:length(nampsEp));


FNSoma = '.\YoungE1211K\Volts.csv';
somaVoltsE1211K = csvread(FNSoma,1,0);
somaVoltsE1211K = somaVoltsE1211K(:,1:length(nampsEp));

%%
%stimInd = find(namps ==2.45);

%close all


maxAtSoma = zeros(length(namps),length(GFactors));
for gs = 1:length(GFactors)
    for i = 1:length(namps)
        maxAtSoma(i,gs) = max(somaVolts(:,i,gs));
        dvdtSoma = diff(somaVolts(2:end,i,gs))./dt;
        indOfThreshSoma = find(dvdtSoma>dvdtThresh,1,'first');
        if(~isempty(indOfThreshSoma))
            threshAtSoma(i,gs) = somaVolts(indOfThreshSoma,i,gs);
        end
    end
end
Ind1 = find(namps == 1.2);
dvdtsomaHet = diff(somaVolts(2:end,15,length(GFactors)-1))./dt;

threshAtSoma = [zeros(10,11); threshAtSoma];
figure(12331)


maxAtSomaD82G = zeros(length(namps),1);
threshAtSomaD82G = zeros(length(namps),1);

maxAtSomaD82GRed = zeros(length(namps),1);
threshAtSomaD82GRed = zeros(length(namps),1);

maxAtSomaD12N = zeros(length(namps),1);
threshAtSomaD12N = zeros(length(namps),1);

maxAtSomaT1420MRed = zeros(length(namps),1);
threshAtSomaT1420MRed = zeros(length(namps),1);

maxAtSomaL1536V = zeros(length(namps),1);
threshAtSomaL1536V = zeros(length(namps),1);

maxAtSomaL1330F = zeros(length(namps),1);
threshAtSomaL1330F = zeros(length(namps),1);

maxAtSomaI1473M = zeros(length(nampsEp),1);
threshAtSomaI1473M = zeros(length(nampsEp),1);

maxAtSomaE1211K = zeros(length(nampsEp),1);
threshAtSomaE1211K = zeros(length(nampsEp),1);

for i = 1:length(namps)
    
    maxAtSomaD82G(i) = max(somaVoltsD82G(:,i));
    dvdtD82G = diff(somaVoltsD82G(2:end,i))./dt;
    indOfThreshD82G = find(dvdtD82G>dvdtThresh,1,'first');
    if(~isempty(indOfThreshD82G))
        threshAtSomaD82G(i) = somaVoltsD82G(indOfThreshD82G,i);
    end
    maxAtSomaD82GRed(i) = max(somaVoltsD82GRed(:,i));
    dvdtD82GRed = diff(somaVoltsD82GRed(2:end,i))./dt;
    indOfThreshD82GRed = find(dvdtD82GRed>dvdtThresh,1,'first');
    if(~isempty(indOfThreshD82GRed))
        threshAtSomaD82GRed(i) = somaVoltsD82GRed(indOfThreshD82GRed,i);
    end
    maxAtSomaD12N(i) = max(somaVoltsD12N(:,i));
    dvdtD12N = diff(somaVoltsD12N(2:end,i))./dt;
    indOfThreshD12N = find(dvdtD12N>dvdtThresh,1,'first');
    if(~isempty(indOfThreshD12N))
        threshAtSomaD12N(i) = somaVoltsD12N(indOfThreshD12N,i);
    end
   
    maxAtSomaT1420MRed(i) = max(somaVoltsT1420MRed(:,i));
    dvdtT1420MRed = diff(somaVoltsT1420MRed(2:end,i))./dt;
    indOfThreshT1420MRed = find(dvdtT1420MRed>dvdtThresh,1,'first');
    if(~isempty(indOfThreshT1420MRed))
        threshAtSomaT1420MRed(i) = somaVoltsT1420MRed(indOfThreshT1420MRed,i);
    end
   
    maxAtSomaL1536V(i) = max(somaVoltsL1536V(:,i));
    dvdtL1536V = diff(somaVoltsL1536V(2:end,i))./dt;
    indOfThreshL1536V = find(dvdtL1536V>dvdtThresh,1,'first');
    if(~isempty(indOfThreshL1536V))
        threshAtSomaL1536V(i) = somaVoltsL1536V(indOfThreshL1536V,i);
    end
end
threshAtSomaT1420MRed = [zeros(10,1); threshAtSomaT1420MRed];
threshAtSomaD82G = [zeros(10,1); threshAtSomaD82G];
threshAtSomaD82GRed = [zeros(10,1); threshAtSomaD82GRed];
threshAtSomaD12N = [zeros(10,1); threshAtSomaD12N];
threshAtSomaL1536V = [zeros(10,1); threshAtSomaL1536V];



for i = 1:length(nampsEp)
    maxAtSomaI1473M(i) = max(somaVoltsI1473M(:,i));
    dvdtI1473M = diff(somaVoltsI1473M(100:end,i))./dt;
    indOfThreshI1473M = find(dvdtI1473M>dvdtThresh,1,'first');
    if(~isempty(indOfThreshI1473M))
        threshAtSomaI1473M(i) = somaVoltsI1473M(indOfThreshI1473M,i);
    end
    maxAtSomaE1211K(i) = max(somaVoltsE1211K(:,i));
    dvdtE1211K = diff(somaVoltsE1211K(100:end,i))./dt;
    indOfThreshE1211K = find(dvdtE1211K>dvdtThresh,1,'first');
    if(~isempty(indOfThreshE1211K))
        threshAtSomaE1211K(i) = somaVoltsE1211K(indOfThreshE1211K,i);
    end
end




Ind2 = find(namps == 2.2);
Ind1 = find(namps == 1.2);
Ind2Epi = find(nampsEp == 2.2);
ForIgorVoltsFull = somaVolts(:,[Ind2],1);
ForIgorVoltsHalf = somaVolts(:,[Ind2],end);
ForIgorTraces = [ForIgorVoltsFull,ForIgorVoltsHalf,somaVoltsD82G(:,Ind2),somaVoltsD82GRed(:,Ind2),somaVoltsD12N(:,Ind2),somaVoltsT1420MRed(:,Ind2),somaVoltsL1536V(:,Ind2),somaVoltsI1473M(:,Ind2Epi),somaVoltsE1211K(:,Ind2Epi),somaVoltsL1330F(:,Ind2Epi)];
fullSomaNaps = apsInds(somaVolts(:,:,end),-10);
HalfSomaNaps = apsInds(somaVolts(:,:,1),-10);



%forigorRehobase = [namps',fullSomaNaps(1:length(namps))',HalfSomaNaps(1:length(namps))',D82GShiftedNaps(1:length(namps))',D82GRedShiftedNaps(1:length(namps))',T1420MNaps(1:length(namps))',D12NNaps(1:length(namps))'];

 WTFull = somaVolts(:,:,1);
 WTNAps = apsInds(WTFull,-10);
 WTHalf = somaVolts(:,:,end);
 WTHalfNAps = apsInds(WTHalf,-10);
 D82GNAps = apsInds(somaVoltsD82G,-10);
 D82GRedNAps = apsInds(somaVoltsD82GRed,-10);
 D12NNAps = apsInds(somaVoltsD12N,-10);
T1420MRedNAps = apsInds(somaVoltsT1420MRed,-10);
L1536VNAps = apsInds(somaVoltsL1536V,-10);
I1473MNAps = apsInds(somaVoltsI1473M,-10);
E1211KNAps = apsInds(somaVoltsE1211K,-10);
L1330FNAps = apsInds(somaVoltsL1330F,-10);

% T1420MNAps = apsInds(somaVoltsT1420M,-10);
forIgorIO = [namps',WTNAps',WTHalfNAps',D82GNAps',D82GRedNAps',D12NNAps',T1420MRedNAps',L1536VNAps'];
%close all
mutantTitles = {'D82G','D82GRed','D12N','T1420MRed','L1536V','L1330F'};


figure(10)
hold on
plot(namps,WTNAps,'black');
plot(namps,WTHalfNAps,'red');
plot(namps,D82GNAps,'blue');
plot(namps,D82GRedNAps,'--blue');
plot(namps,D12NNAps,'green');
%plot(namps,T1420MNAps,'Magenta');
plot(namps,T1420MRedNAps,'Magenta');
plot(namps,L1330FNAps,'Cyan');

plot(namps,L1536VNAps,'Yellow');
plot(nampsEp,I1473MNAps,'Color',[0.5,0.5,0.5]);
plot(nampsEp,E1211KNAps,'Color',[0.8,0.8,0.8]);

title('# Spikes')


figure(102)
colormap jet;
imagesc(-1*GFactors,-1*nampsEp,threshAtSoma);

hold on
caxis([-67,-47]);
colormap(flipud(colormap));
colormap(gcf,kcolormap);
ylabel('Stimulation[nA]');
xlabel('Ratio of Nav1.2 at AIS');
title('Threshold at the soma');
colorbar;


mutantThreshAtSoma = [threshAtSomaD82G,threshAtSomaD82GRed,threshAtSomaD12N,threshAtSomaT1420MRed,threshAtSomaL1536V,threshAtSomaL1330F];
figure(112)
colormap jet;
imagesc(1:length(mutantTitles),-1*nampsEp,mutantThreshAtSoma);
ax =gca;
ax.XTickLabel = mutantTitles;
hold on
caxis([-67,-47]);
colormap(flipud(colormap));
colormap(gcf,kcolormap);
ylabel('Stimulation[nA]');
xlabel('Ratio of Nav1.2 at AIS');
title('Threshold at the soma Mutant');
ax = gca;
set(ax,'XTick',1:length(mutantTitles));
set(ax,'XTickLabel',mutantTitles);

colorbar;

figure(212)
colormap jet;
imagesc([1,2],-1*nampsEp,[threshAtSomaI1473M,threshAtSomaE1211K]);
ax =gca;
ax.XTickLabel = ['I1473M','E1211K'];
hold on
caxis([-76,-67]);
colormap(flipud(colormap));
colormap(gcf,kcolormap);
ylabel('Stimulation[nA]');
title('Threshold at the soma Epilepsy');
ax = gca;
set(ax,'XTick',[1 2]);
set(ax,'XTickLabel',{'I1473M','E1211K'});

colorbar;




figure(103)
colormap jet;
imagesc(-1*GFactors,-1*namps,maxAtSoma);

hold on
caxis([10,25]);
%caxis([-64,-48]);

ylabel('Stimulation[nA]');
xlabel('Ratio of Nav1.2 at AIS');
title('Max at the soma');
colorbar;


mutantMaxAtSoma = [maxAtSomaD82G,maxAtSomaD82GRed,maxAtSomaD12N,maxAtSomaT1420MRed,maxAtSomaL1536V,maxAtSomaL1330F];
figure(113)
colormap jet;
imagesc(1:length(mutantTitles),-1*namps,mutantMaxAtSoma);
ax = gca;
set(ax,'XTick',1:length(mutantTitles));
set(ax,'XTickLabel',mutantTitles);

hold on
caxis([10,25]);
%caxis([-64,-48]);

ylabel('Stimulation[nA]');
xlabel('Ratio of Nav1.2 at AIS');
title('Max at the soma Mutant');
colorbar;
