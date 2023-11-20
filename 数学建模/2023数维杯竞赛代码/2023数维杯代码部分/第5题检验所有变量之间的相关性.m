% ����ALL��һ������������������ݵľ���
% �������ϵ������
R = corrcoef(ALL);


% ��ʾ���ϵ������

disp(R);

% �鿴���ϵ���Ƿ�����
% �����ϵ�������е�ÿ��Ԫ�ؽ��������Լ���
p_value_matrix = zeros(size(R));
n = size(ALL, 1); % ������С

for i = 1:size(R, 1)
    for j = i+1:size(R, 2)
        t_stat = R(i,j) * sqrt((n-2) / (1-R(i,j)^2));
        p_value_matrix(i,j) = 2 * (1 - tcdf(abs(t_stat), n-2));
    end
end

% ��ʾ������pֵ����
disp(p_value_matrix);







% ����Yields�ǰ����ĸ���������ľ���DFA_CS��Ũ��
% ��DFA_CS��Yields�ϲ�Ϊһ���µľ���
AllData = [DFA_CS, Yields];

% ����������
condAllData = cond(AllData);

% ��ʾ���
disp(['������������DFA/CSŨ�Ⱥ��ĸ����������: ', num2str(condAllData)]);
% ����ֻ�������������������
condYields = cond(Yields);

% ��ʾ���
disp(['��������ֻ�����ĸ����������: ', num2str(condYields)]);





