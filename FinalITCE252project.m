%% BPSK Modulartion
%% Clear section


clc;
clear all;
close all;    


% These commands purpose is to clear the workspace , closes all figures and clear



%% Define the Binary signal


  
        
    

prompt = ('Enter the Number of bits'); % This a Message for the user
Nubmberofbits=input(prompt) ; 

if  Nubmberofbits < 0
   msg = 'Invalid numbers of bits you have 100 seconds to rerun the porgram or  matlab will be closed ';
      disp(msg)
      
      pause(100)
       
    exit ;
   
end
 
    


Randomsignal= randi([-1,1],1,Nubmberofbits);
                         

Datarate=0.0001;                     % Data rate 





%% Represnet Input siganl as digital signal


Digitalsignal= [] ;   % This to  intilaize  a matrix

nb=100;          

for n=1 :1: length(Randomsignal)     %this a loop  that purpose is plot each bit
 
    
    if Randomsignal(n)==1 ; % This   a condtion if the random bit is equal to 1
        
            Signals=ones(1,100); % this will create  an array full of ones 

    else Randomsignal(n)==-1 ; % This   a condtion if the random bit is equal to - 1
        Signals=-ones(1,100);            % this will create  an array full of ones
    
    end
    Digitalsignal=[Digitalsignal Signals];  % This will take  an digitalasignal and se and put them toghter

    
end


Timeaxis1=Datarate/nb:Datarate/nb:nb*Nubmberofbits*(Datarate/nb); % time of the signal 

f1 = figure(1); %Intliaze the first figure


set(f1,'color','#BDACE4'); % This function to change the background color


subplot(3,1,1); %  This code is  written to determine the size of the graph


plot(Timeaxis1,Digitalsignal,'lineWidth',2,'color','#AD2851');grid on;   % This function to plot the data


axis([ 0 Datarate*Nubmberofbits -1.5  1.5]);   % This to determine the axis of the first pot.


ylabel('Amplitude(V)','color','#D21D55');       


 xlabel(' Time in seconds','color','#D21D55');


 title('Input signal as digital signal','FontWeight','bold','color','#4361EE');
 




%% Binary PSK Modualtion




Amplitude=1;    

bitrate=1/Datarate;                           
FC =bitrate*2;                                  % frequency carrier 

t2=Datarate/99:Datarate/99:Datarate;                      


Carriersignal=[];                               % intliaze matrix
BPSK=[];                                        % intliaze matrix 

                            
for i=1:1:length(Randomsignal)
    wave=Amplitude*sin(2*pi*FC *t2);
    Carriersignal=[Carriersignal wave];
    
end 



for i=1:1:length(Randomsignal)
    if (Randomsignal(i)==1)
        y=wave;
    else
        y=Amplitude*sin(2*pi* FC *t2+pi);   %-A*sin(2*pi*carrier frequency *t)
    end
    BPSK=[BPSK y];
end


Timeaxis2=Datarate/99:Datarate/99:Datarate*length(Randomsignal);

subplot(3,1,2);             


plot(Timeaxis2,Carriersignal,'lineWidth',2,'color','#AD2851');grid on;

xlabel(' Time in seconds','color','#D21D55');

ylabel('Amplitude(V)','color','#D21D55');

title('Carrier Signal','FontWeight','bold','color','#4361EE');

subplot(3,1,3);

plot(Timeaxis2,BPSK,'lineWidth',2,'color','#AD2851');grid on;

xlabel(' Time in seconds','color','#D21D55');

ylabel('Amplitude(V)','color','#D21D55');
 
 
 
 
 title('Binary PSK Modulation ','FontWeight','bold','color','#4361EE');