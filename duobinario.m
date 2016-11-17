function a=duobinario(Lduob, L)
%genera pulso duobinario T = L longitud = LDuob
T = L;
t = linspace((-Lduob)/2, (Lduob-1)/2, Lduob+1);
a = (sinc(t/T)+sinc((t-T)/T));
end