Vt = 0.65e-3;
Icq = 0.6e-3;
Vceq = 7.9;
beta = 200;
gm = Icq/Vt;
rpi = beta/gm;

function [p] = parallel(r1,r2)
  p = (r1*r2)/(r1+r2);
end

R1 = 56e3;
R2 = 6.8e3;
R4 = 33e3;
R5 = 8.2e3;
R6 = 560e3;
R7 = 1e3;
R8 = 100;
R9 = 22e3;

Rc = parallel(R2, R9)

Zin = parallel(parallel(R1+R4, R6), rpi+R6+R6*rpi*gm)
GainFMedium = -gm*Rc
