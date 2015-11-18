clear all;
[word, pa]=textread('english.wpa', '%s\t%s');
n=size(pa);
for i=1:n;
    tokenList{i,1}=split(pa{i}, '#', 0);
end
for i=1:n;
    wpa(i,1).word=word{i,1};
    [tmp,num]=size(tokenList{i,1});
    for j=1:num
        wpa(i,1).pa{j}=tokenList{i,1}{1,j};
    end
end
%第一題結束
for i=1:n;
    letter{i}=word{i,1}(1);
end
[element, sortedCount] = elementCount(letter, 'count');
for i=1:5;
    fprintf('%s:', cell2str(element(1,i)));
    fprintf('%s\n', mat2str(sortedCount(1,i)));
end
clear letter;
clear word;
clear pa;
%第二題結束
for i=1:n;
    %[tmp,num]=size(tokenList{i,1});
    tokenList{i,1}=join(tokenList{i,1},'_');
end
array=split(tokenList{1},'_',0);
for i=2:n;
    array=[array split(tokenList{i},'_',0)];
end
[element, sortedCount] = elementCount(array, 'count');
for i=1:5;
    fprintf('%s:', cell2str(element(1,i)));
    fprintf('%s\n', mat2str(sortedCount(1,i)));
end
%第三題結束