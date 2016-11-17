function y=canalEb(s,Rb,EbNo,fm)

% Función que simula un canal que añade un ruido blanco aditivo y Gaussiano
% sobre la señal de entrada, hasta obtener una relación señal a ruido por
% bit deseada
%
%
% y      señal ruidosa
% s      señal limpia que entra en el canal
% Rb     Tasa de bit
% EbNo   Relacion señal a ruido por bit deseada
% fm     Frecuencia de Muestreo

Sr=var(s);           % Potencia de señal recibida
No=(Sr/Rb)./EbNo;        % Densidad Espectral de potencia de ruido para 
                        % la EbNo deseada
sigma0=(fm.*No/2).^0.5;   % Potencia del ruido necesaria para la densidad
                        % espectral de potencia de ruido deseada
            
                        
n1=genruido(sigma0,length(s));% Generación de ruido

n=reshape(n1,size(s));
y=s+n;

