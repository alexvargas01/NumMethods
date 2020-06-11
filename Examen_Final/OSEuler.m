function [] = OSEuler()
    fdy = @(x, y, z, w) z;
    fdz = @(x, y, z, w) w;
    fdw = @(x, y, z, w) -10*y + 2*sin(x) - 8*z - 6*w;
    x = 2;
    h = 0.2;
    y = 3;
    z = -5;
    w = -10;
    i = 0;
    xf = 4;
    TN = table(i, x, y, z, w);
    while x < xf
     ty = y + fdy(x, y, z, w)*h;
     tz = z + fdz(x, y, z, w)*h;
     tw = w + fdw(x, y, z, w)*h;
     i;
     x = x + h;
     y = ty;
     z = tz;
     w = tw;
     i = i + 1;
     TN = [TN;table(i, x, y, z, w)];
    end
    TN
    plot(TN.x, TN.w);
end