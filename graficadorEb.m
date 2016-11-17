function [k, P_s, P_b  ] = graficadorEb( s, M, Nbits, h_c, p, L, d_k, Rb )
%Funcion que simula paso por el canal y decision de una senal variando
%relacion senal ruido. Su salida se usa para obtener graficas de
%probabilidad de error.
i = 1;
inc = 0.05;
fm = L*Rb/log2(M);
for a = -10:inc:15
    EbNo = 10.^(a/10);
    r = canalEb(s,Rb,EbNo,fm);
    Nsimbolos=Nbits/log2(M);
    [Val,delay_canal]=find(h_c==max(h_c));
    delay=length(p)+delay_canal-1;
    [z_D,z_T,z]=receptor_8PAM(r,L,p,delay,Nsimbolos);
    errores = d_k-z_D;
    P_s(i) = mean(errores ~=0);%p error = 0.01
    P_b(i) = P_s(i)/log2(M);
    i = i+1;
end
k = -10:inc:15;

end

