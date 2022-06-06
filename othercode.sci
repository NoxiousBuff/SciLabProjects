// program to plot and compare specific heat of solid with temperature for 
// Dulong Petit Law and Debye Model for different Debye temperature values,
// Td=105,225,428 for Pb, Ag, and Al respectively

// clc;clear;clf;
k = 1.38e-23; // Boltzmann Constant
N = 6e23; // Avogadro's Number
nameOfSolid = input("Enter the name of the solid : ", "string");
Td = input("Enter the debye tempertaure in Kelvin : ");
T = 0 : 2*Td;
for i = 1:length(T)
    Cvdp = 3*N*k; // for specific heat of Dulong-Petite Law
    if T(i) == 0 then 
        Cvd = 0;
    else
        if T(i) > Td/50 then
        I = integrate('((y^4)*exp(y))/((exp(y)- 1)^2)', 'y', 0, Td/T(i));
        Cvd(i) = 9*N*k*I*((T(i)/Td)^3);//Debye Model
    else
        Cvd(i) = ((12*3.14^4)/5)*N*k*((T(i)/Td)^3); // Debye (Low Temp)
    end
    end
end
plot(T, Cvdp, 'r');
plot(T, Cvd, 'b');
legend('Dulong Petite law', 'Debye Model', 4);
title(string(nameOfSolid)+ ' Td = '+string(Td) + 'K');
ylabel('Specific Heat', 'fontsize', 4);
xlabel('Temperature(K)', 'fontsize', 4);
