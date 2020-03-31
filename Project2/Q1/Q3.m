clear
clc
B1_mag = 1;
B3_mag = 0.3;
B5_mag = 0.1;

MotorRPM = 500;
NumberOfPoles = 20;
freq1 = NumberOfPoles*MotorRPM/120;
freq3 = freq1*3;
freq5 = freq1*5;

NumberOfCoils = 4*9;
kw1 = 0.966;
kw3 = -0.707;
kw5 = 0.2588;

E1_mag = 4.44*NumberOfCoils*pi*0.0805*2*0.084*0.9*83.3333*kw1/20;