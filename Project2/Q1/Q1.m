clc
clear
close all

%% Question 1
NumberOfSlots_Q1 = 72;
NumberOfPoles_Q1 = 6;
NumberOfPolePairs_Q1 = NumberOfPoles_Q1/2;
NumberOfPhases_Q1 = 3;
PitchAngle_Q1 = 180;
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
x_Q1_tag = 1.13*x_Q1_tag;
y_Q1_tag = 1.13*y_Q1_tag;
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
text(x_Q1_tag(12),y_Q1_tag(12),'12','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(13),y_Q1_tag(13),'13','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(14),y_Q1_tag(14),'14','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(15),y_Q1_tag(15),'15','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(16),y_Q1_tag(16),'16','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(17),y_Q1_tag(17),'17','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(18),y_Q1_tag(18),'18','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(19),y_Q1_tag(19),'19','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(20),y_Q1_tag(20),'20','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(21),y_Q1_tag(21),'21','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(22),y_Q1_tag(22),'22','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(23),y_Q1_tag(23),'23','FontSize',12,'FontWeight','bold')
text(x_Q1_tag(24),y_Q1_tag(24),'24','FontSize',12,'FontWeight','bold')


xlim([-1.4 1.4])
ylim([-1.4 1.4])

VectorAngleArrayMod = mod(VectorAngleArray_Q1,360);
% figure 
% plot(SlotNumberArray,VectorAngleArrayMod);

kp1_Q1 = sind(PitchAngle_Q1/2);
kd1_Q1 = sind(q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(CoilsPhaseShift_Q1/2));
kw1_Q1 = kd1_Q1*kp1_Q1;

kp3_Q1 = sind(3*PitchAngle_Q1/2);
kd3_Q1 = sind(3*q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(3*CoilsPhaseShift_Q1/2));
kw3_Q1 = kd3_Q1*kp3_Q1;

kp5_Q1 = sind(5*PitchAngle_Q1/2);
kd5_Q1 = sind(5*q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(5*CoilsPhaseShift_Q1/2));
kw5_Q1 = kd5_Q1*kp5_Q1;

