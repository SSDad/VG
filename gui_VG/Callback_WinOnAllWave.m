function Callback_WinOnAllWave(src, evnt)

global hFig2
global tt yy

pos = src.Position;

data2 = guidata(hFig2);
hAxWave = data2.Panel.Wave.Comp.hAxis.Wave;
hAxWave.XLim = [pos(1) pos(1)+pos(3)];

[~, i1] = min(abs(hAxWave.XLim(1)-tt));
[~, i2] = min(abs(hAxWave.XLim(2)-tt));
yMin = min(yy(i1:i2));
yMax = max(yy(i1:i2));
junk = (yMax-yMin)/10;
hAxWave.YLim = [yMin-junk yMax+junk];