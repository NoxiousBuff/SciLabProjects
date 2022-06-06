clc;clear;clf;
h = 6.626e-34;
kb = 1.38e-23;
c=3e8;
T = 500:100:1000; //Temperature range in kelvin
To = 1000; //Temperature for comparison of Planck with raleigh jeans/wein
Wu =  0.1:0.005:30; //Wavelength in um
W = Wu.*10^-6; //Wavelength in m
A = (8*3.14*h*c);
for j=1: length(T)
    for i = 1:length(W)
        up(j,i) = (A/W(i)^5)/(exp((h*c)/(kb*T(j)*W(i)))-1); //PLanck's Law
        ur(j,i) = 8*3.14*kb*T(j)/(W(i)^4); //Raleigh jeans law
        uw(j,i) = (A/W(i)^5)*exp(-(h*c)/(kb*T(j)*W(i))); //Wein's dist. law
    end    
    if T(j) == To
        q = j;
    end
    [p,k] = max(up(j, :));
    Wmax(j) = Wu(k);
end
//Plot planck law
subplot(2,2,1)
plot(Wu', up', 'linewidth', 5);
legend('T = ' + string(T) + ' K');
xlabel('$\lambda(\mu m)$', 'fontsize', 6);
ylabel('$u(\lambda)$', 'fontsize', 6);
title('Planck Radiation Law', 'fontsize', 6);

//Comparison of Planck's Law with Rayleigh-Jeans/Wein's dist. law
subplot(2,2,2)
plot(Wu', [up(q,:)' ur(q,:)' uw(q,:)'], 'linewidth', 5);
replot([0,0,20,200]);
legend('Planck law', 'Rayleigh-Jeans LAw', 'Wein dist. Law');
title('Temperature: '+string(T(q)) + 'K', 'fontsize',6);
xlabel('$\lambda(\mu m)$', 'fontsize', 6);
ylabel('$u(\lambda)$', 'fontsize', 6);

//Plot Wein's law
subplot(2,2,3)
T1 = 1./T;
plot(T1, Wmax', '-o-', 'linewidth', 5);
title('Wein Law', 'fontsize', 6);
xlabel('$frac1T(K^{-1})$', 'fontsize', 6);
ylabel('$\lambda_{max} (\mu m)$', 'fontsize', 6);
[b,a] = reglin(T1, Wmax');
disp('The value of Wein constant is: '+string(b)+' um.K');
 














