function [SBladeToC,hMaxToC]=SBlade(shape)
xup=shape(1:33,1);xup=flipud(xup);
yup=shape(1:33,2);yup=flipud(yup);
xdown=shape(34:66,1);
ydown=shape(34:66,2);
Sup=trapz(xup,yup);
Sdown=trapz(xdown,ydown);
SBladeToC=Sup-Sdown;
hMaxToC=max(yup)-min(ydown);
end
