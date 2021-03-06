function updateWave

global hFig
global tt yy 
global baseLine
global TimeRange extT pps
global bBHStart bBHReset t0 tC tE BHC
global tsd_prev tE_sd

%% wave
data = guidata(hFig);
hAx = data.Panel.Wave.Comp.hAxis.Wave;
hWave = data.Panel.Wave.Comp.hPlotObj.Wave;

% hRadioM = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Manual;
hRadioAuto = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Auto;

hBHC = data.Panel.BHC.Comp.Edit.Counter;
hBH = data.Panel.BH.Comp.Togglebutton.BH;

dt = 1/pps;
nP = round(TimeRange/dt);

idx1 = max(length(yy)-nP, 1);
set(hWave, 'XData', tt(idx1:end), 'YData', yy(idx1:end)-baseLine);

xMax = max(tt(end)+extT, TimeRange+extT);
xMin = xMax - TimeRange - extT;
hAx.XLim = [xMin xMax];

if hRadioAuto.Value
    yMax = max(yy(idx1:end));
    yMin = min(yy(idx1:end));
    yB = (yMax-yMin)/10;
    y1 = yMin-yB;
    y2 = yMax+yB;
    
    y2 = max(y2-baseLine, 1);
    y1 = min(y1-baseLine, -0.1);
    hAx.YLim = [y1 y2];
    data.Panel.Param.Comp.subPanel.VLimit.Edit.High.String = num2str(y2, '%.2f');
    data.Panel.Param.Comp.subPanel.VLimit.Edit.Low.String = num2str(y1, '%.2f');
end

    % bar
    hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
    hBar = data.Panel.Bar.Comp.hPlotObj.Bar;

    y1B = yy(end) - baseLine;
    hB = diff(hAx2.YLim)/20;
    hBar.Position(2) = y1B;
    hBar.Position(4) = hB;
    
%% update BHC
if (bBHReset )
    bBHStart = 0;
    bBHReset = 0;
    hBH.String = 'Start';
    hBH.ForegroundColor = 'g';
    hBH.BackgroundColor = [1 1 1]*0.25;
    hBHC.String = num2str(tC, '%0.0f');
end

if (bBHStart )
    if(tE < tC)
        tE = toc(t0);
        hBHC.String = num2str(abs(tC-tE), '%0.0f');
    else
        hBH.String = 'Start';
        hBH.ForegroundColor = 'g';
        hBH.BackgroundColor = [1 1 1]*0.25;
        hBHC.String = num2str(BHC, '%0.0f');
    end
end

%% auto save data
if tt(end) - tsd_prev > tE_sd    
    tsd_prev = tt(end);
        
    % save wave
    fd_VG = data.fd_VG;
    
    MRN = data.Panel.PtInfo.Comp.Edit.MRN.String;
    fd_MRN = fullfile(fd_VG, MRN);
    if ~exist(fd_MRN, 'dir')
        mkdir(fd_MRN);
    end
    
    Fraction = data.Panel.PtInfo.Comp.Edit.Fraction.String;
    datafn = fullfile(fd_MRN, ['Wave_', MRN, '_F', Fraction, '_', datestr(now,'YYYYmmDD'), '.mat']);
    save(datafn, 'tt', 'yy', 'baseLine');
    
%     display(tt(end));
%     display(MRN);
%     display(Fraction);
    
end