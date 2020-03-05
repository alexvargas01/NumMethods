function [xr] = bisec(f, xl, xu, numIt, display)
    if f(xl) * f(xu) > 0
        disp 'El rango proporcionado no es válido!'
        return
    end

    xr = 0;
    xro = 0;
    VarNames = {'iteration', 'xl', 'xu', 'xr', 'fxl', 'fxr','fxu', 'fx', 'Ea'};
    Data = [];
    dataRow = [];
    for i = 0:numIt
        xro = xr;
        xr = (xl + xu) / 2;
        fxl = f(xl);
        fxr = f(xr);
        fxu = f(xu);
        fx = fxl * fxr;
        ea = (xr-xro) / xr;
        dataRow = [i, xl, xu, xr, fxl, fxr,fxu, fx, abs(ea*100)];
        Data = [Data;dataRow];
        p1 = ['xr = (', num2str(xl), ' + ', num2str(xu), ')/', num2str(2), ' = ', num2str(xr)];
        p2 = ['ea = (', num2str(xr), ' - ', num2str(xro), ')/', num2str(xr), ' = ', num2str(abs(ea)*100)];
        p3 = ['fx = ', num2str(fxl), ' x ', num2str(fxr), ' = ', num2str(fx)];
        disp(['i = ', num2str(i)]);
        disp(p1);
        disp(p2);
        disp(p3);
        disp('---------------------------------------');
        if fx < 0
           xu = xr;
        elseif fx > 0
            xl = xr;
        else
            T = table(Data(:,1),Data(:,2),Data(:,3),Data(:,4),Data(:,5),Data(:,6),Data(:,7),Data(:,8),Data(:,9), 'VariableNames',VarNames)
            return
        end
    end
    
    T = table(Data(:,1),Data(:,2),Data(:,3),Data(:,4),Data(:,5),Data(:,6),Data(:,7),Data(:,8),Data(:,9), 'VariableNames',VarNames)
end