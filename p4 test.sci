clc;clear;clf;
e = 1.6e-19;
E = -0.5:0.001:0.5;
u = 0;
kb = 1.38e-23;
T = 300:300:900;
a = -1;
To = 600;
dist = ['MB', 'BE', 'FD'];
for i = 1:3
    //defining general equation of gas dist.
    for j = 1: length(T)
        if T(j) == To
            q = j;
        end
        for k = 1:length(E)
            f(j,k)=1/(exp(((E(k)-u)*e)/(kb*T(j)))+a);
        end
    end
    a = a + 1;
    subplot(2,2,i);
    plot(E, f);
    xlabel('Energy(eV)');
    ylabel('f(E)');
    legend('For temp' +  string(T) + ' K', 4);
    title(string(dist(i) + 'for the distribution u = ' + string(u)));
    C(i,:) = f(q,:); 
end
subplot(2,2,4);
plot(E,C);
title('Comparison of distribution at T = 600K');
xlabel('Energy(eV)');
ylabel("f(E)");
legend(string(dist), 4);
