clc
clear
NumberOfSlots = 120;
NumberOfPoles = 20;
NumberOfPolePairs = NumberOfPoles/2;
NumberOfPhases = 3;

VectorDistributionStepDegrees = (360/NumberOfSlots)*NumberOfPolePairs;
VectorAngleArray = zeros(1,NumberOfSlots);
VectorMagnitudeArray = zeros(1,NumberOfSlots);
SlotNumberArray = 1:NumberOfSlots;
for i=1:NumberOfSlots
    VectorAngleArray(i) = VectorDistributionStepDegrees*(i-1);
    VectorMagnitudeArray(i) = 1;
end
plot(VectorAngleArray)

for i=1:NumberOfSlots
    [x(i) y(i)] = pol2cart(deg2rad(VectorAngleArray(i)),VectorMagnitudeArray(i));
end
plotv([x;y])


VectorAngleArrayMod = mod(VectorAngleArray,360);
figure 
plot(SlotNumberArray,VectorAngleArrayMod);