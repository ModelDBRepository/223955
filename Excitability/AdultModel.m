clear all
GFactors = 1:-0.1:0;
namps = 0.5:0.05:3;
nampsEpi = 0:0.05:3;
NRuns = length(namps)*length(GFactors);
minVForAP = -10;
dvdtThresh = 38;
dt=0.01;

load('KColormap.mat');
FNSoma = '.\AdultOrig\Volts.csv';
somaVolts = csvread(FNSoma,1,0);
somaVolts = reshape(somaVolts(:,1:length(namps)*length(GFactors)),10001,length(namps),length(GFactors));


FNSoma = '.\AdultD82G\Volts.csv';
somaVoltsD82G = csvread(FNSoma,1,0);
somaVoltsD82G = somaVoltsD82G(:,1:length(namps));



FNSoma = '.\AdultD82GRed\Volts.csv';
somaVoltsD82GRed = csvread(FNSoma,1,0);
somaVoltsD82GRed = somaVoltsD82GRed(:,1:length(namps));


FNSoma = '.\AdultD12N\Volts.csv';
somaVoltsD12N = csvread(FNSoma,1,0);
somaVoltsD12N = somaVoltsD12N(:,1:length(namps));


FNSoma = '.\AdultT1420MRedG\Volts.csv';
somaVoltsT1420MRed = csvread(FNSoma,1,0);
somaVoltsT1420MRed = somaVoltsT1420MRed(:,1:length(namps));


FNSoma = '.\AdultL1536V\Volts.csv';
somaVoltsAdultL1536V = csvread(FNSoma,1,0);
somaVoltsAdultL1536V = somaVoltsAdultL1536V(:,1:length(namps));

FNSoma = '.\AdultL1330F\Volts.csv';
somaVoltsL1330F = csvread(FNSoma,1,0);
somaVoltsL1330F = somaVoltsL1330F(:,1:length(nampsEpi));

FNSoma = '.\AdultI1473M\Volts.csv';
somaVoltsI1473M = csvread(FNSoma,1,0);
somaVoltsI1473M = somaVoltsI1473M(:,1:length(nampsEpi));

FNSoma = '.\AdultE1211K\Volts.csv';
somaVoltsE1211K = csvread(FNSoma,1,0);
somaVoltsE1211K = somaVoltsE1211K(:,1:length(nampsEpi));



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
Ind1 = find(namps == 2.2);
vsomaHet = somaVolts(2:end,Ind1,length(GFactors));
dvdtsomaHet = diff(vsomaHet)./dt;
figure(12334);
title('HET Adult');
hold on
plot(vsomaHet(1:end-1),dvdtsomaHet);
vsomaWT = somaVolts(2:end,Ind1,1);
dvdtsomaWT = diff(vsomaWT)./dt;
figure(12338);
title('WT Adult')
hold on
plot(vsomaWT(1:end-1),dvdtsomaWT);



threshAtSoma = [zeros(10,11); threshAtSoma];
maxAtSomaD82G = zeros(length(namps),1);
threshAtSomaD82G = zeros(length(namps),1);
maxAtSomaD82GRed = zeros(length(namps),1);
threshAtSomaD82GRed = zeros(length(namps),1);
maxAtSomaD12N = zeros(length(namps),1);
threshAtSomaD12N = zeros(length(namps),1);
maxAtSomaT1420MRed = zeros(length(namps),1);
threshAtSomaT1420MRed = zeros(length(namps),1);
maxAtSomaAdultL1536V = zeros(length(namps),1);
threshAtSomaAdultL1536V = zeros(length(namps),1);
maxAtSomaL1330F = zeros(length(namps),1);
threshAtSomaL1330F = zeros(length(namps),1);
maxAtSomaI1473M = zeros(length(nampsEpi),1);
threshAtSomaI1473M = zeros(length(nampsEpi),1);
maxAtSomaE1211K = zeros(length(nampsEpi),1);
threshAtSomaE1211K = zeros(length(nampsEpi),1);
for i = 1:length(namps)
    dvdtD82G = diff(somaVoltsD82G(2:end,i))./dt;
    indOfThreshD82G = find(dvdtD82G>dvdtThresh,1,'first');
    if(~isempty(indOfThreshD82G))
        threshAtSomaD82G(i) = somaVoltsD82G(indOfThreshD82G,i);
    end
   
     dvdtD82GRed = diff(somaVoltsD82GRed(2:end,i))./dt;
    indOfThreshD82GRed = find(dvdtD82GRed>dvdtThresh,1,'first');
    if(~isempty(indOfThreshD82GRed))
        threshAtSomaD82GRed(i) = somaVoltsD82GRed(indOfThreshD82GRed,i);
    end

    dvdtT1420MRed = diff(somaVoltsT1420MRed(2:end,i))./dt;
    indOfThreshT1420MRed = find(dvdtT1420MRed>dvdtThresh,1,'first');
    if(~isempty(indOfThreshT1420MRed))
        threshAtSomaT1420MRed(i) = somaVoltsT1420MRed(indOfThreshT1420MRed,i);
    end
    
    
     dvdtAdultL1536V = diff(somaVoltsAdultL1536V(2:end,i))./dt;
    indOfThreshAdultL1536V = find(dvdtAdultL1536V>dvdtThresh,1,'first');
    if(~isempty(indOfThreshAdultL1536V))
        threshAtSomaAdultL1536V(i) = somaVoltsAdultL1536V(indOfThreshAdultL1536V,i);
    end
    maxAtSomaD12N(i) = max(somaVoltsD12N(:,i));
    dvdtD12N = diff(somaVoltsD12N(2:end,i))./dt;
    indOfThreshD12N = find(dvdtD12N>dvdtThresh,1,'first');
    if(~isempty(indOfThreshD12N))
        threshAtSomaD12N(i) = somaVoltsD12N(indOfThreshD12N,i);
    end
 


end
threshAtSomaT1420MRed = [zeros(10,1); threshAtSomaT1420MRed];
threshAtSomaAdultL1536V = [zeros(10,1); threshAtSomaAdultL1536V];
threshAtSomaD82G = [zeros(10,1); threshAtSomaD82G];
threshAtSomaD82GRed = [zeros(10,1); threshAtSomaD82GRed];
threshAtSomaD12N = [zeros(10,1); threshAtSomaD12N];

for i = 1:length(nampsEpi)
    maxAtSomaI1473M(i) = max(somaVoltsI1473M(:,i));
    dvdtI1473M = diff(somaVoltsI1473M(2:end,i))./dt;
    indOfThreshI1473M = find(dvdtI1473M>dvdtThresh,1,'first');
    if(~isempty(indOfThreshI1473M))
        threshAtSomaI1473M(i) = somaVoltsI1473M(indOfThreshI1473M,i);
    end
    maxAtSomaE1211K(i) = max(somaVoltsE1211K(:,i));
    dvdtE1211K = diff(somaVoltsE1211K(2:end,i))./dt;
    indOfThreshE1211K = find(dvdtE1211K>dvdtThresh,1,'first');
    if(~isempty(indOfThreshE1211K))
        threshAtSomaE1211K(i) = somaVoltsE1211K(indOfThreshE1211K,i);
    end
    maxAtSomaL1330F(i) = max(somaVoltsL1330F(:,i));
    dvdtL1330F = diff(somaVoltsL1330F(2:end,i))./dt;
    indOfThreshL1330F = find(dvdtL1330F>dvdtThresh,1,'first');
    if(~isempty(indOfThreshL1330F))
        threshAtSomaL1330F(i) = somaVoltsL1330F(indOfThreshL1330F,i);
    end
end

%namps = nampsEpi;




Ind2 = find(namps == 2.2);
Ind1 = find(namps == 1.2);
Ind2Epi = find(nampsEpi == 2.2);
ForIgorVoltsFull = somaVolts(:,[Ind2],1);
ForIgorVoltsHalf = somaVolts(:,[Ind2],end);

fullSomaNaps = apsInds(somaVolts(:,:,end),-10);
HalfSomaNaps = apsInds(somaVolts(:,:,1),-10);

ForIgorTraces = [ForIgorVoltsFull,ForIgorVoltsHalf,somaVoltsD12N(:,Ind2),somaVoltsD82G(:,Ind2),somaVoltsD82GRed(:,Ind2),somaVoltsT1420MRed(:,Ind2),somaVoltsAdultL1536V(:,Ind2),somaVoltsL1330F(:,Ind2Epi),somaVoltsI1473M(:,Ind2Epi),somaVoltsE1211K(:,Ind2Epi)];


%forigorRehobase = [namps',fullSomaNaps(1:length(namps))',HalfSomaNaps(1:length(namps))',D82GShiftedNaps(1:length(namps))',D82GRedShiftedNaps(1:length(namps))',T1420MNaps(1:length(namps))',D12NNaps(1:length(namps))'];

WTFull = somaVolts(:,:,1);
WTNAps = apsInds(WTFull,-10);
WTHalf = somaVolts(:,:,end);
WTHalfNAps = apsInds(WTHalf,-10);
D82GNAps = apsInds(somaVoltsD82G,-10);
D82GRedNAps = apsInds(somaVoltsD82GRed,-10);
D12NNAps = apsInds(somaVoltsD12N,-10);
L1330FNAps = apsInds(somaVoltsL1330F,-10);
I1473MNAps = apsInds(somaVoltsI1473M,-10);
E1211KNAps = apsInds(somaVoltsE1211K,-10);
T1420MRedNAps = apsInds(somaVoltsT1420MRed,-10);
AdultL1536VNAps = apsInds(somaVoltsAdultL1536V,-10);
L1330FNAps = apsInds(somaVoltsL1330F,-10);
%%
close all

mutantTitles = {'D82G','D82GRed','D12N','T1420MRed','L1330F','L1330F'};
%forIgorIO = [namps',WTNAps',WTHalfNAps',D82GNAps',D82GRedNAps',D12NNAps',T1420MRedNAps',L1330FNAps',I1473MNAps'];

figure(20)
hold on
plot(namps,WTNAps,'black');
plot(namps,WTHalfNAps,'red');
plot(namps,D82GNAps,'blue');
plot(namps,D82GRedNAps,'--blue');
plot(namps,D12NNAps,'green');
plot(namps,T1420MRedNAps,'Magenta');
plot(namps,AdultL1536VNAps,'Cyan');
plot(nampsEpi,L1330FNAps,'Yellow');
plot(nampsEpi,I1473MNAps,'Color',[.5,.5,.5]);
plot(nampsEpi,E1211KNAps,'Color',[.8,.8,.8]);
title('# Spikes')


figure(202)
colormap jet;
imagesc(-1*GFactors,-1*nampsEpi,threshAtSoma);

hold on

caxis([-67,-47]);
colormap(flipud(colormap));
colormap(gcf,kcolormap);
ylabel('Stimulation[nA]');
xlabel('Ratio of Nav1.2 at AIS');
title('Threshold at the soma Adult');
colorbar;


mutantThreshAtSoma = [threshAtSomaD82G,threshAtSomaD82GRed,threshAtSomaD12N,threshAtSomaT1420MRed,threshAtSomaAdultL1536V,threshAtSomaL1330F];
figure(212)
colormap jet;
imagesc(1:length(mutantTitles),-1*nampsEpi,mutantThreshAtSoma);
ax =gca;
ax.XTickLabel = mutantTitles;
hold on
caxis([-67,-47]);
colormap(flipud(colormap));
colormap(gcf,kcolormap);
ylabel('Stimulation[nA]');
xlabel('Ratio of Nav1.2 at AIS');
title('Threshold at the soma Mutant Adult');
ax = gca;
set(ax,'XTick',1:length(mutantTitles));
set(ax,'XTickLabel',mutantTitles);

colorbar;


figure(312)
colormap jet;
imagesc([1,2],-1*nampsEpi,[threshAtSomaI1473M,threshAtSomaE1211K]);
set(ax,'XTick',[1 2 ]);
set(ax,'XTickLabel',{'I1473M','E1211K'});
hold on
caxis([-60,-55]);

colormap(gcf,kcolormap);
ylabel('Stimulation[nA]');
xlabel('Ratio of Nav1.2 at AIS');
title('Threshold at the soma epilepsy Adult');
set(ax,'XTick',[1 2 ]);
set(ax,'XTickLabel',{'I1473M','E1211K'});





