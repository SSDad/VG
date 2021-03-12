function Callback_Pushbutton_Zoom_(src, evnt)

global hFig2
global tB tBH
global tMax

data2 = guidata(hFig2);

hAx = data2.Panel.Wave.Comp.hAxis.Wave;
hWaveWin = data2.Panel.AllWave.Comp.hPlotObj.WinOnAllWave;
dt = range(hAx.XLim)/10;
if strcmp(src.Tag, '<<')
    hAx.XLim = hAx.XLim - dt;
    hWaveWin.Position(1) = hAx.XLim(1);
    hWaveWin.Position(3) = range(hAx.XLim);
elseif strcmp(src.Tag, '>>')
    hAx.XLim = hAx.XLim + dt;
    hWaveWin.Position(1) = hAx.XLim(1);
    hWaveWin.Position(3) = range(hAx.XLim);
elseif strcmp(src.Tag, '< >')
    hAx.XLim(1) = hAx.XLim(1) - dt;
    hAx.XLim(2) = hAx.XLim(2) + dt;
    hWaveWin.Position(1) = hAx.XLim(1);
    hWaveWin.Position(3) = range(hAx.XLim);
elseif strcmp(src.Tag, '> <')
    hAx.XLim(1) = hAx.XLim(1) + dt;
    hAx.XLim(2) = hAx.XLim(2) - dt;
    hWaveWin.Position(1) = hAx.XLim(1);
    hWaveWin.Position(3) = range(hAx.XLim);
end