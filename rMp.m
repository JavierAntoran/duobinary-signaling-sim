function [z_D,z_T,z]=rMp(M,r,L,p,delay,Nsimbolos)

% REceptor coseno realzado y pulso rectangular cualquier M
% 
% ARGUMENTOS DE ENTRADA
% r ........... se�al de entrada al receptor
% L ........... muestras por s�mbolo
% p ........... pulso conformador
% delay ....... retardo que indica la posici�n de la primera muestra util a
%               la salida del filtro receptor
% Nsimbolos ... n�mero de s�mbolos de la transmisi�n
% ARGUMENTOS DE SALIDA
% Z_D ......... muestras a la salida del decisor
% z_T ......... muestras a la entrada del decisor
% z ........... se�al de salida del filtro receptor
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