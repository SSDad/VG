function Callback_WavePickWin(src, evnt)

% global hFig2
global pickMode

% data2 = guidata(hFig2);
if strcmp(pickMode, 'B')
    updateWIWB;
    updateAvgB;
else
    updateWIWBH;
end