close all
clear
clc
load("MagB")
NumberOfPhases = 3;
NumberOfPoles = 4;
MotorAxialLength = 100e-3; % meters
AirGapClearance = 1e-3; % meters
MagnetToPolePitchRatio = 0.8;
u0 = pi*4e-7;

%%
RotorDiameter = 100e-3; %meters
MagnetThickness = 4e-3;
MagnetRelativePermeability = 1.05;
MagnetResidualFluxDensity = 1.32; %Tesla, N42 material
PoleArea = pi*RotorDiameter*MotorAxialLength/NumberOfPoles; %m2
MagnetAreaPerPole = PoleArea*MagnetToPolePitchRatio;
NonMagnetAreaPerPole = (1-MagnetToPolePitchRatio)*PoleArea;

 

%total reluctance seen by the magnets are: 
%assuming that the core is infinitely permeable
%assuming that the magnets are on the surface of the rotor
%Rm: reluctance of magnet's itself
%Rag1: reluctance from magnet's top to stator
%Rag2: reluctance of the return path
Rm1 = MagnetThickness/(MagnetAreaPerPole*u0*MagnetRelativePermeability);
Rm2 = Rm1;
Rag1 = AirGapClearance/(MagnetAreaPerPole*u0);
Rag2 = Rag1;



MmfPerMagnet = MagnetAreaPerPole*MagnetResidualFluxDensity*Rm1;
AirGapFlux = (MmfPerMagnet*2)/(Rm1+Rm2+Rag1+Rag2);
AirGapFluxDensity = AirGapFlux/MagnetAreaPerPole;

Bm = AirGapFluxDensity;
Br = MagnetResidualFluxDensity;
Hm = (Bm-Br)/(MagnetRelativePermeability*u0);

MagneticLoading = NumberOfPoles*AirGapFlux/(pi*RotorDiameter*MotorAxialLength);

plot(360*MagB.Distance/(pi*104.5),MagB.MagB,'LineWidth',6);
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Flux Density (T)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])
res = 300;
size = [12000 6000];
set(gcf,'paperunits','inches','paperposition',[0 0 size/res]);
print('resized.tiff','-dtiff',['-r' num2str(res)]);
% hold on
% plot(360*MagB.Distance(56)/(pi*104.5),MagB.MagB(56),'+','markersize',12,'linewidth',2)
%legend('Analytical Result','FEA Result')
MagB_mean = 0;
for i =1:numel(MagB.MagB)
    MagB_mean = MagB_mean+ MagB.MagB(i);
end
MagB_mean = MagB_mean/numel(MagB.MagB);
