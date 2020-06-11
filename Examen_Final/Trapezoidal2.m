%n = # de puntos
        
%val = arreglo de valores
function [area] = Trapezoidal2(n, h, val)
    
    area = val(1) + val(n);
    
    for i = 2:n - 1
        area = area + 2 * val(i);
    end
    
    area = area * h / 2;
end