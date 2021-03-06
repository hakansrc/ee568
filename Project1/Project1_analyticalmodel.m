clear
clc
close all

u0 = 4*pi*10^-7;
deltatheta = 0.01;
theta = 0:deltatheta:180;

N = 250;
Idc = 3;
Leq = zeros(1,numel(theta));
Req = zeros(1,numel(theta));
Teq = zeros(1,numel(theta));
%% for part1 Req = R1//R2 for angle is between 0 - 77.36 degrees (angle coeficiencts are derived in the hand note)
R1coeff_part1 = (0.5e-3)*2/(u0*2*pi*12e-3*20e-3); % 
R2coeff_part1 = (2.5e-3)*2/(u0*2*pi*10e-3*20e-3); %

%% for part2 Req = R2 for angle is between 77.36 - 102,64 degrees (angle coeficiencts are derived in the hand note)
R2coeff_part2 = (2.5e-3*2)/(u0*(77.36/360)*2*pi*10e-3*20e-3);

%% for part3 Req = R1//R2 for angle is between 102,64 to 180 degrees    (angle coeficiencts are derived in the hand note)
R1coeff_part3 = (0.5e-3)*2/(u0*2*pi*12e-3*20e-3); % 
R2coeff_part3 = (2.5e-3)*2/(u0*2*pi*10e-3*20e-3); %


%% Req between 0-77.36 degrees 
for i=1:(find(theta==77.36))
    R1_theta_part1(i) = R1coeff_part1*(360/(77.36-theta(i)));
    R2_theta_part1(i) = R2coeff_part1*(360/theta(i));
    Req(i) = R1_theta_part1(i)*R2_theta_part1(i)/(R1_theta_part1(i)+R2_theta_part1(i));
end
%% Req between 77.36-102.64 degrees
for i=(find(theta==77.36):1:(find(theta==102.64)))
    Req(i) = R2coeff_part2; %no angle dependency
end
%% Req between 102.64-180 degress
for i=(find(theta==102.64):1:(find(theta==180)))
    R1_theta_part3(i) = R1coeff_part3*(360/(theta(i)-102.36));
    R2_theta_part3(i) = R2coeff_part3*(360/(180-theta(i)));
    Req(i) = R1_theta_part3(i)*R2_theta_part3(i)/(R1_theta_part3(i)+R2_theta_part3(i));
end
%% copy the 0-180 degree reluctance to 180-360 degree
Req(1) = Req(2);
Req(numel(theta)) = Req(numel(theta)-1);
for(i=(numel(theta)+1):(2*numel(theta)-1))

    Req(i) = Req(i-numel(theta));
end

%% Resultant inductance
Leq = (N*N)./Req;

%% Torque generated 
for i=1:((2*numel(theta)-1))
    if(i>1)
        Teq(i) = 0.5*(Idc*Idc)*(Leq(i)-Leq(i-1))/(deltatheta*2*pi/360);
    else
        Teq(i) = 0;%0.5*(Idc*Idc)*(Leq(i))/deltatheta;
    end
end

Teq(10265) = 0; % there was an undesired spike, just cover that up;
Teq(18002) = 0; % there was an undesired spike, just cover that up;
Teq(28266) = 0; % there was an undesired spike, just cover that up;
%% Sample the results for plotting with FEA Results
plot(Teq)
for(i=1:360)
    
    TeqSample(i) = Teq(i*100);
    LeqSample(i) = Leq(i*100);
    ReqSample(i) = Req(i*100);
end
%% load the linear fea results
figure
load('Report/Q2_figures/Q2TorqueInductanceDataMaxwell_linear.mat');
subplot(2,1,1);
plot(LeqSample,'LineWidth',2);
hold on
plot(inductance_linear.VarName2/1000,'LineWidth',2);
hold off
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Inductance (Henry)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])
legend('Analytical Result','FEA Result')
% figure
subplot(2,1,2);
plot(TeqSample,'LineWidth',2);
hold on
plot(TorquePlot3_linear.VarName2/1000,'LineWidth',2);
hold off
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Torque (Nm)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])
legend('Analytical Result','FEA Result')
%% load the nonlinear fea results
figure
load('Report/Q3_figures/Q3TorqueInductanceDataMaxwell_nonlinear.mat');
subplot(2,1,1);
plot(LeqSample,'LineWidth',2);
hold on
plot(InductancePlot1_nonlinear.VarName2/1000,'LineWidth',2);
hold off
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Inductance (Henry)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])
legend('Analytical Result','FEA Result')
% figure
subplot(2,1,2);
plot(TeqSample,'LineWidth',2);
hold on
plot(TorquePlot2Copy_nonlinear.Plot/1000,'LineWidth',2);
hold off
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Torque (Nm)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])
legend('Analytical Result','FEA Result')
%% Q1
%a
figure
subplot(3,1,1)
plot(ReqSample,'LineWidth',2);
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Reluctance (Amperes/Weber)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])

% figure
subplot(3,1,2)
plot(LeqSample,'LineWidth',2);
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Inductance (Henry)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])

% figure
subplot(3,1,3)
plot(TeqSample,'LineWidth',2);
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Torque (Nm)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])

%%
load('Report/Q3_figures/material.mat');
figure
plot(material.HA_per_meter,material.Btesla,'LineWidth',2)

xlabel('Magnetic Field Strength (A/m)','FontSize',12,'FontWeight','bold');
ylabel('Magnetic Field Density (T)','FontSize',12,'FontWeight','bold');
set(gca,'FontSize',12,'FontWeight','bold')
grid on
 xlim([0 4000])
% xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])
%%
figure
subplot(2,1,2)
plot(TeqSample,'LineWidth',2);
hold on
plot(TorquePlot3_linear.VarName2/1000,'LineWidth',2);
hold on
plot(TorquePlot2Copy_nonlinear.Plot/1000,'LineWidth',2);
hold off
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Torque (Nm)','FontSize',12,'FontWeight','bold');
legend('Analytical Result','Linear Material (FEA)','Nonlinear Material (FEA)')
set(gca,'FontSize',12,'FontWeight','bold')
grid on
xlim([0 360])
xticks([0 30 60 90 120 150 180 210 240 270 300 330 360])

subplot(2,1,1)
plot(LeqSample,'LineWidth',2);
hold on
plot(inductance_linear.VarName2/1000,'LineWidth',2);
hold on
plot(InductancePlot1_nonlinear.VarName2/1000,'LineWidth',2);
hold off
xlabel('Rotor angle (degrees)','FontSize',12,'FontWeight','bold');
ylabel('Inductance (Henry)','FontSize',12,'FontWeight','bold');
legend('Analytical Result','Linear Material (FEA)','Nonlinear Material (FEA)')
set(gca,'FontSize',12,'FontWeight','bold')
grid on