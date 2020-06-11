%a = lim inferior 
%b = lim superior
%n = # de segmentos
%f = funcion
function [area] = Trapezoidal(a, b, n, f) 
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
    
    for i = 2:n
        area = area + 2 * y(i);
    end
    
    area = area * h / 2;
end