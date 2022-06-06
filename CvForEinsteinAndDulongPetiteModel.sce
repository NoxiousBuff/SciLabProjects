// program to plot and compare specific heat of solid with temperature for
// Dulong Petit Law and Einstein Model for different Einstein temperature 
// values, Te=50,100,150

clc;clear;clf;
k = 1.38e-23; // Boltzmann Constant
N = 6e23; // Avogadro's Number
Te = input("Enter the einstein tempertaure in Kelvin : ");
T = 0 : 2*Te;
for i = 1:length(T)
    Cvdp = 3*N*k; // for specific heat of Dulong-Petite Law
    if T(i) == 0 then 
        Cve = 0;
    else
        x = (Te/T(i));
        Cve(i) = (3*N*k*(x^2)*exp(x))/((exp(x) - 1)^2);
    end
end
plot(T, Cvdp, 'r*');
plot(T, Cve, '+b');
legend('Dulong Petite law', 'Einstein Model', 4);
ylabel('Specific Heat', 'fontsize', 4);
xlabel('Temperature(K)', 'fontsize', 4);
