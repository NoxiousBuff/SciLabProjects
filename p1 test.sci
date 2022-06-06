clc;clear;clf;
//defining constants
N = 6.022e23;
k = 1.38e-23;
nameOfSolid = input('Enter the name of the solid: ', 'string');
Te = input('Enter the einstein temperature of the ' + string(nameOfSolid) + " : " );
Td = input('Enter the debye temperature of the ' + string(nameOfSolid) + " : " );
T = 0:2*Td;

for i = 1:length(T)
    //define dulong petite law
    Cvdp = 3*N*k;
    
    //define einstein law
    if T(i) == 0 then
        Cve = 0;
    else 
        dr = T(i)/Td;
        r = Te/T(i);
        Cve(i) = (3*N*k)*(r^2)*(exp(r)/((exp(r)-1)^2));
        if T(i) > Td/50 then 
            I = integrate('((y^4)*exp(y))/((exp(y) - 1)^2)', 'y', 0, Td/T(i));
            Cvd(i) = 9*N*k*(dr^3)*I;
            
        else
            Cvd(i) = (((12*%pi^4)*N*k)/5)*(dr^3);
        end
    end
end
plot(T, Cvdp, 'r');
plot(T, Cve, 'g');
plot(T, Cvd, 'b');
legend('dulong petite law','einstein law', 'debye model' ,4);
xlabel('Temperature');
ylabel('Specific heat of ' + string(nameOfSolid));
title('Comparing specific heat of solids');
