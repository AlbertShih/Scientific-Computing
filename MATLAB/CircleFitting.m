clear all;close all;
load circleData.txt
x=circleData(:,1);
y=circleData(:,2);
plot(x, y, '.');
axis image
%轉換
A=[x, y];
A(:,3)=1;
Y=[x.^2 + y.^2];
theta=A\Y;
a=theta(1,1)/2;
b=theta(2,1)/2;
r=sqrt(((theta(1,1)^2+theta(2,1)^2)/4)+theta(3,1)); 
%畫圓
t=linspace(0, 2*pi, 360);
p=a+r*cos(t);
k=b+r*sin(t);
hold on;
plot(p,k);


n=length(x);
temp=sqrt((x-a).^2+(y-b).^2)-r;
circlefitSquaredError=sum(temp.^2);
fprintf('circlefitSquaredError = %d\n', circlefitSquaredError);
rmse=sqrt(circlefitSquaredError/n);

theta0 = [0 0 0 0];
tic
theta = fminsearch(@errorMeasure1, theta0, [], circleData);
fprintf('計算時間 = %g\n', toc);
y2 = theta(1)*exp(theta(3)*x)+theta(2)*exp(theta(4)*x);  
plot(x, y, 'ro', x, y2, 'b-');  
legend('Sample data', 'Regression curve');
fprintf('誤差平方和 = %d\n', sum((y-y2).^2));
