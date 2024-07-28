%% Datos
beta = 200;
fT = 270e6;
Cmu = 2e-12;
Cpi = 1/(2*pi*fT) - Cmu;
Vbe=0.7;
Vt = 25e-3;

%% Topología 1, análisis DC
Icq=beta*(12-Vbe)/( (22e3*1e3)/(22e3+1e3) + 20e3*(beta+1) )
gm = Icq/Vt
rpi = beta/gm

%% Topología 1, análisis f medias (Ad, Add, Acm)
Acm = -gm*10e3*2/( (23)*(20e3/rpi + 20e3*gm + 1) )
Add =  -gm*10e3/( 22 + 22e3/rpi + 1 )
CMRR = abs(Add/Acm)