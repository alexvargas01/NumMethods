function [] = OSRK42()
    fdy = @(x, y, z) cos(x)*sin(y)+z;
    fdz = @(x, y, z) x*y*z + 1;
    x0 = 0;
    y0 = 3;
    z0 = -6;
    h = 0.1;
    i = 0;
    xf = 2;
    x = x0:h:xf; n = length(x);
    y = [y0]; z = [z0];
    T = table();
    for i=1:n-1
     k1 = fdy(x(i),y(i),z(i));
     l1 = fdz(x(i),y(i),z(i));
     k2 = fdy(x(i)+h/2,y(i)+k1/2*h,z(i)+l1/2*h);
     l2 = fdz(x(i)+h/2,y(i)+k1/2*h,z(i)+l1/2*h);
     k3 = fdy(x(i)+h/2,y(i)+k2/2*h,z(i)+l2/2*h);
     l3 = fdz(x(i)+h/2,y(i)+k2/2*h,z(i)+l2/2*h);
     k4 = fdy(x(i)+h,y(i)+k3*h,z(i)+l3*h);
     l4 = fdz(x(i)+h,y(i)+k3*h,z(i)+l3*h);
     y(i+1) = y(i)+(1/6)*   (k1+2*k2+2*k3+k4)*h;
     z(i+1) = z(i)+(1/6)*(l1+2*l2+2*l3+l4)*h;
     T = [T;table(i, k1, l1, k2, l2, k3, l3, k4, l4, x(i+1), y(i+1), z(i+1))];
    end
    T
    plot(x,y);
end