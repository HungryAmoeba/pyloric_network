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
