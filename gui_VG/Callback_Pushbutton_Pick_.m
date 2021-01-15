function Callback_Pushbutton_Pick_(src, evnt)

global hFig2

global wiwB
global BoxColor
global avgB avgBnP
global yBAll periodBAll

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
%     hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
%     hg_wgBAll =    data2.Panel.ViewB.Comp.hPlotObj.hg_wgBAll;
    hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;

    if src.String == 'B'
        src.String = 'Bingo';
        
        hWavePickWin.Position = [x1, y1-1, x2-x1, y2-y1+2];
        hWavePickWin.Color = 'g';
        hWavePickWin.Visible = 'on';

        updateAvgB;

    else
        src.String = 'B';

        % add box
        hWavePickWin.Visible = 'off';
        pos = hWavePickWin.Position;
        pos(2) = pos(2)+1;
        pos(4) = pos(4)-2;
        
        iBoxB = length(avgB)+1;
        BoxCLR = BoxColor(iBoxB, :);
        hWaveComp.hPlotObj.BoxB(iBoxB) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2);
        hAllWaveComp.hPlotObj.BoxB(iBoxB) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2);
        text(hAxAllWave, pos(1)+pos(3)/2, pos(2)+pos(4)/2, num2str(iBoxB), 'Color', BoxCLR, 'FontSize', 24, 'FontWeight', 'bold')
        
        data2.Panel.TableB.Comp.Radiobutton.Box(iBoxB).Visible = 'on';
        
        % add wiw to avg plot
        delete(hg_wiwB.Children(:)); % remove active (green)
        
        avgB(iBoxB).hg = hggroup(data2.Panel.ViewB.Comp.hAxis.ViewB);  

        x = 1:avgBnP;
        for iW = 1:size(wiwB.yy, 1)
            y = wiwB.yy(iW, :);
            line(avgB(iBoxB).hg, 'XData', x, 'YData', y, 'Color', BoxCLR);
        end
        yBAll = [yBAll; wiwB.yy];
        periodBAll = [periodBAll diff(wiwB.locs2)];

        avgB(iBoxB).wib = wiwB;

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