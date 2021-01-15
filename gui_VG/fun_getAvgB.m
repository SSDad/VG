function [wiw] = fun_getAvgB(tt, yy, ind, avgBnP)

wiw = [];

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
wiw.locs1 = locs1;
wiw.locs2 = locs2;

if bPlot
    figure(99), clf
    plot(t, w, t, sw, t(locs1), sw(locs1), 'or', t(locs2), sw(locs2), 'ob', 'LineWidth', 2, 'MarkerSize', 12)
end

avgBnP = 100;
% wiw.nP = 100;
for n = 1:length(locs2)-1
    ww = w(locs2(n):locs2(n+1));
    yy = imresize(ww, [1 avgBnP]);
    wiw.tt{n} = t(locs2(n):locs2(n+1));
    wiw.ww{n} = ww;
    wiw.yy(n, :) = yy; 
end

if bPlot
    figure(100), clf
    plot(wiw.yy'), hold on
    plot(mean(wiw.yy), 'Color', 'r', 'LineWidth', 3);
end