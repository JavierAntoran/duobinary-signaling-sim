function [r,s_c,n] = canal(signal,canal_response,sigma_n)

% simulacion del paso por un canal AWGN con respuesta impulsional h_c
% 
% ARGUMENTOS DE ENTRADA
%
% signal   ............ se�al de entrada al canal
% canal_response ............ respuesta impulsional del canal
% sigma_n ........ desviaci�n t�pica de ruido en el canal
                           
s_c=conv(signal,canal_response);

%% Generaci�n ruido
n=sigma_n*randn(size(s_c));

r=s_c+n;

