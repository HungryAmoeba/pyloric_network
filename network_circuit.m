% create one neuron

ABPD.V = -60; %initial membrane voltage
% start with parameters for AB/PD 1

% sodium
ABPD.m_Na = .5; ABPD.h_Na = .5; ABPD.g_Na = 400;
%g_Na and others have units of mS/cm^2

% calcium
ABPD.Ca_conc = 100 * 1E-6; %100 nM, put into mM. Arb. starting value

ABPD.m_CaT = .5; ABPD.h_CaT = .5; ABPD.g_CaT = 2.5;
ABPD.m_CaS = .5; ABPD.h_CaS = .5; ABPD.g_CaS = 6;

% Potassium

%transient
ABPD.m_A = .5; ABPD.h_A = .5; ABPD.g_A = 50;

%calcium dependent
ABPD.m_KCa = .5; ABPD.h_KCa = .5; ABPD.g_KCa = 10;

%delayed rectifier
ABPD.m_Kd = .5; ABPD.h_Kd = .5; ABPD.g_Kd = 100;

% Hyperpolarization activated 
ABPD.m_H = .5; ABPD.h_H = .5; ABPD.g_H = .01;

% Leak  
ABPD.m_leak = .5; ABPD.h_leak = .5; ABPD.g_leak = 0;

% create LP neuron

LP.V = -60; %initial membrane voltage
% start with parameters for AB/PD 1

% sodium
LP.m_Na = .5; LP.h_Na = .5; LP.g_Na = 100;

% calcium
LP.Ca_conc = 100 * 1E-6; %100 nM, put into mM. Arb. starting value

LP.m_CaT = .5; LP.h_CaT = .5; LP.g_CaT = 0;
LP.m_CaS = .5; LP.h_CaS = .5; LP.g_CaS = 8;

% Potassium

%transient
LP.m_A = .5; LP.h_A = .5; LP.g_A = 40;

%calcium dependent
LP.m_KCa = .5; LP.h_KCa = .5; LP.g_KCa = 5;

%delayed rectifier
LP.m_Kd = .5; LP.h_Kd = .5; LP.g_Kd = 75;

% Hyperpolarization activated 
LP.m_H = .5; LP.h_H = .5; LP.g_H = .05;

% Leak  
LP.m_leak = .5; LP.h_leak = .5; LP.g_leak = 0.2;

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
PY.m_KCa = .5; PY.h_KCa = .5; PY.g_KCa = 0;

%delayed rectifier
PY.m_Kd = .5; PY.h_Kd = .5; PY.g_Kd = 125;

% Hyperpolarization activated 
PY.m_H = .5; PY.h_H = .5; PY.g_H = .05;

% Leak  
PY.m_leak = .5; PY.h_leak = .5; PY.g_leak = 0;

% Synapses
% Synapses have one of five or six different strenghts:
% 0, 3, 10, 30, 100 nS, or for synapses onto PY, 1 nS
% ABPD
ABPD.LP_glu_g = 30 * 1E-6; % put into units of mS
ABPD.PY_glu_g = 1 * 1E-6;
ABPD.LP_cho_g = 30 * 1E-6;
ABPD.PY_cho_g = 1 * 1E-6;

LP.ABPD_glu_g = 10 * 1E-6;
LP.PY_glu_g = 1 * 1E-6;

PY.LP_glu_g = 10 * 1E-6;

% synapse action variables
ABPD.LP_glu_s = 30 * 1E-6; % i have no idea what values are reasonable
ABPD.PY_glu_s = 1 * 1E-6;
ABPD.LP_cho_s = 30 * 1E-6;
ABPD.PY_cho_s = 1 * 1E-6;

LP.ABPD_glu_s = 10 * 1E-6;
LP.PY_glu_s = 1 * 1E-6;

PY.LP_glu_s = 10 * 1E-6;

dt = 0.01;
t = 0:dt:60;

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

[TOUT, YOUT] = ode45(@neural_circuit_func, tspan, y0);


