function emailArray = emailExtract(url)
string=urlread(url);
string=regexprep(string, '<!--[\s\S]*?-->', '');
pattern='\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+';
%\w���P��[a-zA-Z0-9_]; *:��ܦr�ꤤ�� 0 ��L�ƭӨ�e�@�Ÿ������e; +:��ܦr�ꤤ�� 1 ��L�ƭӨ�e�@�Ÿ������e�C
[start, finish] = regexp(string, pattern);
for i=1:length(start)
    emailArray{i,1}=string(start(i):finish(i));
end
emailArray=unique(emailArray);

