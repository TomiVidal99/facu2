Rf = 48e3
% Rf = 1e3

function [p] = parallel(r1, r2)
  p = (r1*r2)/(r1+r2);
end

y11 = 1/Rf;
y22 = y11;
beta = -1/Rf;
hfe = 250;
Zin = parallel(parallel(100e3, 39e3), 100*(1+hfe));
Zout = 560;
av = -560/100;
av2 = -parallel(560, 1e3)/100;

disp("Ganancia de lazo directo de una etapa: ");
Av = av*av*av2

disp("Ganancia de lazo directo de transadmitancia sin cargar: ");
azc = Av*Zin

disp("Ganancia de lazo directo de transadmitancia cargado: ");
Gzc = azc/((1+Zout*y22)*(1+Zin*y11))

disp("Ganancia de realimentación de transadmitancia");
Ar = Gzc/(1+beta*Gzc)
Ar_aprox = 1/beta

disp("Impedancia de entrada de realimentación");
Zir = parallel(1/y22, Zin)/(1+beta*Gzc)

disp("Ganancia de tensión del circuito completo (sin resistencias de fuente)");
Av_placa = Ar/Zir

disp("Ganancia de tensión del circuito completo");
paralelo_entrada = parallel(10, Zir);
Av_total = (Av_placa * paralelo_entrada)/(100 + paralelo_entrada)
