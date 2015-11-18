close all;
clear all;
X = imread('annie19980405.jpg');
image(X);
[m, n, p]=size(X);
Size=2;u=m/Size;v=n/Size;
A=zeros(12,1);
% index=reshape(1:m*n*p, m*n, 3)';
for j=0:319
    for i=0:239
        B=X(1+2*i:2+2*i,1+2*j:2+2*j,:);
        B = reshape(B,4,3)';
        A = [A B(:)];
    end
end
data=double(A(:,2:76801));
clear A;
clear B;
% data=double(X(index));%dim*dataNum
oriPic=m*n*p*8;
maxI=6;
for i=1:maxI
	centerNum=2^i;
    indArr=u*v*log2(centerNum) ;
    colMap=8*centerNum*p*Size^2;
    compRat=oriPic/(indArr+colMap);
	fprintf('i=%d/%d: no. of centers=%d\n', i, maxI, centerNum);
	center=kMeansClustering(data, centerNum);%dim*clusterNum
	distMat=distPairwise(center, data);
	[minValue, minIndex]=min(distMat);
    for block=1:centerNum
        A=center(:,block);
        A=reshape(A,3,4)';
        A=reshape(A,4,1,3);
        for j=1:3
            B{block}(1:2,1:2,j)=reshape(A(:,1,j),2,2);
        end
    end
    a=1;b=1;
    X2=zeros(480,640,3);
    for j=1:307200/2^2 
        k=minIndex(1,j);
        X2(a:a+2-1,b:b+2-1,1:3)=B{k};
        if a==(480-2+1)
            a=1;b=b+2;
        else    
            a=a+2;
        end
    end
 	X2=X2/255;
 	figure; 
    image(X2); 
%   colormap(map);
%   colorbar;
    axis image;
    title(['Code book size=',num2str(centerNum),', block=',num2str(Size),'x',num2str(Size),', compression ratio=',num2str(compRat)]);
    keyboard;
    clear X2;
end
