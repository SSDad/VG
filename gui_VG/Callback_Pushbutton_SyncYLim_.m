function Callback_Pushbutton_SyncYLim_(src, evnt)

global hFig2

% global wiwB
% global BoxColor BoxColorBH
% global avgB avgBnP
% global yBAll periodBAll
% global yA_mean
% global LAVBox
% global pickMode
% global wiwBH wBH ViewBHLim
% global LAVBoxBH

data2 = guidata(hFig2);

% hWaveComp = data2.Panel.Wave.Comp;
% hAllWaveComp = data2.Panel.AllWave.Comp;
% hAxWave = hWaveComp.hAxis.Wave;
% hAxAllWave = hAllWaveComp.hAxis.AllWave;
% hWavePickWin = data2.Panel.Wave.Comp.hPlotObj.WavePickWin;
syncYLim;
if strcmp(src.String, 'Sync')
    src.String = 'UnSync';
else
    src.String = 'Sync';
end