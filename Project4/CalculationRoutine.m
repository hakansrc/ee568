clear
clc

%% machine parameters
Irms = 210;
%%
 
P = 125e3;
pf = 0.8;
numberofpoles = 12;
% Arms = 180000; %A/m rms
Bpeak = 0.8; %Tesla peak
Nslots = 54;
q = Nslots/(3*numberofpoles);

CoilsPhaseShift = 360*(numberofpoles/2)/54;

Si = P/pf;
StackLength = 250e-3; %m
Do = 350e-3; %m
Di = 180e-3;
DslotEnd = Di/0.6

SlotHeight = (DslotEnd-Di)/2;
SlotWidthInner = (pi*Di/Nslots)/2;
SlotWidthOuter = (pi*DslotEnd/Nslots)/2;
SlotArea = (SlotWidthInner+SlotWidthOuter)/2*(SlotHeight); %m2
FillFactor = 0.8;
CurrentDensity = 12e6; %A/m2
TotalCopperArea = SlotArea*FillFactor;
PeakRms = 210;
CopperAreaPerCoil = 16.8e-6/2;
Nturn = TotalCopperArea/CopperAreaPerCoil;
Nturn = ceil(Nturn)
Arms = Nturn*PeakRms/2*Nslots/(pi*Di) %we connect two parallel 
ToothArea = SlotWidthInner*SlotHeight;
BackCoreThickness = (Do-DslotEnd)/2;
FluxLinkage = 0.8*pi*Di*StackLength/numberofpoles;
BackCoreFluxDensity = FluxLinkage/(BackCoreThickness*StackLength)/2
% TotalCurrent = CurrentDensity*CopperArea
PoleArea = pi*Di*StackLength/numberofpoles;



kw = 0.945;
C = pi^2/sqrt(2)*kw*Arms*Bpeak;
% Nturn = (Arms)*pi*Di/(Irms*Nslots)

%% phase resistances
CoilSpan = 5; %slots
SpanLength = pi*Di*CoilSpan/Nslots;
LengthPerTurn = 2*StackLength+2*SpanLength;
ResistancePerTurn = 1.68e-8*LengthPerTurn/CopperAreaPerCoil;
ResistancePerCoilGroup = ResistancePerTurn*Nturn;
ResistancePerPhase = ResistancePerCoilGroup/2;

%% magnet calc
MagnetCoercivity = 991000; % A/m
MagnetToPolePitchRatio = 0.65;
MagnetAreaPerPole = PoleArea*MagnetToPolePitchRatio;
u0 = 4*pi*1e-7;
ur = 7000;
MagnetThickness = 40e-3;
AirGapLength = 1e-3;
ReluctanceMax = (MagnetThickness*2+2*AirGapLength+2*SlotHeight)/(MagnetAreaPerPole*u0)
ReluctanceMin = (2*AirGapLength)/(MagnetAreaPerPole*u0)
% Bmax = Nturn*PeakRms*sqrt(2)/(PoleArea*ReluctanceMin);
Bmax = MagnetCoercivity*2*AirGapLength/(ReluctanceMin*PoleArea)
Bmin = MagnetCoercivity*2*(AirGapLength+SlotHeight)/((ReluctanceMax*PoleArea))



%%
