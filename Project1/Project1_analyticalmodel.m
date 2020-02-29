clear
clc


u0 = 4*pi*10^-7;
deltatheta = 0.01;
theta = 0:deltatheta:180;

N = 20;
Idc = 1;
Leq = zeros(1,numel(theta));
Req = zeros(1,numel(theta));
Teq = zeros(1,numel(theta));
%% for part1 Req = R1//R2 for angle is between 0 - 77.36 degrees (angle coeficiencts are derived in the hand note)
R1coeff_part1 = (0.5e-3)*2/(u0*2*pi*12e-3*20e-3); % 
R2coeff_part1 = (2.5e-3)*2/(u0*2*pi*10e-3*20e-3); %

%% for part2 Req = R2 for angle is between 77.36 - 102,64 degrees (angle coeficiencts are derived in the hand note)
R2coeff_part2 = (2.5e-3*2)/(u0*(77.36/360)*2*pi*10e-3*20e-3);

%% for part3 Req = R1//R2 for angle is between 102,64 to 180 degrees (angle coeficiencts are derived in the hand note)
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
%% reluctance over 360 degrees
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
        Teq(i) = 0.5*(Idc*Idc)*(Leq(i)-Leq(i-1))/deltatheta;
    else
        Teq(i) = 0;%0.5*(Idc*Idc)*(Leq(i))/deltatheta;
    end
end

Teq(10265) = 0; % there was an undesired spike, just cover that up;
Teq(18002) = 0; % there was an undesired spike, just cover that up;
Teq(28266) = 0; % there was an undesired spike, just cover that up;

plot(Teq)







