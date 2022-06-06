clc ; clear; clf;
h = 6.626e-34;
kb = 1.38e-23;
c=3e8;
T = 500:100:1000; //Temperature range in kelvin
To = 1000; //Temperature for comparison of Planck with raleigh jeans/wein
Wu =  0.1:0.005:3; //Wavelength in um
W = Wu.*10^-6; //Wavelength in m
A = (8*3.14*h*c);
for j=1: length(T)
    for i = 1:length(W)
        up(j,i) = (A/W(i)^5)/(exp((h*c)/(kb*T(j)*W(i)))-1); //Planck's Law
        ur(j,i) = 8*3.14*kb*T(j)/(W(i)^4); //Raleigh jeans law
        uw(j,i) = (A/W(i)^5)*exp(-(h*c)/(kb*T(j)*W(i))); //Wein's dist. law
    end    
    if T(j) == To
        q = j;
    end
    [p,k] = max(up(j, :));
    Wmax(j) = Wu(k);
    U(j) = (0.005*10^-6)*sum(up(j, :)); //calculate area under Planck's Curve
end
//Plot planck law
subplot(2,2,1)
plot(Wu', up');
legend('T = ' + string(T) + ' K');
xlabel('$\lambda(\mu m)$');
ylabel('$u(\lambda)$');
title('Planck Radiation Law');

//Comparison of Planck's Law with Rayleigh-Jeans/Wein's dist. law
subplot(2,2,2)
plot(Wu', [up(q,:)' ur(q,:)' uw(q,:)']);
replot([0,0,20,200]);
legend('Planck law', 'Rayleigh-Jeans LAw', 'Wein dist. Law');
title('Temperature: '+string(T(q)) + 'K');
xlabel('$\lambda(\mu m)$');
ylabel('$u(\lambda)$');

//Plot Wein's law
subplot(2,2,3)
T1 = 1./T;
plot(T1, Wmax', '-o-');
title('Wein Law');
xlabel('$frac1T(K^{-1})$');
ylabel('$\lambda_{max} (\mu m)$');
[b,a] = reglin(T1, Wmax');
disp('The value of Wein constant is: '+string(b)+' um.K');

//Plot Stefan's Law
subplot(2,2,4)
T4 = T.^4; E = U.*(c/4);
plot(T4', E, '-o-');
title('Stefan Law');
xlabel('$\text T^4(K^4)$');
ylabel('$\E(W/m^2)$');
[sigma, d] = reglin(T4, E');
disp('The value of stefan constant is: '+string(sigma)+ 'W.m-2.K-4');
