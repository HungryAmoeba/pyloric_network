function dydt = neural_circuit_func(t,y, vars)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    ABPD_V = y(1);
    ABPD_m_Na = y(2);
    ABPD_h_Na = y(3);
    ABPD_Ca_conc = y(4);
    ABPD_m_CaT = y(5);
    ABPD_h_CaT = y(6);
    ABPD_m_CaS = y(7);
    ABPD_h_CaS = y(8);
    ABPD_m_A = y(9);
    ABPD_h_A = y(10);
    ABPD_m_KCa = y(11);
    ABPD_h_KCa = y(12);
    ABPD_m_Kd = y(13);
    ABPD_h_Kd = y(14);
    ABPD_m_H = y(15);
    ABPD_h_H = y(16);
    ABPD_m_leak = y(17);
    ABPD_h_leak = y(18);
    LP_V = y(19);
    LP_m_Na = y(20);
    LP_h_Na = y(21);
    LP_Ca_conc = y(22);
    LP_m_CaT = y(23);
    LP_h_CaT = y(24);
    LP_m_CaS = y(25);
    LP_h_CaS = y(26);
    LP_m_A = y(27);
    LP_h_A = y(28);
    LP_m_KCa = y(29);
    LP_h_KCa = y(30);
    LP_m_Kd = y(31);
    LP_h_Kd = y(32);
    LP_m_H = y(33);
    LP_h_H = y(34);
    LP_m_leak = y(35);
    LP_h_leak = y(36);
    PY_V = y(37);
    PY_m_Na = y(38);
    PY_h_Na = y(39);
    PY_Ca_conc = y(40);
    PY_m_CaT = y(41);
    PY_h_CaT = y(42);
    PY_m_CaS = y(43);
    PY_h_CaS = y(44);
    PY_m_A = y(45);
    PY_h_A = y(46);
    PY_m_KCa = y(47);
    PY_h_KCa = y(48);
    PY_m_Kd = y(49);
    PY_h_Kd = y(50);
    PY_m_H = y(51);
    PY_h_H = y(52);
    PY_m_leak = y(53);
    PY_h_leak = y(54);
    ABPD_LP_glu_s = y(55);
    ABPD_PY_glu_s = y(56);
    ABPD_LP_cho_s = y(57);
    ABPD_PY_cho_s = y(58);
    LP_ABPD_glu_s = y(59);
    LP_PY_glu_s = y(60);
    PY_LP_glu_s = y(61);
    
    ABPD_I_CaT = I_CaT(ABPD_V, ABPD_m_CaT, ABPD_h_CaT, ABPD_Ca_conc, vars.ABPD.g_CaT);
    ABPD_I_CaS = I_CaS(ABPD_V, ABPD_m_CaS, ABPD_h_CaS, ABPD_Ca_conc, vars.ABPD.g_CaS);
    ABPD_currents_sum = I_Na(ABPD_V, ABPD_m_Na, ABPD_h_Na, vars.ABPD.g_Na) ...
        + I_CaT(ABPD_V, ABPD_m_CaT, ABPD_h_CaT, ABPD_Ca_conc, vars.ABPD.g_CaT) ...
        + I_CaS(ABPD_V, ABPD_m_CaS, ABPD_h_CaS, ABPD_Ca_conc, vars.ABPD.g_CaS) ...
        + I_A(ABPD_V, ABPD_m_A, ABPD_h_A, vars.ABPD.g_A) ...
        + I_KCa(ABPD_V, ABPD_m_KCa, ABPD_h_KCa, vars.ABPD.g_KCa) ...
        + I_Kd(ABPD_V, ABPD_m_Kd, ABPD_h_Kd, vars.ABPD.g_Kd) ...
        + I_H(ABPD_V, ABPD_m_H, ABPD_h_H, vars.ABPD.g_H) ...
        + I_leak(ABPD_V, ABPD_m_leak, ABPD_h_leak, vars.ABPD.g_leak);
        
    PY_I_CaT = I_CaT(PY_V, PY_m_CaT, PY_h_CaT, PY_Ca_conc, vars.PY.g_CaT);
    PY_I_CaS = I_CaS(PY_V, PY_m_CaS, PY_h_CaS, PY_Ca_conc, vars.PY.g_CaS);
    PY_currents_sum = I_Na(PY_V, PY_m_Na, PY_h_Na, vars.PY.g_Na) ...
        + I_CaT(PY_V, PY_m_CaT, PY_h_CaT, PY_Ca_conc, vars.PY.g_CaT) ...
        + I_CaS(PY_V, PY_m_CaS, PY_h_CaS, PY_Ca_conc, vars.PY.g_CaS) ...
        + I_A(PY_V, PY_m_A, PY_h_A, vars.PY.g_A) ...
        + I_KCa(PY_V, PY_m_KCa, PY_h_KCa, vars.PY.g_KCa) ...
        + I_Kd(PY_V, PY_m_Kd, PY_h_Kd, vars.PY.g_Kd) ...
        + I_H(PY_V, PY_m_H, PY_h_H, vars.PY.g_H) ...
        + I_leak(PY_V, PY_m_leak, PY_h_leak, vars.PY.g_leak);

    LP_I_CaT = I_CaT(LP_V, LP_m_CaT, LP_h_CaT, LP_Ca_conc, vars.LP.g_CaT);
    LP_I_CaS = I_CaS(LP_V, LP_m_CaS, LP_h_CaS, LP_Ca_conc, vars.LP.g_CaS);
    LP_currents_sum = I_Na(LP_V, LP_m_Na, LP_h_Na, vars.LP.g_Na) ...
        + I_CaT(LP_V, LP_m_CaT, LP_h_CaT, LP_Ca_conc, vars.LP.g_CaT) ...
        + I_CaS(LP_V, LP_m_CaS, LP_h_CaS, LP_Ca_conc, vars.LP.g_CaS) ...
        + I_A(LP_V, LP_m_A, LP_h_A, vars.LP.g_A) ...
        + I_KCa(LP_V, LP_m_KCa, LP_h_KCa, vars.LP.g_KCa) ...
        + I_Kd(LP_V, LP_m_Kd, LP_h_Kd, vars.LP.g_Kd) ...
        + I_H(LP_V, LP_m_H, LP_h_H, vars.LP.g_H) ...
        + I_leak(LP_V, LP_m_leak, LP_h_leak, vars.LP.g_leak);
    
    ABPD_synapse_current = I_s_cho(ABPD_V, vars.LP.ABPD_glu_g, LP_ABPD_glu_s);
    
    LP_synapse_current = I_s_glu(LP_V, vars.ABPD.LP_glu_g, ABPD_LP_glu_s) ...
        + I_s_cho(LP_V, vars.ABPD.LP_cho_g, ABPD_LP_cho_s) ...
        + I_s_glu(LP_V, vars.PY.LP_glu_g, PY_LP_glu_s);
    
    PY_synapse_current = I_s_glu(PY_V, vars.ABPD.PY_glu_g, ABPD_PY_glu_s) ...
        + I_s_cho(PY_V, vars.ABPD.PY_cho_g, ABPD_PY_cho_s) ...
        + I_s_glu(PY_V, vars.LP.PY_glu_g, LP_PY_glu_s);
    
    %dydt = zeros(size(y));
    
    dydt = [dV(ABPD_currents_sum, ABPD_synapse_current); ...%ABPD_V % = y(1);
        dm_I_Na(ABPD_V, ABPD_m_Na); ... %ABPD_m_Na % = y(2);
        dh_I_Na(ABPD_V, ABPD_h_Na); ... %ABPD_h_Na = y(3);
        dCa(ABPD_Ca_conc, ABPD_I_CaT, ABPD_I_CaS); ... % ABPD_Ca_conc = y(4);
        dm_I_CaT(ABPD_V, ABPD_m_CaT); ... %ABPD_m_CaT % = y(5);
        dh_I_CaT(ABPD_V, ABPD_h_CaT); ... %ABPD_h_CaT % = y(6);
        dm_I_CaS(ABPD_V, ABPD_m_CaS); ... %ABPD_m_CaS % = y(7);
        dh_I_CaS(ABPD_V, ABPD_h_CaS); ... %ABPD_h_CaS % = y(8);
        dm_I_A(ABPD_V, ABPD_m_A); ... %ABPD_m_A % = y(9);
        dh_I_A(ABPD_V, ABPD_h_A); ... %ABPD_h_A % = y(10);
        dm_I_KCa(ABPD_V, ABPD_m_KCa, ABPD_Ca_conc); %ABPD_m_KCa % = y(11);
        0; ... %ABPD_h_KCa % = y(12);
        dm_I_Kd(ABPD_V, ABPD_m_Kd); ...%ABPD_m_Kd % = y(13);
        0; ... %ABPD_h_Kd % = y(14);
        dm_I_H(ABPD_V, ABPD_m_H); ... %ABPD_m_H % = y(15);
        0; ... %ABPD_h_H % = y(16);
        0; ... %ABPD_m_leak % = y(17);
        0; ... %ABPD_h_leak % = y(18);
        dV(LP_currents_sum, LP_synapse_current); ...%LP_V % = y(19);
        dm_I_Na(LP_V, LP_m_Na); ... %LP_m_Na % = y(20);
        dh_I_Na(LP_V, LP_h_Na); ... %LP_h_Na = y(21);
        dCa(LP_Ca_conc, LP_I_CaT, LP_I_CaS); ... % LP_Ca_conc = y(22);
        dm_I_CaT(LP_V, LP_m_CaT); ... %LP_m_CaT % = y(23);
        dh_I_CaT(LP_V, LP_h_CaT); ... %LP_h_CaT % = y(24);
        dm_I_CaS(LP_V, LP_m_CaS); ... %LP_m_CaS % = y(25);
        dh_I_CaS(LP_V, LP_h_CaS); ... %LP_h_CaS % = y(26);
        dm_I_A(LP_V, LP_m_A); ... %LP_m_A % = y(27);
        dh_I_A(LP_V, LP_h_A); ... %LP_h_A % = y(28);
        dm_I_KCa(LP_V, LP_m_KCa, LP_Ca_conc); %LP_m_KCa % = y(29);
        0; ... %LP_h_KCa % = y(30);
        dm_I_Kd(LP_V, LP_m_Kd); ...%LP_m_Kd % = y(31);
        0; ... %LP_h_Kd % = y(32);
        dm_I_H(LP_V, LP_m_H); ... %LP_m_H % = y(33);
        0; ... %LP_h_H % = y(34);
        0; ... %LP_m_leak % = y(35);
        0; ... %LP_h_leak % = y(36);
        dV(PY_currents_sum, PY_synapse_current); ...%PY_V % = y(37);
        dm_I_Na(PY_V, PY_m_Na); ... %PY_m_Na % = y(38);
        dh_I_Na(PY_V, PY_h_Na); ... %PY_h_Na = y(39);
        dCa(PY_Ca_conc, PY_I_CaT, PY_I_CaS); ... % PY_Ca_conc = y(40);
        dm_I_CaT(PY_V, PY_m_CaT); ... %PY_m_CaT % = y(41);
        dh_I_CaT(PY_V, PY_h_CaT); ... %PY_h_CaT % = y(42);
        dm_I_CaS(PY_V, PY_m_CaS); ... %PY_m_CaS % = y(43);
        dh_I_CaS(PY_V, PY_h_CaS); ... %PY_h_CaS % = y(44);
        dm_I_A(PY_V, PY_m_A); ... %PY_m_A % = y(45);
        dh_I_A(PY_V, PY_h_A); ... %PY_h_A % = y(46);
        dm_I_KCa(PY_V, PY_m_KCa, PY_Ca_conc); %PY_m_KCa % = y(47);
        0; ... %PY_h_KCa % = y(48);
        dm_I_Kd(PY_V, PY_m_Kd); ...%PY_m_Kd % = y(49);
        0; ... %PY_h_Kd % = y(50);
        dm_I_H(PY_V, PY_m_H); ... %PY_m_H % = y(51);
        0; ... %PY_h_H % = y(52);
        0; ... %PY_m_leak % = y(53);
        0; ... %PY_h_leak % = y(54);
        ds_glutameric(ABPD_LP_glu_s, ABPD_V); ... % ABPD_LP_glu_s % = y(55);
        ds_glutameric(ABPD_PY_glu_s, ABPD_V); ... %ABPD_PY_glu_s % = y(56);
        ds_cholinergic(ABPD_LP_cho_s, ABPD_V); ... %ABPD_LP_cho_s % = y(57);
        ds_cholinergic(ABPD_PY_cho_s, ABPD_V); ... %ABPD_PY_cho_s % = y(58);
        ds_glutameric(LP_ABPD_glu_s, LP_V); ... %LP_ABPD_glu_s % = y(59);
        ds_glutameric(LP_PY_glu_s, LP_V); %LP_PY_glu_s % = y(60);
        ds_glutameric(PY_LP_glu_s, PY_V) ... % PY_LP_glu_s % = y(61);
    ];
    
end

%% 
% Helper functions to calculate the currents and changes in
% neuronal activation and inactivation


function sig = sig(x)
    sig = 1/ (1 + exp(x));
end

% always assume that V is in mV
% g is in mS/cm^2

% sodium 

function I = I_Na(V, m ,h, g)
    p = 3; A = .628E-3; % A has units of cm^2
    %g maximal conductance, need to search up
    Ei = 50; % reversal potential, mV
    I = g * m^p * h * (V - Ei) * A;
end
% I has units of microamperes

function dmdt = dm_I_Na(V, m)
    tau_m = 2.64 - 2.52 * sig((V + 120)/-25);
    m_inf = sig((V + 25.5)/-5.29);
    dmdt = (m_inf - m) / tau_m;
end
% what are the units of dmdt?


function dhdt = dh_I_Na(V, h)
    tau_h = 1.34 * sig((V + 62.9)/-10) * (1.5 + sig((V+34.9)/3.6));
    h_inf = sig((V + 48.9)/5.18);
    dhdt = (h_inf - h)/tau_h;
end

% change in calcium concentration
function dCadt = dCa(Ca_conc, I_CaT, I_CaS)
    tau = 200; % all times for the code is in ms
    f = 14.96;
    Ca_0 = .05 * 1E-3; % now in units of mM
    dCadt = (-f * (I_CaT + I_CaS) - Ca_conc + Ca_0)/tau;
end
% calcium transient

function I = I_CaT(V, m ,h, Ca_conc, g)
    p = 3; A = .628E-3;
    % g = 000000000; % maximal conductance, need to search up
    % reversal potential must be calculated from nernst potential
    %E = RT/(zF) * log( [out]/[in] )
    E = 27/2 * log(3/ Ca_conc); % 3 is in units of mM
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_CaT(V, m)
    tau_m = 43.4 - 42.6 * sig((V + 68.1)/-20.5);
    m_inf = sig((V + 27.1)/-7.2);
    dmdt = (m_inf - m) / tau_m;
end

function dhdt = dh_I_CaT(V, h)
    tau_h = 210 - 179.6 * sig((V + 55)/-16.9);
    h_inf = sig((V + 32.1)/5.5);
    dhdt = (h_inf - h)/tau_h;
end

% slow calcium

function I = I_CaS(V, m, h, Ca_conc, g)
    p = 3; A = .628E-3;
    % reversal potential must be calculated from nernst potential
    %E = RT/(zF) * log( [out]/[in] )
    E = 27/2 * log(3/ Ca_conc);
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_CaS(V, m)
    tau_m = 2.8 + 14 / ( exp((V+ 27)/10) + exp((V+70)/-13) );
    m_inf = sig((V + 33)/-8.1);
    dmdt = (m_inf - m) / tau_m;
end

function dhdt = dh_I_CaS(V, h)
    tau_h = 120 + 300 / ( exp((V+ 55)/9) + exp((V+65)/-16) );
    h_inf = sig((V + 60)/6.2);
    dhdt = (h_inf - h)/tau_h;
end

% transient K+ current

function I = I_A(V, m, h, g)
    p = 3; A = .628E-3;
    E = -80;
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_A(V, m)
    tau_m = 23.2 - 20.8 * sig((V + 32.9)/-15.2);
    m_inf = sig((V + 27.2)/-8.7);
    dmdt = (m_inf - m) / tau_m;
end

function dhdt = dh_I_A(V, h)
    tau_h = 77.2 - 58.4 * sig((V + 38.9)/-26.5);
    h_inf = sig((V + 56.9)/4.9);
    dhdt = (h_inf - h)/tau_h;
end

% calcium dependent potassium current

function I = I_KCa(V, m, h, g)
    p = 4; A = .628E-3;
    E = -80;
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_KCa(V, m, Ca_conc)
    tau_m = 180.6 - 150.2 * sig((V+46/-22.7));
    m_inf = Ca_conc/ (Ca_conc + 3) * sig((V + 28.3)/-12.6);
    dmdt = (m_inf - m) / tau_m;
end

% delayed rectifier K+ current I_Kd

function I = I_Kd(V, m, h, g)
    p = 4; A = .628E-3;
    E = -80;
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_Kd(V, m)
    tau_m = 14.4 - 12.8 * sig((V + 28.3)/-19.2);
    m_inf = sig((V+12.3)/-11.8);
    dmdt = (m_inf - m) / tau_m;
end

% hyperpolarization-activated inward current I_H

function I = I_H(V, m, h, g)
    p = 1; A = .628E-3;
    E = -20;
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_H(V, m)
    tau_m = 2 / ( exp((V + 169.7)/-11.6) + exp((V-26.7)/14.3 ) );
    m_inf = sig((V + 75)/5.5);
    dmdt = (m_inf - m) / tau_m;
end

% leak current I_leak

function I = I_leak(V, m, h, g)
    p = 0; % TODO: what is p for I_leak?...
    A = .628E-3;
    %g = 000000000; % maximal conductance, need to search up
    E = -50;
    I = g * m^p * h * (V - E) * A; % does I_leak even have this functional form?
end

% synaptic current

function dsdt = ds_glutameric(s, V_pre)
    k_ = 1/40 * 1E-3; % s
    Vth = -35;
    delta = 5;
    sbar = sig((Vth - V_pre)/delta);
    tau_s = (1 - sbar) / k_;
    dsdt = (sbar - s)/tau_s;
end

function dsdt = ds_cholinergic(s, V_pre)
    k_ = 1/100 * 1E-3; % s
    Vth = -35;
    delta = 5;
    sbar = sig((Vth - V_pre)/delta);
    tau_s = (1 - sbar) / k_;
    dsdt = (sbar - s)/tau_s;
end

function I = I_s_glu(V_post, g_s, s)
    Es = -70;
    I = g_s * s * (V_post - Es);
end

function I = I_s_cho(V_post, g_s, s)
    Es = -80;
    I = g_s * s * (V_post - Es);
end

function dvdt = dV(currents_sum, synapse_current)
    % V is in units of mV
    C = .628; % membrane capacitance, nF
    I = -currents_sum - synapse_current; % uA
    dvdt_raw_units = I/C; % uA / nF = kV / s
    dvdt = dvdt_raw_units * 1E-6; % mV / s 
end
