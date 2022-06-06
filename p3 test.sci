clc;clear;clf;

//define constants
N = 6.022e23;
K = 1.38e-23;
v = 0:5000;
T = 50:50:900;
n = input('No of gas to betakemn into the system : ');
for i = 1:n
    nog = input('Enter the name of the'' : ', 'string');
    M = input("Enter the molar mass of gas (in grams) : ");
    m = M/(N*1000);
    //using maxwell speed distribution function
    for j = 1:length(T)
        a = m/(2*K*T(j));
        //f(j) = 4*%pi*((a/%pi)^1.5)*(v^2)*exp(-a*v);
        for k = 1:length(v)
            f(k,j) = 4*%pi*((a/%pi)^1.5)*(v(k)^2)*exp(-a*(v(k)^2));
        end
    end
    subplot(n,1,i);
    plot(v, f);
    [p,q] = max(f(j,:));
    vmp = v(q);
    vav = sqrt(4*%pi)*vmp;
    vrms = sqrt(1.5)*vmp;
    legend('For Temp ' + string(T(i)));
    xlabel('Velocity of particle');
    ylabel('Fraction of particle having v velocity');
    title('Maxwell speed distribution for ' + string(nog))
end
