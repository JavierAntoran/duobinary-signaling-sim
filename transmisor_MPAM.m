function [s,d_k]=transmisor_MPAM(M,b,L,p)

% Funcion que genera la se�al de salida de un transmisor 8-PAM 
% 
% ARGUMENTOS DE ENTRADA
% b ........... secuencia de bits a transmitir
% L ........... muestras por s�mbolo
% p ........... pulso conformador
%
% ARGUMENTOS DE SALIDA
% s ........... se�al 8-PAM generada
% d_k ......... secuencia de s�mbolos a transmitir
% 

Nbits=length(b);
Nsimbolos=Nbits/log2(M);
amplitudes=(-M+1:2:M-1)';

simbolos=bin2dec(num2str(reshape(b,log2(M),Nsimbolos)'));

d_k=amplitudes(simbolos+1);

d=kron(d_k, [1;zeros(L-1,1)]);

s=conv(d,p);

