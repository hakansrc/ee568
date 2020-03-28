clear
clc
close all
NumberOfSlots_Q2 = 30;
NumberOfPoles_Q2 = 20;
NumberOfPolePairs_Q2 = NumberOfPoles_Q2/2;
NumberOfPhases_Q2 = 3;

CoilsPhaseShift_Q2 = (360/NumberOfSlots_Q2)*NumberOfPolePairs_Q2;
VectorAngleArray_Q2 = zeros(1,NumberOfSlots_Q2);
VectorAngleArrayNormalized_Q2 = zeros(1,NumberOfSlots_Q2);
VectorMagnitudeArray_Q2 = zeros(1,NumberOfSlots_Q2);
SlotNumberArray = 1:NumberOfSlots_Q2;
for i=1:NumberOfSlots_Q2
    VectorAngleArray_Q2(i) = CoilsPhaseShift_Q2*(i-1);
    VectorAngleArrayNormalized_Q2(i) = mod(VectorAngleArray_Q2(i),360);
    VectorMagnitudeArray_Q2(i) = 1;
end
q_Q2 = NumberOfSlots_Q2/(NumberOfPoles_Q2*NumberOfPhases_Q2);

kp1_Q2 = sind(CoilsPhaseShift_Q2/2);
kd1_Q2 = 1; %sind(q_Q2*CoilsPhaseShift_Q2/2)/(q_Q2*sind(CoilsPhaseShift_Q2/2))
kw1_Q2 = (kd1_Q2*kp1_Q2);

kp3_Q2 = sind(3*CoilsPhaseShift_Q2/2);
kd3_Q2 = 1;%sind(3*q_Q2*(CoilsPhaseShift_Q2)/2)/(2*sind(3*CoilsPhaseShift_Q2/2));
kw3_Q2 = kd3_Q2*kp3_Q2;

kp5_Q2 = sind(5*CoilsPhaseShift_Q2/2)
kd5_Q2 = 1;%sind(5*q_Q2*(CoilsPhaseShift_Q2)/2)/(2*sind(5*CoilsPhaseShift_Q2/2));
kw5_Q2 = kd5_Q2*kp5_Q2;

VectorAngleArrayFundamental_Q2 = zeros(1,NumberOfSlots_Q2);
VectorMagnitudeArrayFundamental_Q2 = zeros(1,NumberOfSlots_Q2);
VectorAngleArrayThird_Q2 = zeros(1,NumberOfSlots_Q2);
VectorMagnitudeArrayThird_Q2 = zeros(1,NumberOfSlots_Q2);
VectorAngleArrayFifth_Q2 = zeros(1,NumberOfSlots_Q2);
VectorMagnitudeArrayFifth_Q2 = zeros(1,NumberOfSlots_Q2);
for i=1:NumberOfSlots_Q2
    VectorAngleArrayFundamental_Q2(i) = CoilsPhaseShift_Q2*(i-1);
    VectorAngleArrayThird_Q2(i) = 3*CoilsPhaseShift_Q2*(i-1);
    VectorAngleArrayFifth_Q2(i) = 5*CoilsPhaseShift_Q2*(i-1);
    VectorMagnitudeArrayFundamental_Q2(i) = 1;
    VectorMagnitudeArrayThird_Q2(i) = 1;
    VectorMagnitudeArrayFifth_Q2(i) = 1;
end
plot(VectorAngleArrayFundamental_Q2)
xFundamental_Q2 = zeros(1,NumberOfSlots_Q2);
yFundamental_Q2 = zeros(1,NumberOfSlots_Q2);
xFundamental_Q2_tag = zeros(1,NumberOfSlots_Q2);
yFundamental_Q2_tag = zeros(1,NumberOfSlots_Q2);

xThird_Q2 = zeros(1,NumberOfSlots_Q2);
yThird_Q2 = zeros(1,NumberOfSlots_Q2);
xThird_Q2_tag = zeros(1,NumberOfSlots_Q2);
yThird_Q2_tag = zeros(1,NumberOfSlots_Q2);

xFifth_Q2 = zeros(1,NumberOfSlots_Q2);
yFifth_Q2 = zeros(1,NumberOfSlots_Q2);
xFifth_Q2_tag = zeros(1,NumberOfSlots_Q2);
yFifth_Q2_tag = zeros(1,NumberOfSlots_Q2);
for i=1:NumberOfSlots_Q2
    [xFundamental_Q2(i), yFundamental_Q2(i)] = pol2cart(deg2rad(VectorAngleArrayFundamental_Q2(i)),VectorMagnitudeArrayFundamental_Q2(i));
    [xFundamental_Q2_tag(i), yFundamental_Q2_tag(i)] = pol2cart(deg2rad(VectorAngleArrayFundamental_Q2(i)),VectorMagnitudeArrayFundamental_Q2(i));
    
    [xThird_Q2(i), yThird_Q2(i)] = pol2cart(3*deg2rad(VectorAngleArrayThird_Q2(i)),VectorMagnitudeArrayThird_Q2(i));
    [xThird_Q2_tag(i), yThird_Q2_tag(i)] = pol2cart(3*deg2rad(VectorAngleArrayThird_Q2(i)),VectorMagnitudeArrayThird_Q2(i));
    
    [xFifth_Q2(i), yFifth_Q2(i)] = pol2cart(5*deg2rad(VectorAngleArrayFifth_Q2(i)),VectorMagnitudeArrayFifth_Q2(i));
    [xFifth_Q2_tag(i), yFifth_Q2_tag(i)] = pol2cart(5*deg2rad(VectorAngleArrayFifth_Q2(i)),VectorMagnitudeArrayFifth_Q2(i));
end
xFundamental_Q2_tag = 1.1*xFundamental_Q2_tag;
yFundamental_Q2_tag = 1.1*yFundamental_Q2_tag;
xThird_Q2_tag = 1.1*xThird_Q2_tag;
yThird_Q2_tag = 1.1*yThird_Q2_tag;
xFifth_Q2_tag = 1.2*xFifth_Q2_tag;
yFifth_Q2_tag = 1.2*yFifth_Q2_tag;
%%
figure
subplot(1,3,1)
plotv([xFundamental_Q2;yFundamental_Q2])
xlabel('Fundamental Vector Distribution','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
text(xFundamental_Q2_tag(1)-0.66,yFundamental_Q2_tag(1)-0.08,'1-4-7-10-13-16-19-22-25-28','FontSize',12,'FontWeight','bold')
text(xFundamental_Q2_tag(2),yFundamental_Q2_tag(2),'2-5-8-11-14-17-20-23-26-29','FontSize',12,'FontWeight','bold')
text(xFundamental_Q2_tag(3),yFundamental_Q2_tag(3),'3-6-9-12-15-18-21-24-27-30','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(4),yFundamental_Q2_tag(4),'4-16','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(5),yFundamental_Q2_tag(5),'5-17','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(6),yFundamental_Q2_tag(6),'6-18','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(7),yFundamental_Q2_tag(7),'7-19','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(8),yFundamental_Q2_tag(8),'8-20','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(9),yFundamental_Q2_tag(9),'9-21','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(10),yFundamental_Q2_tag(10),'10-22','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(11),yFundamental_Q2_tag(11),'11-23','FontSize',12,'FontWeight','bold')
% text(xFundamental_Q2_tag(12),yFundamental_Q2_tag(12),'12-24','FontSize',12,'FontWeight','bold')
xlim([-1.5 1.5])
ylim([-1.5 1.5])
%%
% figure
subplot(1,3,2)
plotv([xThird_Q2;yThird_Q2])
xlabel('Third Harmonic Vector Distribution','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
title('Vector distributions for 30 slot 20 pole machine','fontsize',20)
grid on
text(xThird_Q2_tag(1)-0.85,yThird_Q2_tag(1)-0.08,'1-2-3-4-5-6-7-8-9-10','FontSize',12,'FontWeight','bold')
text(xThird_Q2_tag(1)-0.85,yThird_Q2_tag(1)-0.20,'11-12-13-14-15-16-17-18-19-20','FontSize',12,'FontWeight','bold')
text(xThird_Q2_tag(1)-0.85,yThird_Q2_tag(1)-0.32,'21-22-23-24-25-26-27-28-29-30','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(5),yThird_Q2_tag(5),'5-17','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(6),yThird_Q2_tag(6),'6-18','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(7),yThird_Q2_tag(7),'7-19','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(8),yThird_Q2_tag(8),'8-20','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(9),yThird_Q2_tag(9),'9-21','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(10),yThird_Q2_tag(10),'10-22','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(11),yThird_Q2_tag(11),'11-23','FontSize',12,'FontWeight','bold')
% text(xThird_Q2_tag(12),yThird_Q2_tag(12),'12-24','FontSize',12,'FontWeight','bold')
xlim([-1.5 1.5])
ylim([-1.5 1.5])
%%
% figure
subplot(1,3,3)
plotv([xFifth_Q2;yFifth_Q2])
xlabel('Third Harmonic Vector Distribution','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
text(xFifth_Q2_tag(1)-0.66,yFifth_Q2_tag(1)-0.08,'1-4-7-10-13-16-19-22-25-28','FontSize',12,'FontWeight','bold')
text(xFifth_Q2_tag(3),yFifth_Q2_tag(3),'2-5-8-11-14-17-20-23-26-29','FontSize',12,'FontWeight','bold')
text(xFifth_Q2_tag(2),yFifth_Q2_tag(2),'3-6-9-12-15-18-21-24-27-30','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(4),yFifth_Q2_tag(4),'4-16','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(5),yFifth_Q2_tag(5),'9-21','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(6),yFifth_Q2_tag(6),'2-14','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(7),yFifth_Q2_tag(7),'7-19','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(8),yFifth_Q2_tag(8),'12-24','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(9),yFifth_Q2_tag(9),'5-17','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(10),yFifth_Q2_tag(10),'10-22','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(11),yFifth_Q2_tag(11),'3-15','FontSize',12,'FontWeight','bold')
% text(xFifth_Q2_tag(12),yFifth_Q2_tag(12),'8-20','FontSize',12,'FontWeight','bold')
xlim([-1.5 1.5])
ylim([-1.5 1.5])
%% question 2 part 2