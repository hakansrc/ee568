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

%% Distribution factor calculation 
NumberOfPhases = 3;
NumberOfSlots = 36;
NumberOfPoles = 4;
q = NumberOfSlots/(NumberOfPhases*NumberOfPoles);
CoilsPhaseShift = (360/NumberOfSlots)*NumberOfPoles/2;
PitchAngle =  180;%CoilsPhaseShift*7;

alfa = (2*pi/NumberOfSlots)*NumberOfPoles/2;
kp = sind(PitchAngle/2);
kd = sin(q*alfa/2)/(q*sin(alfa/2));
kw = kp*kd;

kp3 = sind(3*PitchAngle/2);
kd3 = sin(3*q*alfa/2)/(3*q*sin(alfa/2));
kw3 = kp3*kd3;

kp5 = sind(5*PitchAngle/2);
kd5 = sin(5*q*alfa/2)/(5*q*sin(alfa/2));
kw5 = kp5*kd5;

SlotWidth = pi*RotorDiameter/(2*NumberOfSlots);
SlowWidthToMachinePerimeterPercent = SlotWidth/(RotorDiameter*pi);

%%
CoilCurrent = 2.5;
CurrentDensity = 5; %A/mm2
FillFactor = 0.5;
CoilArea = CoilCurrent/CurrentDensity; %mm2
CoilRadius = sqrt(CoilArea/pi); %mm

CoilRadiusAWG20 = 0.812e-3/2; %m
CoilAreaAWG20 = pi*CoilRadiusAWG20*CoilRadiusAWG20; %m2

SlotRatio = 0.6;
SlotEndDiameter = RotorDiameter/SlotRatio;
SlotHeight = (SlotEndDiameter-RotorDiameter)/2;

SlotArea = SlotWidth*(SlotEndDiameter-RotorDiameter)/2;
% SlotHeight = SlotArea/SlotWidth;
CopperAreaPerSlot = SlotArea*FillFactor;
NumberOfTurnsPerSlot =  ceil(CopperAreaPerSlot/CoilAreaAWG20);



ElectricalLoadingRMS = NumberOfTurnsPerSlot*CoilCurrent*NumberOfSlots/(pi*RotorDiameter);

PeakFluxDensityAirGap = max(MagB.MagB);

AverageTangentialStress = ElectricalLoadingRMS*PeakFluxDensityAirGap/(sqrt(2));
Torque = AverageTangentialStress*(RotorDiameter/2)*(pi*RotorDiameter*MotorAxialLength);
Force = AverageTangentialStress*(pi*RotorDiameter*MotorAxialLength);
Power = Torque*1500/60*2*pi;

FluxPerPole = MagnetAreaPerPole*PeakFluxDensityAirGap;
BackCoreFluxDensity = 1.50;
BackCoreDepth = FluxPerPole/(BackCoreFluxDensity*MotorAxialLength);
OuterDiameter = SlotEndDiameter+2*BackCoreDepth;
MagneticLoading = NumberOfPoles*FluxPerPole/(pi*RotorDiameter*MotorAxialLength);
Size1 = pi*(OuterDiameter/2)^2*MotorAxialLength;
%% q3 a
StatorOuterDiameter = 160e-3;
MagnetToPolePitchRatio = 1;
SlotRatio = 0.6;
PeakFluxDensityAirGap = 0.75;
DiCoefficient = (1/SlotRatio)+(pi*MotorAxialLength/NumberOfPoles)*MagnetToPolePitchRatio*PeakFluxDensityAirGap*(1/(BackCoreFluxDensity*MotorAxialLength))*2;
Di = StatorOuterDiameter/DiCoefficient;
SlotEndDiameter = Di/SlotRatio;
SlotHeight = (SlotEndDiameter-Di)/2-2*2.6/1000;
BackCoreDepth = (StatorOuterDiameter-SlotEndDiameter)/2;


% Di
% SlotEndDiameter
% StatorOuterDiameter

RotorDiameter = Di;


PoleArea = pi*RotorDiameter*MotorAxialLength/NumberOfPoles; %m2
MagnetThickness = 4e-3;
AirGapClearance = 1e-3; % meters
MagnetRelativePermeability = 1.05;
MagnetResidualFluxDensity = 1.32; %Tesla, N42 material
MagnetAreaPerPole = PoleArea*MagnetToPolePitchRatio;

Rm1 = MagnetThickness/(MagnetAreaPerPole*u0*MagnetRelativePermeability);
Rm2 = Rm1;
Rag1 = AirGapClearance/(MagnetAreaPerPole*u0);
Rag2 = Rag1;
% MagnetToPolePitchRatio = 1;


MmfPerMagnet = MagnetAreaPerPole*MagnetResidualFluxDensity*Rm1;
AirGapFlux = (MmfPerMagnet*2)/(Rm1+Rm2+Rag1+Rag2);
AirGapFluxDensity = AirGapFlux/MagnetAreaPerPole

SlotWidthInner = pi*RotorDiameter/(2*NumberOfSlots);
SlotWidthOuter = pi*SlotEndDiameter/(2*NumberOfSlots);

SlotArea = (SlotWidthInner+SlotWidthOuter)*SlotHeight;
CopperAreaPerSlot = SlotArea*FillFactor;
NumberOfTurnsPerSlot =  ceil(CopperAreaPerSlot/CoilAreaAWG20);

ElectricalLoadingRMS = NumberOfTurnsPerSlot*CoilCurrent*NumberOfSlots/(pi*RotorDiameter);
AverageTangentialStress = ElectricalLoadingRMS*PeakFluxDensityAirGap/(sqrt(2));
Torque = AverageTangentialStress*(RotorDiameter/2)*(pi*RotorDiameter*MotorAxialLength);
Force = AverageTangentialStress*(pi*RotorDiameter*MotorAxialLength);
Power = Torque*1500/60*2*pi;
MagneticLoading = NumberOfPoles*AirGapFlux/(pi*RotorDiameter*MotorAxialLength);
Size2 = pi*(StatorOuterDiameter/2)^2*MotorAxialLength;

Bm = AirGapFluxDensity;
Br = MagnetResidualFluxDensity;
Hm = (Bm-Br)/(MagnetRelativePermeability*u0);

%% q3 b

MagneticLoading = MagneticLoading*0.4/1.32;
PeakFluxDensityAirGap = PeakFluxDensityAirGap*0.4/1.32;
AverageTangentialStress = ElectricalLoadingRMS*PeakFluxDensityAirGap/(sqrt(2));
Torque = AverageTangentialStress*(RotorDiameter/2)*(pi*RotorDiameter*MotorAxialLength);
Force = AverageTangentialStress*(pi*RotorDiameter*MotorAxialLength);
Power = Torque*1500/60*2*pi;

%% q3 c

StatorOuterDiameter = 160e-3;
MagnetToPolePitchRatio = 1;
SlotRatio = 0.6;
PeakFluxDensityAirGap = 0.40;
DiCoefficient = (1/SlotRatio)+(pi*MotorAxialLength/NumberOfPoles)*MagnetToPolePitchRatio*PeakFluxDensityAirGap*(1/(BackCoreFluxDensity*MotorAxialLength))*2;
Di = StatorOuterDiameter/DiCoefficient;
SlotEndDiameter = Di/SlotRatio;
SlotHeight = (SlotEndDiameter-Di)/2-2*2.6/1000;
BackCoreDepth = (StatorOuterDiameter-SlotEndDiameter)/2;


% Di
% SlotEndDiameter
% StatorOuterDiameter

RotorDiameter = Di;


PoleArea = pi*RotorDiameter*MotorAxialLength/NumberOfPoles; %m2
MagnetThickness = 4e-3;
AirGapClearance = 1e-3; % meters
MagnetRelativePermeability = 1.05;
MagnetResidualFluxDensity = 0.4; %Tesla, N42 material
MagnetAreaPerPole = PoleArea*MagnetToPolePitchRatio;

Rm1 = MagnetThickness/(MagnetAreaPerPole*u0*MagnetRelativePermeability);
Rm2 = Rm1;
Rag1 = AirGapClearance/(MagnetAreaPerPole*u0);
Rag2 = Rag1;
% MagnetToPolePitchRatio = 1;


MmfPerMagnet = MagnetAreaPerPole*MagnetResidualFluxDensity*Rm1;
AirGapFlux = (MmfPerMagnet*2)/(Rm1+Rm2+Rag1+Rag2);
AirGapFluxDensity = AirGapFlux/MagnetAreaPerPole;

SlotWidthInner = pi*RotorDiameter/(2*NumberOfSlots);
SlotWidthOuter = pi*SlotEndDiameter/(2*NumberOfSlots);

SlotArea = (SlotWidthInner+SlotWidthOuter)*SlotHeight;
CopperAreaPerSlot = SlotArea*FillFactor;
NumberOfTurnsPerSlot =  ceil(CopperAreaPerSlot/CoilAreaAWG20);

ElectricalLoadingRMS = NumberOfTurnsPerSlot*CoilCurrent*NumberOfSlots/(pi*RotorDiameter);
AverageTangentialStress = ElectricalLoadingRMS*PeakFluxDensityAirGap/(sqrt(2));
Torque = AverageTangentialStress*(RotorDiameter/2)*(pi*RotorDiameter*MotorAxialLength);
Force = AverageTangentialStress*(pi*RotorDiameter*MotorAxialLength);
Power = Torque*1500/60*2*pi;
MagneticLoading = NumberOfPoles*AirGapFlux/(pi*RotorDiameter*MotorAxialLength);
Size2 = pi*(StatorOuterDiameter/2)^2*MotorAxialLength;

Bm = AirGapFluxDensity;
Br = MagnetResidualFluxDensity;
Hm = (Bm-Br)/(MagnetRelativePermeability*u0);