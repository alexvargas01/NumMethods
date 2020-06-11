function [ans] = RK4(x, y, h, n, f)
    for i = 1:n
        k1 = f(x, y);
        
        x2 = x + 1/2 * h;
        y2 = y + 1/2 * k1 * h;
        k2 = f(x2, y2);
        
        x3 = x + 1/2 * h;
        y3 = y + 1/2 * k2 * h;
        k3 = f(x3, y3);
        
        x4 = x + h; 
        y4 = y + k3 * h;
        k4 = f(x4, y4);
        
        y5 = y + 1/6 * (k1 + (2 * k2) + (2 * k3) + k4) * h;
        
        x = x + h;
        y = y5;
    end
    
    ans = y5;
end