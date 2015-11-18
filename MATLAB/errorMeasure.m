function squaredError = errorMeasure(theta, data)
x = data(:,1);
y = data(:,2);

a = theta(1)/2;
b = theta(2)/2;
r = sqrt( a^2+b^2+theta(3) );

Z = x.^2+y.^2;
Z2 = 2*a*x+2*b*y+r^2-a^2-b^2;
squaredError = sum((Z-Z2).^2);