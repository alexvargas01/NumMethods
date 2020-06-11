function [ans] = RK3(x, y, h, n, f)
    for i = 1:n
        k1 = f(x, y);
        
        x2 = x + 1/2 * h;
        y2 = y + 1/2 * k1 * h;
        k2 = f(x2, y2);
        
        x3 = x + h;
        y3 = y - (k1 * h) + (2 * k2 * h);
        k3 = f(x3, y3);
        
        y4 = y + 1/6 * (k1 + (4 * k2) + k3) * h;
        
        x = x + h;
        y = y4;
    end
    
    ans = y3;
end