function m2(action)
% mouse01: ���Үi�ܦp��]�w�ƹ��ƥ󪺤������O, based on "switchyard programming"

%	Roger Jang, 20040405
global x0 x1 y0 y1 data x;
if nargin<1, action='start'; end

switch(action)
	case 'start'	% �}�ҹϧε���
		axis([0 1 0 1]);	% �]�w�϶b�d��
		box on;			% �N�϶b�[�W�Ϯ�
		title('Click and drag your mouse in this window!');
		% �]�w�ƹ����s�Q���U�ɪ��������O���umouse01 down�v
		set(gcf, 'WindowButtonDownFcn', 'm2 down');
	case 'down'	% �ƹ����s�Q���U�ɪ��������O

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
		% �]�w�ƹ����s�Q����ɪ��������O���umouse01 up�v
		set(gcf, 'WindowButtonUpFcn', 'm2 up');
		% �C�L�uMouse down!�v�T��
		fprintf('Mouse down!\n');
        
	%case 'move'	% �ƹ����ʮɪ��������O
		
	case 'up'	% �ƹ����s�Q����ɪ��������O
		% �M���ƹ����ʮɪ��������O
		set(gcf, 'WindowButtonMotionFcn', '');
		% �M���ƹ����s�Q����ɪ��������O
		set(gcf, 'WindowButtonUpFcn', '');
		% �C�L�uMouse up!�v�T��
		fprintf('Mouse up!\n');
end
