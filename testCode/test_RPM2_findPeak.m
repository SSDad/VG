clearvars;

[pathVG, ~, ~] = fileparts(pwd);
addpath(fullfile(pathVG, 'gui_VG'));

load('dataRPM')

figure(9), clf
plot(tt, yy)
set(gca, 'XLim', [tt(1, 1), tt(end, 1)])
legend(pos)

figure(10), clf
for n = 1:3
    subplot(3, 1, n);
    plot(tt(:, n), yy(:, n));
    set(gca, 'XLim', [tt(1, 1), tt(end, 1)]);
    title(pos{n});
end

t1 = 185; t2 = 235;
% t1 = 80; t2 = 130;
t = tt(:, 1);

[~, ind(1)] = min(abs(t-t1));
[~, ind(2)] = min(abs(t-t2));


for n = 1
    [wiw] = fun_getAvgB(t', yy(:, n)', ind, 100);
end