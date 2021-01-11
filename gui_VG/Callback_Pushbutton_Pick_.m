function Callback_Pushbutton_Pick_(src, evnt)

global hFig2
data2 = guidata(hFig2);

hWaveComp = data2.Panel.Wave.Comp;
hAllWaveComp = data2.Panel.AllWave.Comp;
hAxWave = hWaveComp.hAxis.Wave;
hAxAllWave = hAllWaveComp.hAxis.AllWave;
hWavePickWin = data2.Panel.Wave.Comp.hPlotObj.WavePickWin;

dt = range(hAxWave.XLim)/10;
x1 = hAxWave.XLim(1)+dt;
x2 = hAxWave.XLim(2)-dt;
y1 = hAxWave.YLim(1);
y2 = hAxWave.YLim(2);

if strcmp(src.Tag, 'B')
    if src.String == 'B'
        src.String = 'Bingo';
        
        hWavePickWin.Position = [x1, y1-1, x2-x1, y2-y1+2];
        hWavePickWin.Color = 'g';
        hWavePickWin.Visible = 'on';
    else
        src.String = 'B';

        nBoxH = 0;
        if isfield(hWaveComp.hPlotObj, 'BoxH')
            nBoxH = length(hWaveComp.hPlotObj.BoxH);
        end
        hWavePickWin.Visible = 'off';
        pos = hWavePickWin.Position;
        pos(2) = pos(2)+1;
        pos(4) = pos(4)-2;
        hWaveComp.PlotObj.BoxH(nBoxH+1) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', 'g', 'LineWidth', 2);
        hAllWaveComp.PlotObj.BoxH(nBoxH+1) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', 'g', 'LineWidth', 2);
        
%         data2.Panel.AllWave.Comp = hAllWaveComp;
%         guidata(hFig2, data2);
    end
    updateAvgB;
    
%     hAx.XLim = hAx.XLim - dt;
%     hWaveWin.Position(1) = hAx.XLim(1);
%     hWaveWin.Position(3) = range(hAx.XLim);
elseif strcmp(src.Tag, 'BH')
end