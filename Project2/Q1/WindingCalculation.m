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
x_Q1_tag = zeros(1,NumberOfSlots_Q1);
y_Q1_tag = zeros(1,NumberOfSlots_Q1);
for i=1:NumberOfSlots_Q1
    [x_Q1(i), y_Q1(i)] = pol2cart(deg2rad(VectorAngleArray_Q1(i)),VectorMagnitudeArray_Q1(i));
    [x_Q1_tag(i), y_Q1_tag(i)] = pol2cart(deg2rad(VectorAngleArray_Q1(i)),VectorMagnitudeArray_Q1(i));
end
plotv([x_Q1;y_Q1])
x_Q1_tag = 1.1*x_Q1_tag;
y_Q1_tag = 1.1*y_Q1_tag;
plotv([x_Q1;y_Q1])
text(x_Q1_tag(1),y_Q1_tag(1),'1','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(2),y_Q1_tag(2),'2','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(3),y_Q1_tag(3),'3','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(4),y_Q1_tag(4),'4','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(5),y_Q1_tag(5),'5','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(6),y_Q1_tag(6),'6','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(7),y_Q1_tag(7),'7','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(8),y_Q1_tag(8),'8','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(9),y_Q1_tag(9),'9','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(10),y_Q1_tag(10),'10','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(11),y_Q1_tag(11),'11','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(12),y_Q1_tag(12),'11','FontSize',12,'FontWeight','bold')
xlim([-1.4 1.4])
ylim([-1.4 1.4])

VectorAngleArrayMod = mod(VectorAngleArray_Q1,360);
% figure 
% plot(SlotNumberArray,VectorAngleArrayMod);

kp1_Q1 = sind(180/2);
kd1_Q1 = sind(q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(CoilsPhaseShift_Q1/2));
kw1_Q1 = kd1_Q1*kp1_Q1;

kp3_Q1 = sind(3*180/2);
kd3_Q1 = sind(3*q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(3*CoilsPhaseShift_Q1/2));
kw3_Q1 = kd3_Q1*kp3_Q1;

kp5_Q1 = sind(5*180/2);
kd5_Q1 = sind(5*q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(5*CoilsPhaseShift_Q1/2));
kw5_Q1 = kd5_Q1*kp5_Q1;

%% Question 2
close all
NumberOfSlots_Q2 = 24;
NumberOfPoles_Q2 = 20;
NumberOfPolePairs_Q2 = NumberOfPoles_Q2/2;
NumberOfPhases_Q2 = 3;

CoilsPhaseShift_Q2 = (360/NumberOfSlots_Q2)*NumberOfPolePairs_Q2;

q_Q2 = NumberOfSlots_Q2/(NumberOfPoles_Q2*NumberOfPhases_Q2);

kp1_Q2 = sind(150/2);
kd1_Q2 = 1;         %sind(q_Q2*CoilsPhaseShift_Q2/2)/(q_Q2*sind(CoilsPhaseShift_Q2/2));
kw1_Q2 = kd1_Q2*kp1_Q2;

kp3_Q2 = sind(3*150/2);
kd3_Q2 = 1;%sind(3*q_Q2*(CoilsPhaseShift_Q2)/2)/(2*sind(3*CoilsPhaseShift_Q2/2));
kw3_Q2 = kd3_Q2*kp3_Q2;

kp5_Q2 = sind(5*150/2);
kd5_Q2 = 1;%sind(5*q_Q2*(CoilsPhaseShift_Q2)/2)/(2*sind(5*CoilsPhaseShift_Q2/2));
kw5_Q2 = kd5_Q2*kp5_Q2;

for i=1:NumberOfSlots_Q2
    VectorAngleArray_Q2(i) = CoilsPhaseShift_Q2*(i-1);
    VectorMagnitudeArray_Q2(i) = 1;
end
plot(VectorAngleArray_Q2)
x_Q2 = zeros(1,NumberOfSlots_Q2);
y_Q2 = zeros(1,NumberOfSlots_Q2);
x_Q2_tag = zeros(1,NumberOfSlots_Q2);
y_Q2_tag = zeros(1,NumberOfSlots_Q2);
for i=1:NumberOfSlots_Q2
    [x_Q2(i), y_Q2(i)] = pol2cart(deg2rad(VectorAngleArray_Q2(i)),VectorMagnitudeArray_Q2(i));
    [x_Q2_tag(i), y_Q2_tag(i)] = pol2cart(deg2rad(VectorAngleArray_Q2(i)),VectorMagnitudeArray_Q2(i));
end
x_Q2_tag = 1.1*x_Q2_tag;
y_Q2_tag = 1.1*y_Q2_tag;
plotv([x_Q2;y_Q2])
text(x_Q2_tag(1),y_Q2_tag(1),'1-13','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(2),y_Q2_tag(2),'2-14','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(3),y_Q2_tag(3),'3-15','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(4),y_Q2_tag(4),'4-16','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(5),y_Q2_tag(5),'5-17','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(6),y_Q2_tag(6),'6-18','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(7),y_Q2_tag(7),'7-19','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(8),y_Q2_tag(8),'8-20','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(9),y_Q2_tag(9),'9-21','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(10),y_Q2_tag(10),'10-22','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(11),y_Q2_tag(11),'11-23','FontSize',12,'FontWeight','bold')
text(x_Q2_tag(12),y_Q2_tag(12),'12-24','FontSize',12,'FontWeight','bold')
xlim([-1.4 1.4])
ylim([-1.4 1.4])

