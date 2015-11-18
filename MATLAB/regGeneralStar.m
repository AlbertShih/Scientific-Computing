function regGeneralStar(n, k)

% == 畫圓
x = linspace(0,2*pi);
A = sin(x)';
B = cos(x)';
plot(A, B,'r-');
axis equal; % 使x, y軸比例相等
hold on;

% == 星型
for kk = k:k:(n*k)
    p1 = exp(1i*2*pi*(kk-k)/n);
    p2 = exp(1i*2*pi*(kk)/n);
    x = [real(p1); real(p2)];
    y = [imag(p1); imag(p2)];
    plot(x,y,'o-');
    hold on;
end
hold off;