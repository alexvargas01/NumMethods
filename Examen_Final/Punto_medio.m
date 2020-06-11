function [ans] = Punto_medio(x, y, h, n, f)
    for i = 1:n
        k1 = f(x, y);
        
        x2 = x + 1/2 * h;
        y2 = y + 1/2 * k1 * h;
        k2 = f(x2, y2);
        
        y3 = y + k2 * h
        
        x = x + h;
        y = y3;
    end
    ans = y3;
end