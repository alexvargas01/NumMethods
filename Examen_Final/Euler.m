function [ans] = Euler(x, y, h, n, f)
    for i = 1:n
        y2 = f(x, y);
        
        y3 = y + y2 * h
        
        x = x + h;
        y = y3;
    end
    ans = y3;
end