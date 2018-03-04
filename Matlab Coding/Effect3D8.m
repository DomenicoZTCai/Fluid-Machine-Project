c=[];
Nbl=3;v=5.33;w=[10.97,36.36,45.87];a=1/3;
r=[2.41,9.0375,11.45];beta=pi/180.*[60.94,81.57,83.33];
h=r(3)-r(1);h1=r(2)-r(1);h2=r(3)-r(2);
CL=[1.2671,1.2674,1.2503];CD=[0.0121,0.0107,0.0091];
i=1;
while i==1 || abs(CD(i)-CD(i-1))>1e-6
    ci=r./w.^2.*pi./Nbl.*v^2.*8.*a./((1-a).*(CL(i,:).*sin(beta)+CD(i,:).*cos(beta)));
    c=[c;ci];
    Sblade=(h1*ci(1)+h2*ci(3)+h*ci(2))/2;
    AR=h^2/Sblade;
    CLi=CL(1,:);
    CL=[CL;CLi];
    CDi=CD(1,:)+CLi.^2./(pi*AR);CD=[CD;CDi];
    i=i+1;
end
CL
CD