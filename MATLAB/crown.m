%x = linspace(-pi,pi); 
close all
theta = -pi:0.05:pi;
x = cos(theta);
y = sin(theta);
%z=abs(sin(x)./x).*exp(1*theta);
%z = 4*cos(4*theta).*exp(1*theta)+0.5;
z = 0.5+abs(sin(4*theta)./theta).*exp(-abs(theta/20));
%plot(x,y);
%z = abs(cos(n*theta)).*exp(-abs(theta/4));
stem3(x, y, z, 'fill');