clearvars;

[pathVG, ~, ~] = fileparts(pwd);
addpath(fullfile(pathVG, 'gui_VG'));

load('data_MRN-Mrn202101_Fraction-1_DT-20210118-090323-091507_TE_702')

figure(9), clf
plot(tt, yy)
set(gca, 'XLim', [tt(1), tt(end)])

% figure(10), clf
% for n = 1:3
%     subplot(3, 1, n);
%     plot(tt(:, n), yy(:, n));
%     set(gca, 'XLim', [tt(1, 1), tt(end, 1)]);
%     title(pos{n});
% end

t1 = 185; t2 = 235;
t1 = 10; t2 = 80;

[~, ind(1)] = min(abs(tt-t1));
[~, ind(2)] = min(abs(tt-t2));

[wiw] = fun_getAvgB(tt, yy, ind, 100);