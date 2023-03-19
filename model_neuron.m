% eventually write main driver code up here
sig(4)

%% Current functions
function sig = sig(x)
    sig = 1/ (1 + exp(x));
end

% sodium 

function I = I_na(V, m ,h)
    p = 3; A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
    Ei = 50; % reversal potential
    I = g * m^p * h * (V - Ei) * A;
end

function dmdt = dm_I_na(V, m)
    tau_m = 2.64 - 2.52 * sig((V + 120)/-25);
    m_inf = sig((V + 25.5)/-5.29);
    dmdt = (m_inf - m) / tau_m;
end

function dhdt = dh_I_na(V, h)
    tau_h = 1.34 * sig((V + 62.9)/-10) * (1.5 + sig((V+34.9)/3.6));
    h_inf = sig((V + 48.9)/5.18);
    dmdt = (h_inf - h)/tau_h;
end

% calcium transient

function I = I_CaT(V, m ,h, Ca_conc)
    p = 3; A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
    % reversal potential must be calculated from nernst potential
    %E = RT/(zF) * log( [out]/[in] )
    E = 27/2 * log(3/ Ca_conc);
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
    dmdt = (h_inf - h)/tau_h;
end

function I = I_CaS(V, m, h, Ca_conc)
    p = 3; A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
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
    dmdt = (h_inf - h)/tau_h;
end

% transient K+ current

function I = I_A(V, m, h)
    p = 3; A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
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
    dmdt = (h_inf - h)/tau_h;
end

% calcium dependent potassium current

function I = I_KCa(V, m, h)
    p = 4; A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
    E = -80;
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_KCa(V, m, Ca_conc)
    tau_m = 180.6 - 150.2 * sig((V+46/-22.7));
    m_inf = Ca_conc/ (Ca_conc + 3) * sig((V + 28.3)/-12.6);
    dmdt = (m_inf - m) / tau_m;
end

% delayed rectifier K+ current I_Kd

function I = I_Kd(V, m, h)
    p = 4; A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
    E = -80;
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_Kd(V, m)
    tau_m = 14.4 - 12.8 * sig((V + 28.3)/-19.2);
    m_inf = sig((V+12.3)/-11.8);
    dmdt = (m_inf - m) / tau_m;
end

% hyperpolarization-activated inward current I_H

function I = I_H(V, m, h)
    p = 1; A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
    E = -20;
    I = g * m^p * h * (V - E) * A;
end

function dmdt = dm_I_H(V, m)
    tau_m = 2 / ( exp((V + 169.7)/-11.6) + exp((V-26.7)/14.3 ) );
    m_inf = sig((V + 75)/5.5);
    dmdt = (m_inf - m) / tau_m;
end

% leak current I_leak

function I = I_leak(V, m, h)
    p = 0; % TODO: what is p for I_leak?...
    A = .628E-3;
    g = 000000000; % maximal conductance, need to search up
    E = -50;
    I = g * m^p * h * (V - E) * A; % does I_leak even have this functional form?
end
