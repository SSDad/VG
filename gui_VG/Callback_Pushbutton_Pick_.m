function Callback_Pushbutton_Pick_(src, evnt)

global hFig2

global baseLine
global wiwB
global BoxColor
global avgB avgBnP
global yBAll periodBAll
global LAVBox
global pickMode
global wiwBH wBH

data2 = guidata(hFig2);

hWaveComp = data2.Panel.Wave.Comp;
hAllWaveComp = data2.Panel.AllWave.Comp;
hAxWave = hWaveComp.hAxis.Wave;
hAxAllWave = hAllWaveComp.hAxis.AllWave;
hWavePickWin = data2.Panel.Wave.Comp.hPlotObj.WavePickWin;

if strcmp(src.Tag, 'B')
%     hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
%     hg_wgBAll =    data2.Panel.ViewB.Comp.hPlotObj.hg_wgBAll;

    pickMode = 'B';
    
    hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;

    if strcmp(src.String, 'B')
        src.String = 'Bingo';
        
        % init. active box pos
        bt = range(hAxWave.XLim)/10;
        x1 = hAxWave.XLim(1)+bt;
        x2 = hAxWave.XLim(2)-bt;
        y1 = hAxWave.YLim(1);
        y2 = hAxWave.YLim(2);

        hWavePickWin.Position = [x1, y1-1, x2-x1, y2-y1+2];
        hWavePickWin.Color = 'g';
        hWavePickWin.Visible = 'on';

        % BH button
        data2.Panel.Pick.Comp.Pushbutton.Pick(2).Enable = 'off';
        
        % LAV
        data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'off';
        data2.Panel.ParamB.Comp.Text.ParamValue(3).Visible = 'off';
                
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
    
 
        % BH button
        data2.Panel.Pick.Comp.Pushbutton.Pick(2).Enable = 'on';
        
        % LAV
        hLAVBox = data2.Panel.ViewB.Comp.hPlotObj.LAVBox;
if isempty(LAVBox.y2)
    y2 = mean(yBAll(:));
    LAVBox.y2 = y2;
end
junk = min(yBAll(:));
y1 = junk- abs(junk)*0.8;
hLAVBox.Position = [0 y1 avgBnP+2 LAVBox.y2-y1];

[LAV] = fun_getLAV(yBAll, LAVBox.y2);
data2.Panel.ParamB.Comp.Text.ParamValue(3).String = num2str(LAV, 2 );

        
        
        data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'on';
        data2.Panel.ParamB.Comp.Text.ParamValue(3).Visible = 'on';

        data2.Panel.AllWave.Comp = hAllWaveComp;
        data2.Panel.Wave.Comp = hWaveComp;
        guidata(hFig2, data2);
    end
    
%     hAx.XLim = hAx.XLim - dt;
%     hWaveWin.Position(1) = hAx.XLim(1);
%     hWaveWin.Position(3) = range(hAx.XLim);
elseif strcmp(src.Tag, 'BH')
    pickMode = 'BH';

    if strcmp(src.String, 'BH')
        src.String = 'Bingo';
        % B button
        data2.Panel.Pick.Comp.Pushbutton.Pick(1).Enable = 'off';
 
        % init. active box pos
        bt = range(hAxWave.XLim)/10;
        x1 = hAxWave.XLim(1)+bt;
        x2 = hAxWave.XLim(2)-bt;
        y1 = hAxWave.YLim(1);
        y2 = hAxWave.YLim(2);

        hWavePickWin.Position = [x1, y1-1, x2-x1, y2-y1+2];
        hWavePickWin.Color = 'g';
        hWavePickWin.Visible = 'on';

        
        % LAV
%         data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'off';
%         data2.Panel.ParamB.Comp.Text.ParamValue(3).Visible = 'off';
        
        updateBH;

    else
        src.String = 'BH';
        % B button
        data2.Panel.Pick.Comp.Pushbutton.Pick(1).Enable = 'on';
 
        % add box
        hWavePickWin.Visible = 'off';
        pos = hWavePickWin.Position;
        pos(2) = pos(2)+1;
        pos(4) = pos(4)-2;
        
        iBoxBH = length(wBH)+1;
        BoxCLR = BoxColor(iBoxBH, :);
        hWaveComp.hPlotObj.BoxBH(iBoxBH) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2);
        hAllWaveComp.hPlotObj.BoxBH(iBoxBH) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2);
        text(hAxAllWave, pos(1)+pos(3)/3, pos(2)+pos(4)/2, char(iBoxBH+'A'-1), 'Color', BoxCLR, 'FontSize', 24, 'FontWeight', 'bold')

        % add wiw to view plot
        wBH(iBoxBH).wib = wiwBH;
        wBH(iBoxBH).hLine = line(data2.Panel.ViewBH.Comp.hAxis.ViewBH, 'XData', wiwBH.tt, 'YData', wiwBH.yy-baseLine, ...
            'Color', BoxCLR, 'LineStyle', '-', 'LineWidth', 1);
        
        set(data2.Panel.ViewBH.Comp.hPlotObj.wiwBH, 'XData', [], 'YData', []);

%         avgB(iBoxB).hg = hggroup(data2.Panel.ViewB.Comp.hAxis.ViewB);  
% 
%         x = 1:avgBnP;
%         for iW = 1:size(wiwB.yy, 1)
%             y = wiwB.yy(iW, :);
%             line(avgB(iBoxB).hg, 'XData', x, 'YData', y, 'Color', BoxCLR);
%         end
%         yBAll = [yBAll; wiwB.yy];
%         periodBAll = [periodBAll diff(wiwB.locs2)];
% 
%         avgB(iBoxB).wib = wiwB;

    end

end

% reorder
reorderPlotObj(data2.Panel.ViewB.Comp.hAxis.ViewB);