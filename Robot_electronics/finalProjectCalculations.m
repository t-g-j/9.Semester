%figure
%plot(v,pct)
%title('First value reading')
%xlabel('Duty cycle')
%ylabel('Voltages')
%voltages = [10.7,10.6,10.6,10.5,10.3,10.2,9.7,9.0,7.5,5];
%b1 = x/y
voltages = [10,9.5,8.7,7.8,6.8,5.8,4.8,3.8,2.7,1.5];
percentages = [1:10];
percentages = percentages*10;
percentages = flip(percentages);
scatter(voltages,percentages,'+')
hold on
p = polyfit(voltages, percentages, 1);
y_fit = polyval(p, voltages);
plot(voltages,y_fit,'r')
grid on
hold off
% Fit the data in a model
%myFit = fit(voltages',percentages','lowess')
%plot(myFit,voltages',percentages')
title('Value reading from 10 to 100% duty cycle')
ylabel('Duty cycle')
xlabel('Voltages')
hold off

%% Calculate thex values for testing The voltage
%tmp = y_axis./10;
%res = 255*tmp;
%res = round(res);
%myHex = dec2hex(res);

%% Filter sections
%load = 1000 % ohm
syms x;
pwm_freq = 24*10^3;
solve(pwm_freq == 1/(2*pi*sqrt((50*10^-6)*x)))

%% Voltage measure - Differntial OP-amp LM324

figure
diffAmpVolt = [0:10];
V_out = [0.016, 0.321, 0.641 ,0.961 ,1.281 ,1.600 ,1.921 ,2.241 ,2.561 ,2.881 ,3.200];

scatter(diffAmpVolt,V_out)
hold on
p = polyfit(diffAmpVolt, V_out, 1);
y_fit = polyval(p, diffAmpVolt);
plot(diffAmpVolt,y_fit,'r')
title('Relationship between the voltage Voltage to the load and to the ADC')
ylabel('V out to the ADC[V]')
xlabel('Voltage to the load[V]')

grid on
hold off
%% Amp measure - Differential OP-amp LM324 
figure
Amps = [0:10];
Amps = 0.1*Amps
V_diff = [0.0008,0.245,0.522,0.646,.722,.869,1.02,1.18,1.34,1.48,1.57];
V_diff_real = [0.0,0.082,0.176,0.282,0.389,0.495,0.585,0.626,0.649,0.664,0.676];
scatter(V_diff_real,Amps)

hold on
myfit = fit(V_diff_real',Amps','exp1')
plot(myfit,V_diff_real,Amps)
title('Amps through system & voltage measured from amplifier')
ylabel('Amps limited by generator [A]')
xlabel('Voltage equivilent to amps through load [V]')
grid on
hold off
R1 = 1;
R2 = 1000;
R3 = 500000;


figure
scatter(V_diff_real, Amps)
hold on
grid on
p = polyfit(V_diff_real, Amps, 1);
y_fit = polyval(p, V_diff_real);
plot(V_diff_real,y_fit,'r')

title('Amps through system & voltage measured from amplifier')
ylabel('Amps limited by generator [A]')
xlabel('Voltage equivilent to amps through load [V]')
hold off
%scatter(Amps,V_diff)

%figure 
%scatter(Amps,i_load)

%% Theory of operation AD627 NOT USED!

vInPlus = 10;
vInMinus = 3;
Vref = 0;
Rg = 300*10^3;
Vout = (vInPlus-vInMinus)*(5 + (200*10^3/Rg)) + Vref

%%
%x = (0:0.2:5)';
%y = 2*exp(-0.2*x) + 0.1*randn(size(x));
%f = fit(x,y,'exp1')
