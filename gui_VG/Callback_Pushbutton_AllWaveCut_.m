function Callback_Pushbutton_AllWaveCut_(src, evnt)

global hFig2
global tt yy
data2 = guidata(hFig2);

hWave = data2.Panel.Wave.Comp.hPlotObj.Wave;

if strcmp(src.Tag, 'Cut')
    % Cut
    pos = data2.Panel.AllWave.Comp.hPlotObj.CutOnAllWave.Position;
    tCut1 = pos(1);
    tCut2 = tCut1 + pos(3);
    data2.Panel.AllWave.Comp.hAxis.AllWave.XLim = [tCut1 tCut2];
    data2.Panel.AllWave.Comp.hPlotObj.CutOnAllWave.Visible = 'off';

    % Wave
    hAxWave = data2.Panel.Wave.Comp.hAxis.Wave;
    set(hWave, 'XData', tt, 'YData', yy);
    
    cutRange = tCut2 - tCut1;
    tWin1 = tCut1 + cutRange/10;
    tWin2 = tWin1 + cutRange/10;
    hAxWave.XLim = [tWin1 tWin2];
    
    [~, iWin1] = min(abs(tWin1 - tt));
    [~, iWin2] = min(abs(tWin2 - tt));
    yMin = min(yy(iWin1:iWin2));
    yMax = max(yy(iWin1:iWin2));
    junk = (yMax-yMin)/10;
    hAxWave.YLim = [yMin-junk yMax+junk];
    
    % WinOnAllWave
    [~, iCut1] = min(abs(tCut1 - tt));
    [~, iCut2] = min(abs(tCut2 - tt));
    yMin = min(yy(iCut1:iCut2));
    yMax = max(yy(iCut1:iCut2));
    data2.Panel.AllWave.Comp.hAxis.AllWave.YLim = [yMin yMax];

    junk = (yMax-yMin)/10;
    data2.Panel.AllWave.Comp.hPlotObj.WinOnAllWave.Position = [tWin1 yMin-junk tWin2-tWin1 yMax-yMin+junk*2];
    data2.Panel.AllWave.Comp.hPlotObj.WinOnAllWave.Visible = 'on';

    data2.Panel.Pick.Comp.Pushbutton.Pick(1).Enable = 'on'; % 'Breath' on
    data2.Panel.Pick.Comp.Pushbutton.Pick(2).Enable = 'on'; % 'Breath Hold' on

else
    data2.Panel.AllWave.Comp.hAxis.AllWave.XLim = [tt(1) tt(end)];
    data2.Panel.AllWave.Comp.hAxis.AllWave.YLim = [min(yy) max(yy)];
    data2.Panel.AllWave.Comp.hPlotObj.CutOnAllWave.Visible = 'on';
    data2.Panel.AllWave.Comp.hPlotObj.WinOnAllWave.Visible = 'off';

    set(hWave, 'XData', [], 'YData', []);

    data2.Panel.Pick.Comp.Pushbutton.Pick(1).Enable = 'off'; % 'Breath' off
    data2.Panel.Pick.Comp.Pushbutton.Pick(2).Enable = 'off'; % 'Breath Hold' off

end