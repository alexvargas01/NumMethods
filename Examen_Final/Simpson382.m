%n = # de puntos
%h = altura de segmentos
%val = arreglo de valores
function [area] = Simpson382(n, h, val)
    area = val(1) + val(n);
    
    for i = 2:n - 1
        if mod(i - 1, 3) == 0
            area = area + 2 * val(i);
        else
            area = area + 3 * val(i);
        end
    end
    
    area = 3 * area * h / 8;
end