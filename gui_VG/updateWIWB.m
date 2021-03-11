function updateWIWB

global hFig2
global tt yy
global wiwB  % wave group in current picked window
% global yBAll periodBAll % all previous wave y and period
global avgBnP

data2 = guidata(hFig2);
hPeaks = data2.Panel.Wave.Comp.hPlotObj.Peaks;
hTroughs = data2.Panel.Wave.Comp.hPlotObj.Troughs;
hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;

pos = data2.Panel.Wave.Comp.hPlotObj.WavePickWin.Position;

[~, ind(1)] = min(abs(tt-pos(1)));
[~, ind(2)] = min(abs(tt-pos(1)-pos(3)));
[wiwB] = fun_getAvgB(tt, yy, ind, avgBnP);
    
%% peaks and troughs on wave
peakInd = wiwB.locs1+ind(1)-1;
set(hPeaks, 'XData', tt(peakInd), 'YData', yy(peakInd));
troughInd = wiwB.locs2+ind(1)-1;
set(hTroughs, 'XData', tt(troughInd), 'YData', yy(troughInd));