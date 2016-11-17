function [z_D,z_T,z]=rMp(M,r,L,p,delay,Nsimbolos)

% REceptor coseno realzado y pulso rectangular cualquier M
% 
% ARGUMENTOS DE ENTRADA
% r ........... señal de entrada al receptor
% L ........... muestras por símbolo
% p ........... pulso conformador
% delay ....... retardo que indica la posición de la primera muestra util a
%               la salida del filtro receptor
% Nsimbolos ... número de símbolos de la transmisión
% ARGUMENTOS DE SALIDA
% Z_D ......... muestras a la salida del decisor
% z_T ......... muestras a la entrada del decisor
% z ........... señal de salida del filtro receptor
% 

a = [-M+1:2:M-1];
th=(a(2:end)+a(1:end-1))/2;

%

%

h_r=flipud(p);
%h_r = 1;%delay esta compensado
z=conv(r,h_r);

z_T=z(delay:L:delay+(Nsimbolos-1)*L);


z_D=decision(M,a,th,z_T);
z_D(1) = -M+1;% primer simbolo conocido