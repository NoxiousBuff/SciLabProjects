clc;clear;clf;

h = 6.626e-34;
c = 3e8;
kb = 1.38e-23;
T = 500:100:1000;
To = 1000;
wu = 0.1:0.005:30;
w = wu*10^-6;
A = (8*%pi*h*c);
q=2;
for i = 1:length(T)
    for j = 1:length(w)
        urj(i,j) = 8*%pi*kb*T(i)/w(j)^4;
        uwd(i,j) = (A/(w(j)^5))*exp(-(h*c)/(w(j)*kb*T(i)));
        upl(i,j) = (A/(w(j)^5))/(exp((h*c)/(w(j)*kb*T(i)))-1);
    end
    if T(i) == To 
        same = i;
    end
    [p,q] = max(upl(i,:));
    Wmax(i) = w(q);
    U(i) = (0.005*10^-6)*sum(upl(i,:));
end
subplot(2,2,1);
plot(w, upl);

subplot(2,2,2);
plot(wu,upl(same,:));
plot(wu,urj(same,:));
plot(wu,uwd(same,:));//
replot([0,0,20,200]);
subplot(2,2,3);
T1 = 1./T;
plot(T1, Wmax, '-o-');
subplot(2,2,4);
E = U*(c/4);
T4 = T^4;
plot(T4, E);

