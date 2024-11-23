close all;clear all;clc
s=tf('s');
Vin=6;
L=10*1e-6;
C=22*1e-6;
RL=0.068;
Rload=1;
Rc=0.02;
wo=1/((L*C)^0.5);
wz=1/(Rc*C);
Q=(1/wo)*(1/(L/(Rload+RL)+C*(Rc+RL*Rload/(RL+Rload))));
Gvd=Vin*(1+s/wz)/(1+s/(Q*wo)+(s/wo)^2);
Td=495e-9;
Gvd_z=Gvd*(1-Td*s+((-Td*s)^2)/2+((-Td*s)^3)/6);
Gvd_z=Gvd*exp(-s*Td);
Hsense=1;
VM=3;
T=Hsense*(1/VM)*Gvd;
bode(T,{1,1e8});
hold on;
s = tf('s');
z1 = 2*pi*4.9*1e3;
z2 = 2*pi*11.039*1e3;
p1 = 2*pi*226.47*1e3;
p2 = 2*pi*361.715*1e3;
K=2.34;
comp=K*(1 + z1/s) * (1 + s/z2) / ((1 + s/p1) * (1 + s/p2));
bode(comp, {1,1e8}); %bode(tf, {frequency range})
hold on;
closeloop = comp*T;
bode(closeloop,{1,1e8});
grid on;