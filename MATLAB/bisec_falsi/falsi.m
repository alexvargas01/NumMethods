function [xr] = falsi(f, xl, xu, numIt, display)
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
        fxl = f(xl);
        fxu = f(xu);
        xr = xu-(((fxu)*(xl-xu))/(fxl-fxu));
        fxr = f(xr);
        fx = fxl * fxr;
        ea = (xr-xro) / xr;
        dataRow = [i, xl, xu, xr, fxl, fxr,fxu, fx, abs(ea*100)];
        Data = [Data;dataRow];
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