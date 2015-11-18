function plotRank(url)
[U,G] = surfer(url,500);
for p=0:1:0.1
    x=pagerank(U,G,p);
end