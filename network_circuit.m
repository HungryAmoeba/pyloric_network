% example h

% AB/PD has cell #5
ABPD.V = -60; %initial membrane voltage
% start with parameters for AB/PD 1

% sodium
ABPD.m_Na = .5; ABPD.h_Na = .5; ABPD.g_Na = 300;
%g_Na and others have units of mS/cm^2

% calcium
ABPD.Ca_conc = 100 * 1E-6; %100 nM, put into mM. Arb. starting value

ABPD.m_CaT = .5; ABPD.h_CaT = .5; ABPD.g_CaT = 2.5;
ABPD.m_CaS = .5; ABPD.h_CaS = .5; ABPD.g_CaS = 2;

% Potassium

%transient
ABPD.m_A = .5; ABPD.h_A = .5; ABPD.g_A = 10;

%calcium dependent
ABPD.m_KCa = .5; ABPD.h_KCa = 1; ABPD.g_KCa = 5;

%delayed rectifier
ABPD.m_Kd = .5; ABPD.h_Kd = 1; ABPD.g_Kd = 125;

% Hyperpolarization activated 
ABPD.m_H = .5; ABPD.h_H = 1; ABPD.g_H = .01;

% Leak  
ABPD.m_leak = 1; ABPD.h_leak = 1; ABPD.g_leak = 0;

% create LP neuron

LP.V = -60; %initial membrane voltage
% start with parameters for AB/PD 1

% sodium
LP.m_Na = .5; LP.h_Na = .5; LP.g_Na = 100;

% calcium
LP.Ca_conc = 100 * 1E-6; %100 nM, put into mM. Arb. starting value

LP.m_CaT = .5; LP.h_CaT = .5; LP.g_CaT = 0;
LP.m_CaS = .5; LP.h_CaS = .5; LP.g_CaS = 10;

% Potassium

%transient
LP.m_A = .5; LP.h_A = .5; LP.g_A = 50;

%calcium dependent
LP.m_KCa = .5; LP.h_KCa = 1; LP.g_KCa = 5;

%delayed rectifier
LP.m_Kd = .5; LP.h_Kd = 1; LP.g_Kd = 100;

% Hyperpolarization activated 
LP.m_H = .5; LP.h_H = 1; LP.g_H = 0;

% Leak  
LP.m_leak = 1; LP.h_leak = 1; LP.g_leak = 0.03;

% create PY neuron

PY.V = -60; %initial membrane voltage
% start with parameters for AB/PD 1

% sodium
PY.m_Na = .5; PY.h_Na = .5; PY.g_Na = 100;

% calcium
PY.Ca_conc = 100 * 1E-6; %100 nM, put into mM. Arb. starting value

PY.m_CaT = .5; PY.h_CaT = .5; PY.g_CaT = 2.5;
PY.m_CaS = .5; PY.h_CaS = .5; PY.g_CaS = 2;

% Potassium

%transient
PY.m_A = .5; PY.h_A = .5; PY.g_A = 50;

%calcium dependent
PY.m_KCa = .5; PY.h_KCa = 1; PY.g_KCa = 0;

%delayed rectifier
PY.m_Kd = .5; PY.h_Kd = 1; PY.g_Kd = 125;

% Hyperpolarization activated 
PY.m_H = .5; PY.h_H = 1; PY.g_H = .05;

% Leak  
PY.m_leak = 1; PY.h_leak = 1; PY.g_leak = 0.01;

% Synapses
% Synapses have one of five or six different strenghts:
% 0, 3, 10, 30, 100 nS, or for synapses onto PY, 1 nS
%PRESYNAPTIC.POSTSYNAPTIC_{glu/cho}_{g/s}

% ABPD
ABPD.LP_glu_g = 3 * 1E-6; % put into units of mS
ABPD.PY_glu_g = 10 * 1E-6;
ABPD.LP_cho_g = 100 * 1E-6;
ABPD.PY_cho_g = 1 * 1E-6;

LP.ABPD_glu_g = 10 * 1E-6;
LP.PY_glu_g = 3 * 1E-6;

PY.LP_glu_g = 10 * 1E-6;

% synapse action variables
ABPD.LP_glu_s = .75; % assigned to values at the end of a run
ABPD.PY_glu_s = .75;
ABPD.LP_cho_s = .89;
ABPD.PY_cho_s = .89;

LP.ABPD_glu_s = .72;
LP.PY_glu_s = .72;

PY.LP_glu_s = .69;

% this is really only useful for interpolation afterwards
dt = 0.1;
t = 0:dt:2000; % what if t is in ms?

tspan = [0, max(t)];

y0 = [ABPD.V; ...
    ABPD.m_Na; ABPD.h_Na; ...
    ABPD.Ca_conc; ...
    ABPD.m_CaT; ABPD.h_CaT; ...
    ABPD.m_CaS; ABPD.h_CaS; ...
    ABPD.m_A; ABPD.h_A; ...
    ABPD.m_KCa; ABPD.h_KCa; ...
    ABPD.m_Kd; ABPD.h_Kd; ...
    ABPD.m_H; ABPD.h_H; ...
    ABPD.m_leak; ABPD.h_leak; ...
    LP.V; ...
    LP.m_Na; LP.h_Na; ...
    LP.Ca_conc; ...
    LP.m_CaT; LP.h_CaT; ...
    LP.m_CaS; LP.h_CaS; ...
    LP.m_A; LP.h_A; ...
    LP.m_KCa; LP.h_KCa; ...
    LP.m_Kd; LP.h_Kd; ...
    LP.m_H; LP.h_H; ...
    LP.m_leak; LP.h_leak; ...
    PY.V; ...
    PY.m_Na; PY.h_Na; ...
    PY.Ca_conc; ...
    PY.m_CaT; PY.h_CaT; ...
    PY.m_CaS; PY.h_CaS; ...
    PY.m_A; PY.h_A; ...
    PY.m_KCa; PY.h_KCa; ...
    PY.m_Kd; PY.h_Kd; ...
    PY.m_H; PY.h_H; ...
    PY.m_leak; PY.h_leak; ...
    ABPD.LP_glu_s; ...
    ABPD.PY_glu_s; ...
    ABPD.LP_cho_s; ...
    ABPD.PY_cho_s; ...
    LP.ABPD_glu_s; ...
    LP.PY_glu_s; ...
    PY.LP_glu_s
];
vars.ABPD = ABPD;
vars.LP = LP;
vars.PY = PY;

% this likely doesn't do anything
opts = odeset('MaxStep',10); % increase maxstep to 1 when using ms

% changed from ode45
[TOUT, YOUT] = ode23(@neural_circuit_func, tspan, y0, opts, vars);

subplot(3,1,1);
plot(TOUT, YOUT(:,1))
title("ABPD voltage");

subplot(3,1,2);
plot(TOUT, YOUT(:,19))
title("LP voltage");

subplot(3,1,3);
plot(TOUT, YOUT(:,37))
title("PY voltage");
xlabel("Time (s)");
ylabel("mV");

savefig('model_h.fig')
