close all;clear all;
X = imread('annie19980405.jpg');
image(X);
[m, n, p]=size(X);% 480 640 3
Size=8;  % Block size
u=m/Size;v=n/Size;
A=zeros(Size^2*3,1);
for j=0:(n/Size-1)
    for i=0:(m/Size-1)
        B=X(1+Size*i:Size+Size*i,1+Size*j:Size+Size*j,:);
        B = reshape(B,Size^2,3)';
        A = [A B(:)];
    end
end
data=double(A(:,2:(n*m/Size^2+1)));
clear A;clear B;
oriPic=m*n*p*8;
maxI=6;          % Code book size: 2^i
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
        A=reshape(A,3,Size^2)';
        A=reshape(A,Size^2,1,3);
        for j=1:3
            B{block}(1:Size,1:Size,j)=reshape(A(:,1,j),Size,Size);
        end
    end
    a=1;b=1;
    X2=zeros(m,n,p);
    for j=1:(m*n)/Size^2 
        k=minIndex(1,j);
        X2(a:a+Size-1,b:b+Size-1,1:3)=B{k};
        if a==(m-Size+1)
            a=1;b=b+Size;
        else    
            a=a+Size;
        end
    end
 	X2=X2/255;
 	figure; 
    image(X2); 
    axis image;
    title(['Code book size=',num2str(centerNum),', block=',num2str(Size),'x',num2str(Size),', compression ratio=',num2str(compRat)]);
    keyboard;
    clear X2;
end
