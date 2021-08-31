clc;
clear all;
close all;    


msg = ('Enter the number of bits');
Nubmberofbits=input(msg) ;


Amp= 1; 
time=0:0.001:1;  
frequencyCarrier=2*Nubmberofbits;
frequencyMessage=Nubmberofbits;
xCarrier=Amp.*sin(2*pi*frequencyCarrier*time); 
f1 = figure(1); 
set(f1,'color','#BDACE4');
subplot (3,1,1);

plot(time,xCarrier,'color','#AD2851');
ylabel('Amplitdude V','color','#AD2851');
xlabel('Time S ','color','#AD2851') ;
title('Carrier Signal','color','#4361EE');
grid on;

xMessage= square(2*pi*frequencyMessage*time); 
subplot (3,1,2);
plot(time,xMessage,'color','#AD2851');
ylabel('Amplitdude V','color','#D21D55');
xlabel('Time S ','color','#D21D55') ;
ylim ([-1.5 1.5])
title ('Digital signal','color','#4361EE');

BPSKSignal=xCarrier.*xMessage ;
subplot(3,1,3);
plot(time,BPSKSignal,'color','#AD2851');grid on;
title ('BPSK','color','#4361EE');
ylabel('Amplitdude V ','color','#D21D55');
xlabel('Time S ','color','#D21D55') ;