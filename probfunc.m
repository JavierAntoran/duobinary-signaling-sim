function [ EbNo, P_b ] = probfunc()
%devulve grafica de probabilidad de error teorica M = 2 de senalizacion
%duobinaria.
EbNo = -5:0.1:10;
E = 10.^(EbNo/10);
P_s = (3/2)*qfunc((pi/4)*sqrt(2*E));

P_b = P_s;

plot(EbNo, P_s)
xlabel('Eb/No en db')
ylabel(' probabilidad de error')
legend('M = 2')
title('Relacion Ps a Eb/No pulso duobinario')
grid on

end

