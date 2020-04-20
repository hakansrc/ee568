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

%total reluctance seen by the magnets are: 
%assuming that the core is infinitely permeable
%assuming that the magnets are on the surface of the rotor
TotalMagnetReluctance = MagnetThickness/(MagnetAreaPerPole*MagnetRelativePermeability)+2*((AirGapClearance*2+MagnetThickness)/(u0*PoleArea*(1-MagnetToPolePitchRatio)));
IdealFluxMagnets = MagnetAreaPerPole*MagnetResidualFluxDensity;
MMFmagnet = IdealFluxMagnets*TotalMagnetReluctance;