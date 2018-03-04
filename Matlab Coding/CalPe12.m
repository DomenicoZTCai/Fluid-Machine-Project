rou=1.1;
omiga=4.78;
v=8;
a=1/3;
Rtip=11.45;Rprim=9.0375;Rhub=2.41;
R=[Rhub,Rprim,Rtip];
Ri=linspace(Rhub,Rtip,1000);
CL=[1.2671,1.2674,1.2503];
CD=[0.1412,0.1399,0.1348];
beta=pi/180.*[50.17,77.46,80.04];
CL_interp=interp1(R,CL,Ri,'pchip');
CD_interp=interp1(R,CD,Ri,'pchip');
beta_interp=interp1(R,beta,Ri,'pchip');
Pei=(0.5*rou*omiga*pi*(v^2)*8*a/(1-a))...
    .*((Ri.^2.*(CL_interp.*cos(beta_interp)-CD_interp.*sin(beta_interp)))...
    ./(CL_interp.*sin(beta_interp)+CD_interp.*cos(beta_interp)));
 Pe = trapz(Ri,Pei);
 Pd=0.5*rou*456.167*12^3;
 Cp=Pe/(Pd);
 Pe
 Cp
 
 