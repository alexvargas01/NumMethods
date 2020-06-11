function [] = OSRK4()
    fdy = @(x, y, z, w) z;
    fdz = @(x, y, z, w) w;
    fdw = @(x, y, z, w) (cos(x*y) - 12*y - 9*z - 6*w) / 3;
    x0 = 0;
    y0 = 3;
    z0 = -5;
    w0 = 2;
    h = 2*pi;
    i = 0;
    xf = 2*pi;
    x = x0:h:xf; n = length(x);
    y = [y0]; z = [z0]; w = [w0];
    T = table();
    for i=1:n-1
     k1 = fdy(x(i),y(i),z(i),w(i));
     l1 = fdz(x(i),y(i),z(i),w(i));
     m1 = fdw(x(i),y(i),z(i),w(i));
     k2 = fdy(x(i)+h/2,y(i)+k1/2*h,z(i)+l1/2*h,w(i)+m1/2*h);
     l2 = fdz(x(i)+h/2,y(i)+k1/2*h,z(i)+l1/2*h,w(i)+m1/2*h);
     m2 = fdw(x(i)+h/2,y(i)+k1/2*h,z(i)+l1/2*h,w(i)+m1/2*h);
     k3 = fdy(x(i)+h/2,y(i)+k2/2*h,z(i)+l2/2*h,w(i)+m2/2*h);
     l3 = fdz(x(i)+h/2,y(i)+k2/2*h,z(i)+l2/2*h,w(i)+m2/2*h);
     m3 = fdw(x(i)+h/2,y(i)+k2/2*h,z(i)+l2/2*h,w(i)+m2/2*h);
     k4 = fdy(x(i)+h,y(i)+k3*h,z(i)+l3*h,w(i)+m3*h);
     l4 = fdz(x(i)+h,y(i)+k3*h,z(i)+l3*h,w(i)+m3*h);
     m4 = fdw(x(i)+h,y(i)+k3*h,z(i)+l3*h,w(i)+m3*h);
     y(i+1) = y(i)+(1/6)*(k1+2*k2+2*k3+k4)*h;
     z(i+1) = z(i)+(1/6)*(l1+2*l2+2*l3+l4)*h;
     w(i+1) = w(i)+(1/6)*(m1+2*m2+2*m3+m4)*h;
     T = [T;table(i, k1, l1, m1, k2, l2, m2, k3, l3, m3, k4, l4, m4, x(i+1), y(i+1), z(i+1), w(i + 1))];
    end
    T
    plot(x,w);
end