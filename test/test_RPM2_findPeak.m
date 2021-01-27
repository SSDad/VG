clearvars;

load('dataRPM')

figure(99), clf
plot(tt, yy)
set(gca, 'XLim', [tt(1, 1), tt(end, 1)])
legend(pos)

figure(100), clf
for n = 1:3
    subplot(3, 1, n);
    plot(tt(:, n), yy(:, n));
    set(gca, 'XLim', [tt(1, 1), tt(end, 1)]);
    title(pos{n});
end

t1 = 185; t2 = 235;
t1 = 80; t2 = 130;