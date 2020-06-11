function [ans] = Ralston(x, y, h, n, f)
    for i = 1:n
        k1 = f(x, y);
        
        x2 = x + 3/4 * h;
        y2 = y + 3/4 * k1 * h;
        k2 = f(x2, y2);
        
        y3 = y + ((1/3 * k1) + (2/3 * k2)) * h
        
        x = x + h;
        y = y3;
    end
    ans = y3;
end