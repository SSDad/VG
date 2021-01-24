function updateWIWBH

global hFig2
global tt yy baseLine dt
global wiwBH  % wave group in current picked window

% global yBAll periodBAll % all previous wave y and period
% global avgBnP
% global LAVBox

data2 = guidata(hFig2);
% % hAllWaveComp = data2.Panel.AllWave.Comp;
% hPeaks = data2.Panel.Wave.Comp.hPlotObj.Peaks;
% hTroughs = data2.Panel.Wave.Comp.hPlotObj.Troughs;
hwiwBH = data2.Panel.ViewBH.Comp.hPlotObj.wiwBH;
% hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;

pos = data2.Panel.Wave.Comp.hPlotObj.WavePickWin.Position;
[~, ind(1)] = min(abs(tt-pos(1)));
[~, ind(2)] = min(abs(tt-pos(1)-pos(3)));
wiwBH.tt = tt(ind(1):ind(2)) - tt(ind(1));
wiwBH.yy = yy(ind(1):ind(2)) - baseLine;
set(hwiwBH, 'XData', wiwBH.tt, 'YData', wiwBH.yy);

updateBHLimit;