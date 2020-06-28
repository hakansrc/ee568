clc
clear
close all
%% Question 1
NumberOfSlots_Q1 = 54;
NumberOfPoles_Q1 = 12;
NumberOfPolePairs_Q1 = NumberOfPoles_Q1/2;
NumberOfPhases_Q1 = 3;
% PitchAngle_Q1 = 120;
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
xlabel('Fundamental Vector Distribution','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
title('Vector distributions for 54 slot 12 pole machine','fontsize',20)
grid on
x_Q1_tag = 1.1*x_Q1_tag;
y_Q1_tag = 1.2*y_Q1_tag;
for i=1:numel(x_Q1_tag)
    if(x_Q1_tag(i)<0)
        x_Q1_tag(i) = 1.5*x_Q1_tag(i);
    end
end

% plotv([x_Q1;y_Q1])
text(x_Q1_tag(1),y_Q1_tag(1),'1-10-19-28-37-46','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(2),y_Q1_tag(2),'2-11-20-29-38-47','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(3),y_Q1_tag(3),'3-12-21-30-39-48','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(4),y_Q1_tag(4),'4-13-22-31-40-49','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(5),y_Q1_tag(5),'5-14-23-32-41-50','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(6),y_Q1_tag(6),'6-15-24-33-42-51','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(7),y_Q1_tag(7),'7-16-25-34-43-52','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(8),y_Q1_tag(8),'8-17-26-35-44-53','FontSize',12,'FontWeight','bold','linewidth',5)
text(x_Q1_tag(9),y_Q1_tag(9),'9-18-27-36-45-54','FontSize',12,'FontWeight','bold','linewidth',5)
% text(x_Q1_tag(10),y_Q1_tag(10),'10','FontSize',12,'FontWeight','bold')
% text(x_Q1_tag(11),y_Q1_tag(11),'11','FontSize',12,'FontWeight','bold')
% text(x_Q1_tag(12),y_Q1_tag(12),'11','FontSize',12,'FontWeight','bold')
xlim([-1.8 1.8])
ylim([-1.8 1.8])

VectorAngleArrayMod = mod(VectorAngleArray_Q1,360);
% figure 
% plot(SlotNumberArray,VectorAngleArrayMod);

% kp1_Q1 = sind(PitchAngle_Q1/2);
% kd1_Q1 = sind(q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(CoilsPhaseShift_Q1/2));
% kw1_Q1 = kd1_Q1*kp1_Q1;
% 
% kp3_Q1 = sind(3*PitchAngle_Q1/2);
% kd3_Q1 = sind(3*q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(3*CoilsPhaseShift_Q1/2));
% kw3_Q1 = kd3_Q1*kp3_Q1;
% 
% kp5_Q1 = sind(5*PitchAngle_Q1/2);
% kd5_Q1 = sind(5*q_Q1*(CoilsPhaseShift_Q1)/2)/(2*sind(5*CoilsPhaseShift_Q1/2));
% kw5_Q1 = kd5_Q1*kp5_Q1;

