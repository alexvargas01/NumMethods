function [ans] = Heun(x, y, h, n, f)
    for i = 1:n
        k1 = f(x, y);
        
        x2 = x + h;
        y2 = y + k1 * h;
        k2 = f(x2, y2);
        
        y3 = y + ((1/2 * k1) + (1/2 * k2)) * h
        
        x = x + h;
        y = y3;
    end
    ans = y3;
end