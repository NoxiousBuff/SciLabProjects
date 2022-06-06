// program to plot and compare specific heat of solid with temperature for 
// Dulong Petit Law, Einstein Model, and Debye Model for Te=240 and Td=343 
// for Copper

// clc;clear;clf;
k = 1.38e-23; // Boltzmann Constant
N = 6e23; // Avogadro's Number
Te = input("Enter the einstein tempertaure in Kelvin : ");
Td = input("Enter the debye tempertaure in Kelvin : ");
T = 0 : 2*Td;
for i = 1:length(T)
    Cvdp = 3*N*k; // for specific heat of Dulong-Petite Law
    if T(i) == 0 then 
        Cve = 0;
    else
        x = (Te/T(i));
        Cve(i) = (3*N*k*(x^2)*exp(x))/((exp(x) - 1)^2); // Einstein Model
        if T(i) > Td/50 then
        I = integrate('((y^4)*exp(y))/((exp(y)- 1)^2)', 'y', 0, Td/T(i));
        Cvd(i) = 9*N*k*I*((T(i)/Td)^3);//Debye Model
    else
        Cvd(i) = ((12*3.14^4)/5)*N*k*((T(i)/Td)^3); // Debye (Low Temp)
    end
    end
end
plot(T, Cvdp, 'r');
plot(T, Cve, 'b');
plot(T, Cvd, 'g');
legend('Dulong Petite law', 'Einstein Model','Debye Model', 4);
title('Copper '+ 'Te = '+string(Te) + 'K' + ' & Td = '+string(Td) + 'K');
ylabel('Specific Heat', 'fontsize', 4);
xlabel('Temperature(K)', 'fontsize', 4);
