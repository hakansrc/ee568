clc
clear

%% Question 1
NumberOfSlots_Q1 = 120;
NumberOfPoles_Q1 = 20;
NumberOfPolePairs_Q1 = NumberOfPoles_Q1/2;
NumberOfPhases_Q1 = 3;

q_Q1 = NumberOfSlots_Q1/NumberOfPoles_Q1/NumberOfPhases_Q1;

CoilsPhaseShift_Q1 = (360/NumberOfSlots_Q1)*NumberOfPolePairs_Q1;
VectorAngleArray_Q1 = zeros(1,NumberOfSlots_Q1);
VectorMagnitudeArray_Q1 = zeros(1,NumberOfSlots_Q1);
SlotNumberArray = 1:NumberOfSlots_Q1;
for i=1:NumberOfSlots_Q1
    VectorAngleArray_Q1(i) = CoilsPhaseShift_Q1*(i-1);
    VectorMagnitudeArray_Q1(i) = 1;
end
plot(VectorAngleArray_Q1)
x_Q1 = zeros(1,NumberOfSlots_Q1);
y_Q1 = zeros(1,NumberOfSlots_Q1);
for i=1:NumberOfSlots_Q1
    [x_Q1(i), y_Q1(i)] = pol2cart(deg2rad(VectorAngleArray_Q1(i)),VectorMagnitudeArray_Q1(i));
end
plotv([x_Q1;y_Q1])

VectorAngleArrayMod = mod(VectorAngleArray_Q1,360);
% figure 
% plot(SlotNumberArray,VectorAngleArrayMod);

kp1_Q1 = sind(180/2);
kd1_Q1 = sind(q_Q1*(360/NumberOfSlots_Q1)/2)/(2*sind(360/NumberOfSlots_Q1/2));
kw1_Q1 = kd1_Q1*kp1_Q1;

kp3_Q1 = sind(3*180/2);
kd3_Q1 = sind(3*q_Q1*(360/NumberOfSlots_Q1)/2)/(2*sind(3*360/NumberOfSlots_Q1/2));
kw3_Q1 = kd3_Q1*kp3_Q1;

kp5_Q1 = sind(5*180/2);
kd5_Q1 = sind(5*q_Q1*(360/NumberOfSlots_Q1)/2)/(2*sind(5*360/NumberOfSlots_Q1/2));
kw5_Q1 = kd5_Q1*kp5_Q1;

%% Question 2
NumberOfSlots_Q2 = 24;
NumberOfPoles_Q2 = 20;
NumberOfPolePairs_Q2 = NumberOfPoles_Q2/2;
NumberOfPhases_Q2 = 3;

CoilsPhaseShift_Q2 = (360/NumberOfSlots_Q2)*NumberOfPolePairs_Q2;

q_Q2 = NumberOfSlots_Q2/NumberOfPoles_Q2/NumberOfPhases_Q2;

kp1_Q2 = sind(150/2)
kd1_Q2 = sind(q_Q2*(360/NumberOfSlots_Q2)/2)
kw1_Q2 = kd1_Q2*kp1_Q2

kp3_Q2 = sind(3*150/2);
kd3_Q2 = sind(3*q_Q1*(360/120)/2)/(2*sind(3*360/120/2));
kw3_Q2 = kd3_Q2*kp3_Q2;
