clear
clc
close all
load('LinetoLine')

Fs = 10000;
N = numel(LinetoLinePlot1.Voltage);     
DCLINK_upperc_voltage_spectrum = fft(LinetoLinePlot1.Voltage,N)/(0.5*N);  
DCLINK_upperc_voltage_spectrum_abs = abs(DCLINK_upperc_voltage_spectrum(1:(N/2+1)));  
DCLINK_upperc_voltage_spectrum_abs(1) = DCLINK_upperc_voltage_spectrum_abs(1)/2;  
freq = (0:(N/2))*Fs/N; % Fs: Sampling Frequency  
plot(freq,DCLINK_upperc_voltage_spectrum_abs);  

%%
load('Phase')
Fs = 10000;
N = numel(WindingPlot1.Voltage);     
DCLINK_upperc_voltage_spectrum = fft(WindingPlot1.Voltage,N)/(0.5*N);  
DCLINK_upperc_voltage_spectrum_abs = abs(DCLINK_upperc_voltage_spectrum(1:(N/2+1)));  
DCLINK_upperc_voltage_spectrum_abs(1) = DCLINK_upperc_voltage_spectrum_abs(1)/2;  
freq = (0:(N/2))*Fs/N; % Fs: Sampling Frequency  
figure
plot(freq,DCLINK_upperc_voltage_spectrum_abs); 

