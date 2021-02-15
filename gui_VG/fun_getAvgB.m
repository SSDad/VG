function [wiw] = fun_getAvgB(tt, yy, ind, avgBnP)

wiw = [];

bPlot = 0;

dt = tt(2)-tt(1);
t = tt(ind(1):ind(2));
v = yy(ind(1):ind(2));

%% remove drifting
opol = 6;
[p, s, mu] = polyfit(t, v, opol);
f_y = polyval(p, t, [], mu);

w = v - f_y;

if bPlot
    figure(101), clf
    plot(t, v, 'r')
    hold on
    plot(t, f_y, 'g')
    plot(t, w, 'b')
    legend({'org', 'trend', 'trend removed'})
end

MPD = 1;
%% sgolay
framelen = round(MPD/dt);
if mod(framelen, 2) == 0
    framelen = framelen + 1;
end
sw = sgolayfilt(w, 3, framelen);
% sw = w;

[pks1, locs1] = findpeaks(sw, 'MinPeakDistance', MPD/dt, 'MInPeakheight', mean(sw));
% [pks1, locs1] = findpeaks(sw, 'MinPeakDistance', 1/dt);
% [pks1, locs1] = findpeaks(sw);

dL = diff(locs1);
indOL = isoutlier(dL);
meanL = mean(dL(~indOL));

fsw = max(sw) - sw ;
[pks2, locs2] = findpeaks(fsw, 'MinPeakDistance', meanL*0.6, 'MInPeakheight', mean(fsw));
% [pks2, locs2] = findpeaks(fsw);
wiw.locs1 = locs1;
wiw.locs2 = locs2;

if bPlot
    figure(102), clf
    subplot(3,1,1)
    plot(t, sw, t(locs1), sw(locs1), 'or');
    subplot(3,1,2)
    plot(t, fsw, t(locs2), fsw(locs2), 'or');
    subplot(3,1,3)
    plot(t, w, t, sw, t(locs1), sw(locs1), 'or', t(locs2), sw(locs2), 'ob', 'LineWidth', 2, 'MarkerSize', 12)
end

for n = 1:length(locs2)-1
    ww = v(locs2(n):locs2(n+1));
    yy = imresize(ww, [1 avgBnP]);
    wiw.tt{n} = t(locs2(n):locs2(n+1));
    wiw.ww{n} = ww;
    wiw.yy(n, :) = yy; 
end

% if bPlot
%     figure(103), clf
%     plot(wiw.yy'), hold on
%     plot(mean(wiw.yy), 'Color', 'r', 'LineWidth', 3);
% end