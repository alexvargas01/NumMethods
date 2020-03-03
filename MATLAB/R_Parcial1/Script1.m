
%%Pmasa = randi([50 100],1,10);
Pmasa = 50+rand(1,10)*(100-50);
Paccel= -5 + rand(1,10)*(5-(-5));
rtaFunction=Repaso1(Pmasa,Paccel);
rtaManual=Pmasa.*Paccel;

if all(rtaFunction == rtaManual)
    fprintf("It works");
else
    fprintf("nelson");
end
