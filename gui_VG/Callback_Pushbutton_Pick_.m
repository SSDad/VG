function Callback_Pushbutton_Pick_(src, evnt)

global hFig2
global wgB wgBAll yBAll wgColor hwgBAll

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
    hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
    hg_wgBAll =    data2.Panel.ViewB.Comp.hPlotObj.hg_wgBAll;
    hg_wgB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wgB;

    if src.String == 'B'
        src.String = 'Bingo';
        
        hWavePickWin.Position = [x1, y1-1, x2-x1, y2-y1+2];
        hWavePickWin.Color = 'g';
        hWavePickWin.Visible = 'on';

        updateAvgB;

    else
        src.String = 'B';

        % add box
        nBoxB = length(wgBAll);
%         nBoxB = 0;
%         if isfield(hWaveComp.hPlotObj, 'BoxH')
%             nBoxB = length(hWaveComp.hPlotObj.BoxH);
%         end
        hWavePickWin.Visible = 'off';
        pos = hWavePickWin.Position;
        pos(2) = pos(2)+1;
        pos(4) = pos(4)-2;
        hWaveComp.hPlotObj.BoxB(nBoxB+1) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', wgColor(nBoxB+1, :), 'LineWidth', 2);
        hAllWaveComp.hPlotObj.BoxB(nBoxB+1) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', wgColor(nBoxB+1, :), 'LineWidth', 2);
        text(hAxAllWave, pos(1)+pos(3)/2, pos(2)+pos(4)/2, num2str(nBoxB+1), 'Color', wgColor(nBoxB+1, :), 'FontSize', 24, 'FontWeight', 'bold')
        
        data2.Panel.TableB.Comp.Radiobutton.Box(nBoxB+1).Visible = 'on';
        
        % add active to wgBAll
        delete(hg_wgB.Children(:)); % remove active (green)
        wgBAll{nBoxB+1} = wgB;
        x = 1:wgB.nP;
        for iW = 1:size(wgB.yy, 1)
            y = wgB.yy(iW, :);
            hwgBAll(nBoxB+1) = line(hg_wgBAll, 'XData', x, 'YData', y, 'Color', wgColor(nBoxB+1, :));
        end
%         hwgB{nBoxB+1} = hg_wgBAll;
        yBAll = [yBAll; wgB.yy];

        % remove peaks
        set(data2.Panel.Wave.Comp.hPlotObj.Peaks, 'XData', [], 'YData', []);
        set(data2.Panel.Wave.Comp.hPlotObj.Troughs, 'XData', [], 'YData', []);
        
        data2.Panel.AllWave.Comp = hAllWaveComp;
        data2.Panel.Wave.Comp = hWaveComp;
        guidata(hFig2, data2);
    end
    
%     hAx.XLim = hAx.XLim - dt;
%     hWaveWin.Position(1) = hAx.XLim(1);
%     hWaveWin.Position(3) = range(hAx.XLim);
elseif strcmp(src.Tag, 'BH')
end