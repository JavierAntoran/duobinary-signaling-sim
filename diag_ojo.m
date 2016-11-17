function diag_ojo(z,sobremuestreo,Nsimbolos,centropulso,vec_simbs)
%
% diag_ojo(x,sobremuest,Nsimb,centropulso,vector_simbolos)
%
% FUNCIONALIDAD:
% Diagrama de ojo asociado a la señal x.
%
% ENTRADAS:
% x:           señal tipo PAM.
% sobremuest:  numero de muestras de la señal PAM que
%              componen un símbolo para la simulación en matlab.
% Nsimb:       total de símbolos que componen x.
% centropulso: posición central del pulso conformador.
% vec_simbos:  vector con los símbolos cuyas formas de onda 
%              asociadas se desea incluir en el diagrama de ojo.
%              Por ejempleo, [1 3 5] sólo incluiría 3 en
%              el diagrama de ojo los símbolos primero, tercero
%              y quinto.
%
% SALIDAS: 
% Diagrama de ojo.
%
% NOTAS DE UTILIZACION: 
% Se llama al comando figure internamente, 
% por lo que no es necesario llamarlo anteriormente (no
% se sobreescriben figuras). 
% Ejemplo típico de llamada a la función:
% diag_ojo(z,sobremuestreo,Nsimbolos,centropulso,...
%   round(linspace(1,Nsimbolos,300)));
% Emplea 300 símbolos escogidos de forma equiespaciada.

figure;
x=(1:sobremuestreo)-centropulso;
x=0.5*x/abs(x(1));
X=repmat(x',[1 length(vec_simbs)]);
Y=reshape(z,[sobremuestreo Nsimbolos]);
Y=Y(:,vec_simbs);
plot(X,Y,'k');
axis tight;
v=axis;
aux_y=0.05*(v(4)-v(3));
axis([v(1:2) aux_y*[-1 1]+v(3:4)])
grid on;
xlabel('Tiempo normalizado a tiempo de simbolo');
ylabel('Valores de señal');