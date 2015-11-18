function mouse01(action)
% mouse01: ���Үi�ܦp��]�w�ƹ��ƥ󪺤������O, based on "switchyard programming"

%	Roger Jang, 20040405
global x0 x1 y0 y1;
if nargin<1, action='start'; end

switch(action)
	case 'start'	% �}�ҹϧε���
		axis([0 1 0 1]);	% �]�w�϶b�d��
		box on;			% �N�϶b�[�W�Ϯ�
		title('Click and drag your mouse in this window!');
		% �]�w�ƹ����s�Q���U�ɪ��������O���umouse01 down�v
		set(gcf, 'WindowButtonDownFcn', 'mouse01 down');
	case 'down'	% �ƹ����s�Q���U�ɪ��������O
		% �]�w�ƹ����ʮɪ��������O���umouse01 move�v
		currPt = get(gca, 'CurrentPoint');
        x0 = currPt(1,1);
		y0 = currPt(1,2);
         line(x0,y0,'marker', '.');
        set(gcf, 'WindowButtonMotionFcn', 'mouse01 move');
		% �]�w�ƹ����s�Q����ɪ��������O���umouse01 up�v
		set(gcf, 'WindowButtonUpFcn', 'mouse01 up');
		% �C�L�uMouse down!�v�T��
		fprintf('Mouse down!\n');
	case 'move'	% �ƹ����ʮɪ��������O
		currPt = get(gca, 'CurrentPoint');
		x1 = currPt(1,1);
		y1 = currPt(1,2);
        line([x0,x1],[y0,y1],'marker', '.');
        % �C�L�uMouse is moving!�v�T���ηƹ��{�b��m
		fprintf('Mouse is moving! Current location = (%g, %g)\n', x1, y1);
        x0=x1;
        y0=y1;
		
	case 'up'	% �ƹ����s�Q����ɪ��������O
		% �M���ƹ����ʮɪ��������O
		set(gcf, 'WindowButtonMotionFcn', '');
		% �M���ƹ����s�Q����ɪ��������O
		set(gcf, 'WindowButtonUpFcn', '');
		% �C�L�uMouse up!�v�T��
		fprintf('Mouse up!\n');
end
