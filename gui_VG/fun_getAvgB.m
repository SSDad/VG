function [wg] = fun_getAvgB(tt, yy, ind)

wg = [];

bPlot = 0;

dt = tt(2)-tt(1);
t = tt(ind(1):ind(2));
w = yy(ind(1):ind(2));

framelen = round(2/dt);
if mod(framelen, 2) == 0
    framelen = framelen + 1;
end
sw = sgolayfilt(w, 3, framelen);

[pks1, locs1] = findpeaks(sw, 'MinPeakDistance', 2/dt, 'MInPeakheight', mean(sw));
fsw = max(sw) - sw ;
[pks2, locs2] = findpeaks(fsw, 'MinPeakDistance', 2/dt, 'MInPeakheight', mean(fsw));
wg.locs1 = locs1;
wg.locs2 = locs2;

if bPlot
    figure(99), clf
    plot(t, w, t, sw, t(locs1), sw(locs1), 'or', t(locs2), sw(locs2), 'ob', 'LineWidth', 2, 'MarkerSize', 12)
end

nP = 100;
wg.nP = 100;
for n = 1:length(locs2)-1
    ww = w(locs2(n):locs2(n+1));
    yy = imresize(ww, [1 nP]);
    wg.tt{n} = t(locs2(n):locs2(n+1));
    wg.ww{n} = ww;
    wg.yy(n, :) = yy; 
end

if bPlot
    figure(100), clf
    plot(wg.yy'), hold on
    plot(mean(wg.yy), 'Color', 'r', 'LineWidth', 3);
end