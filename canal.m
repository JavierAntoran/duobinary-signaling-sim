function [r,s_c,n] = canal(signal,canal_response,sigma_n)

% simulacion del paso por un canal AWGN con respuesta impulsional h_c
% 
% ARGUMENTOS DE ENTRADA
%
% signal   ............ señal de entrada al canal
% canal_response ............ respuesta impulsional del canal
% sigma_n ........ desviación típica de ruido en el canal
                           
s_c=conv(signal,canal_response);

%% Generación ruido
n=sigma_n*randn(size(s_c));

r=s_c+n;

