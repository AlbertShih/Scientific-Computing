close all;clear all;clc;
load dataset4lineFit.txt
x = dataset4lineFit(:,1);
y = dataset4lineFit(:,2);
% LS
A = [ones(size(x)) x];
p=polyfit(x,y,1);
x_ls=1.4:0.01:10.16;
y_ls=polyval(p,x_ls);
% TLS 
[err, p]=tls(x,y);
% Return parameters:
% Err: error - sum of orthogonal distances 
% P: vector of model parameters [b-slope, a-offset] 
x_tls=1.4:0.01:10.16;
y_tls=p(1)*x_tls+p(2);
% plot
plot(x,y,'ro');
hold on
plot(x_ls,y_ls, 'b');
plot(x_tls, y_tls, 'g');
xlabel('X');
ylabel('Y');
legend('Sample dataset','Least-square fit','Total least-square fit', 'location','southeast');