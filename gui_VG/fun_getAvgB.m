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

MPD = 2;  %initial MinPeakDistance in seconds 
%% sgolay
framelen = round(MPD/dt);
if mod(framelen, 2) == 0
    framelen = framelen + 1;
end
if framelen < 11
    framelen = 11;
end
% sw = sgolayfilt(w, 3, framelen);
sw = w;

[peak1, locs1] = findpeaks(sw, 'MinPeakDistance', MPD/dt, 'MInPeakheight', mean(sw)*0.6); % peak
% [pks1, locs1] = findpeaks(sw, 'MinPeakDistance', 1/dt);
% [pks1, locs1] = findpeaks(sw);

mpd_new = mean(rmoutliers(diff(locs1)))*0.6;
[peak1, locs1] = findpeaks(sw, 'MinPeakDistance', mpd_new, 'MInPeakheight', mean(sw)*0.6); % peak

% dL = diff(locs1);
% indOL = isoutlier(dL);
% meanL = mean(dL(~indOL));

fsw = max(sw) - sw ;
% [peak2, locs2] = findpeaks(fsw, 'MinPeakDistance', meanL*0.6, 'MInPeakheight', mean(fsw)); % trough
[peak2, locs2] = findpeaks(fsw, 'MinPeakDistance', mpd_new, 'MInPeakheight', mean(fsw)); % trough
% [pks2, locs2] = findpeaks(fsw);

% if locs2(1) < locs1(1)
%     locs2(1) = [];
% end
% if locs2(end) > locs1(end)
%     locs2(end) = [];
% end

% % more than 1 consecutive peak/trough case
% locs1_new = [];
% locs2_new = [];
% peak1_new = [];
% peak2_new = [];
% iPeak = 0;
% iTrough = 0;
% if locs1(1) < locs2(1)
%     iPeak = iPeak + 1;
%     ind = find(locs1 < locs2(1));
%     idx = 1;
%     if length(ind) > 1
%         junk = peak1(ind);
%         [val idx] = max(junk);
%     end
%     locs1_new(iPeak) = locs1(idx);
%     peak1_new(iPeak) = peak1(idx);
% end
%         
        
wiw.locs1 = locs1;
wiw.locs2 = locs2;

if bPlot
    figure(102), clf
    subplot(3,1,1)
    plot(t, sw, t(locs1), sw(locs1), 'or');
    subplot(3,1,2)
    plot(t, fsw, t(locs2), fsw(locs2), 'ob');
    subplot(3,1,3)
    plot(t, w, t, sw, t(locs1), sw(locs1), 'or', t(locs2), sw(locs2), 'ob', 'LineWidth', 2, 'MarkerSize', 6)
end

for n = 1:length(locs1)-1
    ww = v(locs1(n):locs1(n+1));
    yy = imresize(ww, [1 avgBnP]);
    wiw.tt{n} = t(locs1(n):locs1(n+1));
    wiw.ww{n} = ww;
    wiw.yy(n, :) = yy; 
end

% if bPlot
%     figure(103), clf
%     plot(wiw.yy'), hold on
%     plot(mean(wiw.yy), 'Color', 'r', 'LineWidth', 3);
% end