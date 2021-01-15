function updateAvgB

global hFig2
global tt yy baseLine
global wiwB  % wave group in current picked window
global yBAll % all previous wave y

data2 = guidata(hFig2);
hAllWaveComp = data2.Panel.AllWave.Comp;
hPeaks = data2.Panel.Wave.Comp.hPlotObj.Peaks;
hTroughs = data2.Panel.Wave.Comp.hPlotObj.Troughs;
hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;

pos = data2.Panel.Wave.Comp.hPlotObj.WavePickWin.Position;

[~, ind(1)] = min(abs(tt-pos(1)));
[~, ind(2)] = min(abs(tt-pos(1)-pos(3)));
[wiwB] = fun_getAvgB(tt, yy-baseLine, ind);
    
% peaks and troughs on wave
peakInd = wiwB.locs1+ind(1)-1;
set(hPeaks, 'XData', tt(peakInd), 'YData', yy(peakInd)-baseLine);
troughInd = wiwB.locs2+ind(1)-1;
set(hTroughs, 'XData', tt(troughInd), 'YData', yy(troughInd)-baseLine);
    
if ~isempty(hg_wiwB.Children)
    delete(hg_wiwB.Children(:));
end

x = 1:wiwB.nP;
for iW = 1:size(wiwB.yy, 1)
    y = wiwB.yy(iW, :);
    line(hg_wiwB, 'XData', x, 'YData', y, 'Color', 'g');
end

set(hAvg, 'XData', x, 'YData', mean([yBAll; wiwB.yy]));