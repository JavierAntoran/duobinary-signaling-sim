function z_D = decision(M,a,th,z_T)

%z_D = decision(M,a,th,z_T)
%
% ENTRADAS:
% M: número de niveles de la señalización
% a: alfabeto de amplitudes
% th: umbrales de decisión
% z_T: salida del filtro receptor tras el muestreo
%
% FUNCIONALIDAD:
% Toma de decisiones. Establece una correspondencia entre los valores de z_T
% y los valores de a (la correspondencia consiste en decidir cuál es el 
% elemento de a más cercano a cada muestra de z_T.
%
% SALIDA: 
% z_D: vector de símbolos dedicidos



z_D=Inf(length(z_T),1); % Reserva de espacio

z_D(z_T<=th(1))=a(1);   % Valores inferiores al primer umbral
for i=2:length(th),            % Valores entre umbrales intermedios
    z_D((z_T<=th(i))&(z_T>th(i-1)))=a(i);
end;
z_D(z_T>th(end))=a(end); % Valores superiores al último umbral
