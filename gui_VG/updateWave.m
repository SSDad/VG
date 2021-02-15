function updateWave

global hFig
global tt yy pps
global TimeRange extT

%% wave
data = guidata(hFig);
hAx = data.Panel.Wave.Comp.hAxis.Wave;
hWave = data.Panel.Wave.Comp.hPlotObj.Wave;

% hRadioM = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Manual;
hRadioAuto = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Auto;

dt = 1/pps;
tt = (1:length(yy))*dt - dt;

nP = round(TimeRange/dt);

idx1 = max(length(yy)-nP, 1);
set(hWave, 'XData', tt(idx1:end), 'YData', yy(idx1:end));

xMax = max(tt(end)+extT, TimeRange+extT);
xMin = xMax - TimeRange - extT;
hAx.XLim = [xMin xMax];

if hRadioAuto.Value
    yMax = max(yy(idx1:end));
    yMin = min(yy(idx1:end));
    yB = (yMax-yMin)/10;
    y1 = yMin-yB;
    y2 = yMax+yB;
    
    y2 = max(y2, 1);
    y1 = min(y1, -0.1);
    hAx.YLim = [y1 y2];
    data.Panel.Param.Comp.subPanel.VLimit.Edit.High.String = num2str(y2, '%.2f');
    data.Panel.Param.Comp.subPanel.VLimit.Edit.Low.String = num2str(y1, '%.2f');
end

    %% bar
    hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
    hBar = data.Panel.Bar.Comp.hPlotObj.Bar;

    y1B = yy(end);
    hB = diff(hAx2.YLim)/20;
%     hBar.Position = [x1 y1B x2-x1 hB];
    hBar.Position(2) = y1B;
    hBar.Position(4) = hB;