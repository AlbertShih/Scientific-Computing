function emailArray = emailExtract(url)
string=urlread(url);
string=regexprep(string, '<!--[\s\S]*?-->', '');
pattern='\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+';
%\w单[a-zA-Z0-9_]; *:ボ﹃いΤ 0 礚计ㄤ玡才腹ず甧; +:ボ﹃いΤ 1 礚计ㄤ玡才腹ず甧
[start, finish] = regexp(string, pattern);
for i=1:length(start)
    emailArray{i,1}=string(start(i):finish(i));
end
emailArray=unique(emailArray);

