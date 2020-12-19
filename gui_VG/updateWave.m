function updateWave

global hFig hFig2
global tt yy 
global baseLine

%% wave
data = guidata(hFig);
hAx = data.Panel.View.Comp.hAxis.Wave;
hWave = data.Panel.View.Comp.hPlotObj.Wave;
set(hWave, 'XData', tt, 'YData', yy);

T = data.WaveParam.T;
if tt(end) > T
    hAx.XLim = [tt(end)-T tt(end)];
else
    hAx.XLim = [0 T];
end

hAvgLine = data.Panel.View.Comp.hPlotObj.AvgLine;

yAvg = mean(yy);
set(hAvgLine, 'XData', hAx.XLim, 'YData', [yAvg yAvg]);


%% bar
if tt(end) > 10
    data2 = guidata(hFig2);
    hAx2 = data2.Panel.Bar.Comp.hAxis.Bar;
    hBar = data2.Panel.Bar.Comp.hPlotObj.Bar;
    hgPatch = data2.Panel.Bar.Comp.hPlotObj.gPatch;
    hrPatch = data2.Panel.Bar.Comp.hPlotObj.rPatch;

    hAx2.XLim = [0 1];
    hAx2.YLim = [min(yy) max(yy)];
     
%     x0 = 0;
%     y0 = mean(yy)-range(yy)/2;
    x1 = 0.1;
    x2 = 1-x1;
    
    hBar.Position = [x1 yy(end)-range(yy)/20/2 x2-x1 range(yy)/20];
    set(hgPatch, 'XData', [0 0 1 1 ], 'YData', [min(yy) yAvg yAvg min(yy)]);
    set(hrPatch, 'XData', [0 0 1 1 ], 'YData', [yAvg max(yy)  max(yy) yAvg ]);
    
end