clc;
clear;
clf;
k=1.38e-23;
N=6e23;
pi=3.14;
v=0:1:2000;
T=300:300:900;
n=input("enter the number of gases to be consider = ");
for r=1:n
name(r)=input("enter the name of gas = ","string");
M=input("enter the molar mass(g/mol)of "+string(name(r))+":");
m=M/(N*1000);
disp('Temp(K)   vmp   vav   vrms')
for j=1:length(T)
    a=m/(2*k*T(j));
    for i=1:length(v)
        f(j,i)=(4*pi)*(a/pi)^1.5*(v(i)^2)*exp(-a*(v(i)^2));
    end
    [p,q]=max(f(j,:));
    vmp=v(q);
    vav=sqrt(4/pi)*vmp;
    vrms=sqrt(3/2)*vmp;
    disp([T(j)     vmp   vav   vrms])
end
subplot(n,1,r)
plot(v',f');
xlabel('v(m/s)');
ylabel('f (v)');
legend('T='+string(T)+'K');
title('Maxwell  speed distribution function for '+string(name(r)),'fontsize',3);
end
