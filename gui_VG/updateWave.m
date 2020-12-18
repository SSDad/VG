function updateWave

global hFig
global dyn bCollectingData
global tt yy

data = guidata(hFig);
hWave = data.Panel.View.Comp.hPlotObj.Wave;
set(hWave, 'XData', tt, 'YData', yy);