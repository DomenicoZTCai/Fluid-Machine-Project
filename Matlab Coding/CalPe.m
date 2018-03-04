rou=1.1;omiga=3.98;
v=6.67;a=1/3;
Rtip=11.45;Rprim=9.0375;Rhub=2.41;R=[Rhub,Rprim,Rtip];
Ri=linspace(Rhub,Rtip,1000);
CL=[1.2671,1.2674,1.2503];
CD=[0.0121,0.0107,0.0091];
CD_3D=[0.0650    0.0636    0.0606];
beta=[55.2,79.5,81.67].*(pi/180);
CL_interp=interp1(R,CL,Ri,'pchip');
CD_interp=interp1(R,CD,Ri,'pchip');
CD_interp_3D=interp1(R,CD_3D,Ri,'pchip');
beta_interp=interp1(R,beta,Ri,'pchip');
Pei=(0.5*rou*omiga*pi*(v^2)*8*a/(1-a))...
    .*((Ri.^2.*(CL_interp.*cos(beta_interp)-...
    CD_interp.*sin(beta_interp)))...
    ./(CL_interp.*sin(beta_interp)+CD_interp.*cos(beta_interp)));
Pei_3D=(0.5*rou*omiga*pi*(v^2)*8*a/(1-a))...
    .*((Ri.^2.*(CL_interp.*cos(beta_interp)-...
    CD_interp_3D.*sin(beta_interp)))...
    ./(CL_interp.*sin(beta_interp)+CD_interp_3D.*cos(beta_interp)));
 Pe = trapz(Ri,Pei);
 Pe_3D = trapz(Ri,Pei_3D);
 Pd=0.5*rou*456.167*10^3;
 Cp=Pe/Pd;
 Cp_3D=Pe_3D/Pd;
 
 Pd
 Pe
 Cp
 Pe_3D
 Cp_3D
 