clear all;close all;
U={'a','b','c','d','e','f'};
G=[
0 0 0 1 0 1,
1 0 0 0 0 0,
0 1 0 0 0 0,
0 1 1 0 0 0,
0 0 1 0 0 0,
1 0 1 0 0 0
];
p=0;
x=pagerank(U,G,p);
for p=0.1:0.1:0.9
    x=[x pagerank(U,G,p)];
end
p=0.99999;
x=[x pagerank(U,G,p)];  
x=x';  
bar(x);
xlabel('Random transition probability');
ylabel('Page ranks');
title('Page ranks vs. random transition probability');
set(gca, 'xticklabel', 0:10);


