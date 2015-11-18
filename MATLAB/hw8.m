clc; close all; clear all;
load circleData.txt
x=circleData(:,1);
y=circleData(:,2);

A = [x,y,ones(size(x))];
Y= x.^2 + y.^2;
theta=A\Y;

a = theta(1)/2;
b = theta(2)/2;
r = sqrt( a^2+b^2+theta(3));

t=linspace(0, 2*pi, 360);
p=a+r*cos(t);
k=b+r*sin(t);

Fixtheta = fminsearch(@errorMeasure,theta,[],circleData);

Fixa = Fixtheta(1)/2;
Fixb = Fixtheta(2)/2;
Fixr = sqrt( Fixa^2+Fixb^2+Fixtheta(3));

l = 0:0.001:2*pi;
FixX = Fixr*cos(l)+Fixa;
FixY = Fixr*sin(l)+Fixb;

plot(x, y, '.',p,k,'g', FixX,FixY,'r');
axis image

temp1=sqrt((x-a).^2+(y-b).^2)-r;
circlefitSquaredError1=sum(temp1.^2);
fprintf('circlefitSquaredError = %d\n', circlefitSquaredError1);

temp2=sqrt((x-Fixa).^2+(y-Fixb).^2)-r;
circlefitSquaredError2=sum(temp2.^2);
fprintf('squared error after fminsearch = %d\n', circlefitSquaredError2);
