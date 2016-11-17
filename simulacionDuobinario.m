%% emision
clear all
M = 8; %codigo adaptado a funcionar con cualquier valor de M cambiando solo esta linea
Nbits = 30000;
Nsimbolos = Nbits/log2(M);
b = randint(Nbits,1);
b(1:log2(M)) = zeros(1, log2(M)); % fijamos primeros bits y se lo damos a conocer a receptor para sincronizar
Rb = 600*10.^3;
Rs = Rb/log2(M);
Ts = 1/Rs;
L = 20;
fm = L*Rs;

%
p = duobinario(17*L+1, L); % no normalizado
%pulso = fftshift(ifft(sqrt(abs(fft(duobinario(4*L, L)))))); %intento
%fallido de obtener filtro adaptado
%
%p = pulso/(sqrt(sum(pulso.^2)));

[s, d_k] = transmisor_MPAM(M,b,L,p);
% d_k son datos originales, no version duobinaria con 2M-1 simbolos.

%% canal de 100khz:
t = -200:200;
g = 6; %factor que regula el ancho de banda del canal
h_c = ((1/g)*sinc(t/g));
 freqz(h_c)

%% canal
h_c = 1;
%EbNo = 10.^(43/10);
%r = canalEb(s, Rb, EbNo , fm); %ruido en off %canal EB es la funcion
%utilizada para obtener as graficas de probabilidad de error.
[r,s_c,n] = canal(s,h_c,0);

[Val,delay_canal]=find(h_c==max(h_c));

delay = (length(p)/2) + delay_canal; % delay esta compensado porque solo convolucionamos 1 vez con P


[z_Di,z_T,z]=rMd(M,r,L,1,delay,Nsimbolos);
z_D = decoderduobin(z_Di);
errores = d_k-z_D';
P_s = mean(errores ~=0);
P_b = P_s/log2(M);
t = linspace(0,8,8*L);

%%
plot(t, z(delay:8*L+delay-1));
title('Codificacion duobinaria M = 8'); xlabel('muestras: tiempo(s)/T'); ylabel('amplitud (V)')
hold on, grid on;
stem((0:8),z_Di(1:9));
stem((0:8),z_D(1:9), 'g');
legend('z(t)', 'muestras cod. duobinaria', 'muestras cod 8-aria')
%%
S = fftshift(fft(xcorr(s)));
R = fftshift(fft(xcorr(r)));
Z = fftshift(fft(xcorr(z)));
Fs = L*Rs;
f = linspace(-Fs/2, Fs/2, length(S));
%subplot(3,1,1)
plot(f, log10(abs(S)))
xlim([-400000, 400000])
title('DEP de z(t) M = 8'); xlabel('Frecuencia (Hz), Fb = 600k'); ylabel('dB');
grid on

%%
fsimbolos=Rs/log2(M);
Fs=L*fsimbolos;
tsimbolo= 1/ fsimbolos;

%h = conv(conv(h_c, p), p);
h = p;
tnorm = linspace(-2*length(h)/2/Fs/tsimbolo, 2*length(h)/2/Fs/tsimbolo, 2*length(h));

%subplot(2,1,1)
%plot(tnorm, h)
%axis tight, xlim([-6,6]), title('h(t)'), grid on, xlabel('tiempo/Ts')
H = fftshift(fft(h));
fh = linspace(-Fs/2,Fs/2,2*length(H));
%subplot(2,1,2)
%plot(fh, 10*log10(abs(H)))
%axis tight, title('H(f)'), xlabel('frecuencia (Hz)'), xlim([-Fs/4,Fs/4])
%%
hm = h(delay:L:end);
Dp = 2*sum(abs(hm(2:end)))/abs(hm(1));
run diagrama_ojo.m
title('M = 8')
