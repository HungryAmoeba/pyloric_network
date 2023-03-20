% create one neuron

ABPD.V = -60; %initial membrane voltage
% start with parameters for AB/PD 1

% sodium
ABPD.m_Na = .5; ABPD.h_Na = .5; ABPD.g_Na = 400;

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

