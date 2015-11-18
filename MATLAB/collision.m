close all
clear all
%自定邊界長度
boundary = 10;
axis image
axis ([0 boundary 0 boundary]);
hold on
%做小圓
t=linspace(0,2*pi);
x=cos(t);
y=sin(t);
%給定小圓開始的亂數位置
r=rand(1,6);
%避免小球重疊
while sqrt((6*(r(1)-r(2))^2+6*(r(4)-r(5))^2))<2 || sqrt((6*(r(2)-r(3))^2+6*(r(5)-r(6))^2))<2 || sqrt((6*(r(1)-r(3))^2+6*(r(4)-r(6))^2))<2
r(2)=rand;
r(3)=rand;
r(5)=rand;
r(6)=rand;
end
%決定小圓各點座標
cx1=x+1+.5*boundary*r(1);
cx2=x+1+.5*boundary*r(2);
cx3=x+1+.5*boundary*r(3);
cy1=y+1+.5*boundary*r(4);
cy2=y+1+.5*boundary*r(5);
cy3=y+1+.5*boundary*r(6);
%畫小圓
c1=plot(cx1,cy1,'r','erasemode','xor');
c2=plot(cx2,cy2,'g','erasemode','xor');
c3=plot(cx3,cy3,'b','erasemode','xor');
%小圓座標資料
x1=get(c1,'xdata');
x2=get(c2,'xdata');
x3=get(c3,'xdata');
y1=get(c1,'ydata');
y2=get(c2,'ydata');
y3=get(c3,'ydata');
%給定亂數初速度
q1=rand(1,2);
q2=rand(1,2);
q3=rand(1,2);
vx1=0.05*q1(1)/sqrt(q1(1)^2+q1(2)^2);
vx2=0.05*q2(1)/sqrt(q2(1)^2+q2(2)^2);
vx3=0.05*q3(1)/sqrt(q3(1)^2+q3(2)^2);
vy1=0.05*q1(2)/sqrt(q1(1)^2+q1(2)^2);
vy2=0.05*q2(2)/sqrt(q2(1)^2+q2(2)^2);
vy3=0.05*q3(2)/sqrt(q3(1)^2+q3(2)^2);
v1=[vx1 vy1];
v2=[vx2 vy2];
v3=[vx3 vy3];
%執行到4000
for i=1:4000
set(c1,'xdata',x1+v1(1));
set(c2,'xdata',x2+v2(1));
set(c3,'xdata',x3+v3(1));
set(c1,'ydata',y1+v1(2));
set(c2,'ydata',y2+v2(2));
set(c3,'ydata',y3+v3(2));
x1=get(c1,'xdata');
x2=get(c2,'xdata');
x3=get(c3,'xdata');
y1=get(c1,'ydata');
y2=get(c2,'ydata');
y3=get(c3,'ydata');
drawnow
%撞牆判定
if max(x1)>=boundary || min(x1)<=0
v1(1)=-v1(1);%反方向原速彈回
elseif max(x2)>=boundary || min(x2)<=0
v2(1)=-v2(1);%反方向原速彈回
elseif max(y1)>=boundary || min(y1)<=0
v1(2)=-v1(2);%反方向原速彈回
elseif max(y2)>=boundary || min(y2)<=0
v2(2)=-v2(2);%反方向原速彈回
elseif max(x3)>=boundary || min(x3)<=0
v3(1)=-v3(1);%反方向原速彈回
elseif max(y3)>=boundary || min(y3)<=0
v3(2)=-v3(2);%反方向原速彈回
%撞球判定
%紅、綠碰撞
elseif norm([x1(1)-x2(1) y1(1)-y2(1)])<=2
c1c2=[x1(1)-x2(1) y1(1)-y2(1)];
t=c1c2/norm(c1c2);
n=[-t(2) t(1)];
v1t=dot(v2,t)*t;
v1n=dot(v1,n)*n;
v2t=dot(v1,-t)*-t;
v2n=dot(v2,n)*n;
v1=v1t+v1n;
v2=v2t+v2n;
%綠、藍碰撞
elseif norm([x3(1)-x2(1) y3(1)-y2(1)])<=2
c2c3=[x2(1)-x3(1) y2(1)-y3(1)];
t=c2c3/norm(c2c3);
n=[-t(2) t(1)];
v2t=dot(v3,t)*t;
v2n=dot(v2,n)*n;
v3t=dot(v2,-t)*-t;
v3n=dot(v3,n)*n;
v2=v2t+v2n;
v3=v3t+v3n;
%紅、藍碰撞
elseif norm([x1(1)-x3(1) y1(1)-y3(1)])<=2
c1c3=[x1(1)-x3(1) y1(1)-y3(1)];
t=c1c3/norm(c1c3);
n=[-t(2) t(1)];
v1t=dot(v3,t)*t;
v1n=dot(v1,n)*n;
v3t=dot(v1,-t)*-t;
v3n=dot(v3,n)*n;
v1=v1t+v1n;
v3=v3t+v3n;
end
i=i+1;
end
