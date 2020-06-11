function [] = OSEuler2()
    fdy = @(x, y, z) cos(x)*sin(y)+z;
    fdz = @(x, y, z) x*y*z + 1;
    x = 0;
    h = 0.1;
    y = 3;
    z = -6;
    i = 0;
    xf = 2;
    TN = table(i, x, y, z);
    while x < xf
     ty = y + fdy(x, y, z)*h;
     tz = z + fdz(x, y, z)*h;
     i;
     x = x + h;
     y = ty;
     z = tz;
     i = i + 1;
     TN = [TN;table(i, x, y, z)];
    end
    TN
    plot(TN.x, TN.y);
end