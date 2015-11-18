function m2(action)
% mouse01: 本例展示如何設定滑鼠事件的反應指令, based on "switchyard programming"

%	Roger Jang, 20040405
global x0 x1 y0 y1 data x;
if nargin<1, action='start'; end

switch(action)
	case 'start'	% 開啟圖形視窗
		axis([0 1 0 1]);	% 設定圖軸範圍
		box on;			% 將圖軸加上圖框
		title('Click and drag your mouse in this window!');
		% 設定滑鼠按鈕被按下時的反應指令為「mouse01 down」
		set(gcf, 'WindowButtonDownFcn', 'm2 down');
	case 'down'	% 滑鼠按鈕被按下時的反應指令

		currPt = get(gca, 'CurrentPoint');
        x1 = currPt(1,1);
		y1 = currPt(1,2);
        mouseside=get(gcf,'SelectionType');
        t=strcmp(mouseside,'normal');
        if t==1
            line(x1,y1,'marker', '.');
            data=[data;x1 y1];
            set(gcf,'userdata',data);
        else
            data2=get(gcf,'userdata')
            x=data2(end,:)
            data(end,:)=[]
            set(gcf,'userdata',data); 
            line(x(1,1),x(1,2), 'marker', '.', 'EraseMode', 'xor');
        end
    
%         x0=x1;
%         y0=y1;        
		% 設定滑鼠按鈕被釋放時的反應指令為「mouse01 up」
		set(gcf, 'WindowButtonUpFcn', 'm2 up');
		% 列印「Mouse down!」訊息
		fprintf('Mouse down!\n');
        
	%case 'move'	% 滑鼠移動時的反應指令
		
	case 'up'	% 滑鼠按鈕被釋放時的反應指令
		% 清除滑鼠移動時的反應指令
		set(gcf, 'WindowButtonMotionFcn', '');
		% 清除滑鼠按鈕被釋放時的反應指令
		set(gcf, 'WindowButtonUpFcn', '');
		% 列印「Mouse up!」訊息
		fprintf('Mouse up!\n');
end
