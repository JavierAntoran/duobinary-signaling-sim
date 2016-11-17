function [ z_D ] = decoderduobin( z_Di )
%obtiene muestras M arias a partir de secuencia duobinaria recibida
l = length(z_Di);
z_D = zeros(1, l);
z_D(1) = z_Di(1);
for r = 1:1:l-1
    z_D(r+1) = z_Di(r+1) - z_D(r);
end

end

