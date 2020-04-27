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


