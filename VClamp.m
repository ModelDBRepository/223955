%Author - Roy Ben-Shalom bens.roy@gmail.com


close all
currDir = pwd;
cd actInact

!sodiumTrialsNa.hoc


pause(5)
cd(currDir)
recordTime = 5;
dt = 0.025;
ntrials =80;
times=0:dt:5-dt;
npoints = recordTime/dt+1;

OutputFolder = './ActInact/output/';
FN = [OutputFolder 'act_na_currents.dat'];
NaActCurrents   = nrn_mread(FN,npoints)';
StimAct = NaActCurrents(1,:);
VoltsActNa = NaActCurrents(2:end,:);
peaksActNa = min(VoltsActNa);
vrev = T_TypeFit(StimAct,peaksActNa);
GMaxNa = peaksActNa(1:29)./(StimAct(1:29)-vrev);
GMaxNa = GMaxNa/max(GMaxNa);
TausNa = zeros(1,size(VoltsActNa,2));
TausNa = getTauDecay(VoltsActNa,times);
TausNa = -0.001./TausNa;


OutputFolder = './ActInact/output/';
FN = [OutputFolder 'inact_na_currents.dat'];
NaInactCurrents   = nrn_mread(FN,npoints)';
StimInact = NaInactCurrents(1,:);
VoltsInactNa = NaInactCurrents(2:end,:);
peaksInactNa = min(VoltsInactNa);

peaksInactNa = peaksInactNa./min(peaksInactNa);



%%
%close all



subplot(2,1,1)
hold on
plot(StimAct,peaksActNa,'black');

title('peak Na');
xlabel('Stim');
ylabel('current[nAmp]');
subplot(2,1,2)
hold on
plot(StimAct(1:29),GMaxNa,'black');

plot(StimAct(1):0.01:StimAct(end),0.5);

title('Activation Na');
xlabel('Stim');
ylabel('conductance');
xlim([-80 10]);
%ForIgorPeaksAct = [StimAct',peaksActNa',peaksActNax'];
%ForIgorGMaxAct = [StimAct',GMaxNa',GMaxNax'];


figure(2);
subplot(2,1,1)
hold on
plot(times,VoltsInactNa,'black');

title('raw Na');
xlabel('time');
ylabel('current[nAmp]');
subplot(2,1,2)
hold on

plot(StimInact,peaksInactNa,'black');

title('peak Na');
xlabel('Stim');
ylabel('current[nAmp]');

%%

figure(3);
hold on 
plot(StimAct(18:30),TausNa,'black');



 figure(5)
 hold on

 plot(StimAct(1:29),GMaxNa,'black');
 xlim([-130,10]);
 ylim([0,1]);
 
 
 peakInd = find(StimInact==-50);
 figure(6)
 hold on
 plot(times,VoltsInactNa(:,1),'black');
 ylim([-5,0]);
  figure(7)
  hold on
 plot(times,VoltsInactNa(:,1),'black');
ylim([-5,0]);
