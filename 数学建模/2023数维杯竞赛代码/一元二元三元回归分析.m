% ��������
X_ratio = [0; 10; 20; 30; 40; 50; 60; 80; 100]; % ��������޻��ոѵı���
Y_tar = [19.46; 17.25; 15.43; 14.14; 13.89; 13.21; 12.84; 12.57; 12.13]; % ���Ͳ���
Y_water = [26.84; 27.64; 28.11; 28.23; 28.62; 29.01; 30.07; 30.68; 31.02];
Y_char = [29.21; 29.11; 29.3; 29.34; 29.14; 29.33; 29.47; 29.64; 29.87];
Y_syngas = [24.49; 26; 27.16; 28.29; 28.35; 28.45; 27.62; 27.11; 26.98];



% ת��X_ratioΪ�ٷֱ���ʽ
X_ratio = X_ratio / 100;

% һԪ�ع����
mdl_1 = fitlm(X_ratio, Y_tar);

% ����Ԥ��ֵ��R��
Y_pred_1 = predict(mdl_1, X_ratio);
R2_1 = mdl_1.Rsquared.Ordinary;

% ����ԭʼ���ݵ��һԪ�ع������
figure;
scatter(X_ratio, Y_tar, 'filled');
hold on;
plot(X_ratio, Y_pred_1, 'b-', 'LineWidth', 2);
xlabel('�����/�޻��ոѱ���');
ylabel('���Ͳ��� (%)');
title(sprintf('һԪ�ع�������� (R^2 = %.2f)', R2_1));



% ��Ԫ�ع����
X = [X_ratio, X_ratio.^2]; % ��ӵڶ����Ա���
mdl_2 = fitlm(X, Y_tar);

% ����Ԥ��ֵ��R��
Y_pred_2 = predict(mdl_2, X);
R2_2 = mdl_2.Rsquared.Ordinary;

% ����ԭʼ���ݵ�Ͷ�Ԫ�ع������

scatter(X_ratio, Y_tar, 'filled');
hold on;
plot(X_ratio, Y_pred_2, 'r-', 'LineWidth', 2);
xlabel('�����/�޻��ոѱ���');
ylabel('���Ͳ��� (%)');
title(sprintf('��Ԫ�ع�������� (R^2 = %.2f)', R2_2));

% ��Ԫ�ع����a
X = [X_ratio, X_ratio.^2, X_ratio.^3]; % ��ӵ������Ա���
mdl_3 = fitlm(X, Y_tar);

% ����Ԥ��ֵ��R��
Y_pred_3 = predict(mdl_3, X);
R2_3 = mdl_3.Rsquared.Ordinary;

% ����ԭʼ���ݵ����Ԫ�ع������

% ����ԭʼ���ݵ�
scatter(X_ratio, Y_tar, 100, 'o', 'filled');


plot(X_ratio, Y_pred_3, 'm-', 'LineWidth', 2);
xlabel('�����/�޻��ոѱ���');
ylabel('���Ͳ��� (%)');
title(sprintf('��Ԫ�ع�������� (R^2 = %.2f)', R2_3));
hold off;

