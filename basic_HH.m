function [t,OD]=basic_HH(I0, I1, start_time)

%% HH code from a Master's thesis:
%% Ryan Siciliano, The Hodgkin Huxley Model: Its Extensions, Analysis and Numerics
%% Data from: Aaby, D., A Comparitive Study of Numerical Methods for the Hodgkin-Huxley Model of Nerve Cell
%% Action Potentials, U.o. Dayton, Editor 2009.

PLOTSTUFF = 0; %turn plotting on/off

dt=0.01; % Time Step ms default is .04, set to .01 for short
t=0:dt:60; %Time Array ms default is 0:dt:50, set to :30 for short

vars.I0=I0;
vars.I1 = I1;
vars.start_time = start_time;

V=-60; % Initial Membrane voltage 
m=am(V)/(am(V)+bm(V)); % Initial m-value 
n=an(V)/(an(V)+bn(V)); % Initial n-value 
h=ah(V)/(ah(V)+bh(V)); % Initial h-value
y0=[V;n;m;h];
tspan = [0,max(t)];

if PLOTSTUFF
    disp('Starting Integration');
end

opts = odeset('MaxStep',.1);
%Matlab's ode45 function
[tout,V] = ode45(@HH,tspan,y0,opts,vars);

OD=interp1(tout,V(:,1),t);
ODn=interp1(tout,V(:,2),t);
ODm=interp1(tout,V(:,3),t);
ODh=interp1(tout,V(:,4),t);

if PLOTSTUFF
    figure;
    h=plot(t,OD);
    set(h,'linewidth',2);
    legend('V(t)');
    xlabel('Time (ms)');
    ylabel('Voltage (mV)');
    title('Voltage Change for Hodgkin-Huxley Model');
    set(gca,'xlim',[0 max(t)],'ylim',[-80,60]);

    figure
    h=plot(t,ODn,'b',t,ODm,'g',t,ODh,'r'); 
    set(h,'linewidth',2);
    ylabel('Gaining Variables')
    xlabel('Time (ms)')
    set(gca,'xlim',[0 max(t)],'ylim',[0 1]);
    legend('n(t)','m(t)','h(t)');
    
%     figure; 
%     plot(ODm, ODn);
%     xlabel('m');
%     ylabel('n');
%     title('phase space of n vs. m');
end

%% equation and constants in this
function dydt = HH(t,y,vars)

% Constants
ENa=55.17; % mV Na reversal potential 
EK=-72.14; % mV K reversal potential 
El=-49.42; % mV Leakage reversal potential 
gbarNa=1.2; % mS/cm^2 Na conductance 
gbarK=0.36; % mS/cm^2 K conductance 
gbarl=0.003; % mS/cm^2 Leakage conductance
I0 = vars.I0;
I1 = vars.I1;
start_time = vars.start_time;
% I0 = 0.05; %Applied Current [units?]
I = 0;
Cm = 0.01; %Membrane Capacitance

% current applied whe?
if (t>2).*(t<2.5) % set to t < 2.5 or 3
    I = I0;
elseif (t>start_time).*(t<(start_time + 1))
    I = I1;
else
    I = 0;
end

% Values set to equal input values
V = y(1);
n = y(2);
m = y(3);
h = y(4);
gNa=gbarNa*m^3*h;
gK=gbarK*n^4;
gl=gbarl;
INa=gNa*(V-ENa);
IK=gK*(V-EK);
Il=gl*(V-El);

%Hodgkin-Huxley Model Equation
dydt = ...
    [...
    (1/Cm)*(I-(INa+IK+Il)); ...
    an(V)*(1-n)-bn(V)*n; ...
    am(V)*(1- m)-bm(V)*m; ...
    ah(V)*(1-h)-bh(V)*h  ...
    ];

end

%% alph and beta functions for m, n, h
function a=am(v) %Alpha for Variable m 
   a=0.1*(v+35)/(1-exp(-(v+35)/10)); % ORIG CODE 
end

function b=bm(v) %Beta for variable m
   b=4.0*exp(-0.0556*(v+60)); % ORIG CODE
end

function a=an(v)%Alpha for variable n 
    a=0.01*(v+50)/(1-exp(-(v+50)/10)); % ORIG CODE
end

function b=bn(v) %Beta for variable n
    b=0.125*exp(-(v+60)/80); % ORIG CODE
end

function a=ah(v) %Alpha value for variable h
    a=0.07*exp(-0.05*(v+60));
end

function b =bh(v) %beta value for variable h
    b=1/(1+exp(-(0.1)*(v+30)));
end

end