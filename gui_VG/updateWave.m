function updateWave

global hFig
global tt yy 
global baseLine
global bWaveRectInit;
global y_WaveRect;

%% wave
data = guidata(hFig);
hAx = data.Panel.Wave.Comp.hAxis.Wave;
hWave = data.Panel.Wave.Comp.hPlotObj.Wave;
set(hWave, 'XData', tt, 'YData', yy-baseLine);

T = data.WaveParam.T;
if tt(end) > T
    hAx.XLim = [tt(end)-T tt(end)];
else
    hAx.XLim = [0 T];
end

% hAvgLine = data.Panel.Wave.Comp.hPlotObj.AvgLine;
% yAvg = mean(yy);
% set(hAvgLine, 'XData', hAx.XLim, 'YData', [yAvg yAvg]);

hRect = data.Panel.Wave.Comp.hPlotObj.WaveRect;
x1 = hAx.XLim(1);
x2 = hAx.XLim(2);

if tt(end) > 5
    % WaveRect init
    if ~bWaveRectInit
        bWaveRectInit = 1;
        y_WaveRect(1) = 0;
        y_WaveRect(2) = (max(yy)+min(yy))/2-baseLine;
        hRect.Position = [x1 y_WaveRect(1) x2-x1 diff(y_WaveRect)];
        hRect.Visible = 'on';

        pos = hRect.Position;

        YLim = hAx.YLim;
        hgPatch = data.Panel.Bar.Comp.hPlotObj.gPatch;
        hrPatch = data.Panel.Bar.Comp.hPlotObj.rPatch;
        set(hgPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2) ]);
        set(hrPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2)+pos(4) YLim(2) YLim(2) pos(2)+pos(4)]);
    end
    hRect.Position(1) =x1;
    hRect.Position(3) = x2-x1;
        
    % bar
    hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
    hBar = data.Panel.Bar.Comp.hPlotObj.Bar;

    hAx2.XLim = [0 1];
    hAx2.YLim = hAx.YLim;
     
    x1 = 0.1;
    x2 = 1-x1;
    
    y1B = yy(end) - baseLine;
    hB = diff(hAx2.YLim)/20;
    hBar.Position = [x1 y1B x2-x1 hB];
    
end