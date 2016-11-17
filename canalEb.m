function y=canalEb(s,Rb,EbNo,fm)

% Funci�n que simula un canal que a�ade un ruido blanco aditivo y Gaussiano
% sobre la se�al de entrada, hasta obtener una relaci�n se�al a ruido por
% bit deseada
%
%
% y      se�al ruidosa
% s      se�al limpia que entra en el canal
% Rb     Tasa de bit
% EbNo   Relacion se�al a ruido por bit deseada
% fm     Frecuencia de Muestreo

Sr=var(s);           % Potencia de se�al recibida
No=(Sr/Rb)./EbNo;        % Densidad Espectral de potencia de ruido para 
                        % la EbNo deseada
sigma0=(fm.*No/2).^0.5;   % Potencia del ruido necesaria para la densidad
                        % espectral de potencia de ruido deseada
            
                        
n1=genruido(sigma0,length(s));% Generaci�n de ruido

n=reshape(n1,size(s));
y=s+n;

