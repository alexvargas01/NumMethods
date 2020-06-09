%a = lim inferior 
%b = lim superior
%n = # de segmentos
%f = funcion
function [area] = Simpson38(a, b, n, f)
    h = (b - a) / n;
    x = a;
    i = 1;
    y = [];
    
    while x <= b
        aux = f(x);
        y = [y, aux];
        i = i + 1;
        x = x + h;
    end
    
    area = y(1) + y(n + 1);
    
    for i = 2: n
        if mod(i - 1, 3) == 0
            area = area + 2 * y(i);
        else
            area = area + 3 * y(i);
        end
    end
    
    area =  3 * area * h / 8;
end