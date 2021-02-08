function updateWave

global hFig
global tt yy 
global baseLine
global bWaveRectInit;
global y_WaveRect;
global TimeRange pps
global bBHStart bBHReset t0 tC tE
global tsd_prev tE_sd

%% wave
data = guidata(hFig);
hAx = data.Panel.Wave.Comp.hAxis.Wave;
hWave = data.Panel.Wave.Comp.hPlotObj.Wave;
set(hWave, 'XData', tt, 'YData', yy-baseLine);

% hRadioM = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Manual;
hRadioA = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Auto;

hLW =data.Panel.Param.Comp.subPanel.Box.Edit.LW;
hBoxHi =data.Panel.Param.Comp.subPanel.Box.Edit.BoxHi;
hBoxLo =data.Panel.Param.Comp.subPanel.Box.Edit.BoxLo;
hBHC = data.Panel.BHC.Comp.Edit.Counter;
hBH = data.Panel.BH.Comp.Togglebutton.BH;

T = TimeRange;
extT = T/20;
% T = data.WaveParam.T;
dt = 1/pps;
nP = round(T/dt);
if tt(end) > T
    hAx.XLim = [tt(end)-T tt(end)+extT];
    if length(yy) > nP
        yMax = max(yy(end-nP:end));
        yMin = min(yy(end-nP:end));
    else
        yMax = max(yy);
        yMin = min(yy);
    end
else
        hAx.XLim = [0 T+extT];
        yMax = max(yy);
        yMin = min(yy);
end

yMax = yMax-baseLine;
yMin = yMin-baseLine;
if hRadioA.Value
    yB = (yMax-yMin)/10;
    if yMax>yMin
        hAx.YLim = [yMin-yB yMax+yB];
        data.Panel.Param.Comp.subPanel.VLimit.Edit.High.String = num2str(yMax+yB, '%.2f');
        data.Panel.Param.Comp.subPanel.VLimit.Edit.Low.String = num2str(yMin-yB, '%.2f');
    end
end

% hAvgLine = data.Panel.Wave.Comp.hPlotObj.AvgLine;
% yAvg = mean(yy);
% set(hAvgLine, 'XData', hAx.XLim, 'YData', [yAvg yAvg]);

hRect = data.Panel.Wave.Comp.hPlotObj.WaveRect;
x1 = hAx.XLim(1);
x2 = hAx.XLim(2);
xb = (x2-x1)/10;

if tt(end) > 5
    % WaveRect init
    if ~bWaveRectInit
        bWaveRectInit = 1;
        
        junk(1) = 0;
        junk(2) = (max(yy)+min(yy))/2-baseLine;
        y_WaveRect(1) = min(junk);
        y_WaveRect(2) = max(junk);
        hRect.Position = [x1-xb y_WaveRect(1) x2-x1+xb*2 diff(y_WaveRect)];
        hRect.Visible = 'on';

        pos = hRect.Position;

        YLim = hAx.YLim;
        hgPatch = data.Panel.Bar.Comp.hPlotObj.gPatch;
%         hrPatch = data.Panel.Bar.Comp.hPlotObj.rPatch;
        set(hgPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2) ]);
%         set(hrPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2)+pos(4) YLim(2) YLim(2) pos(2)+pos(4)]);
        
        hBoxLo.String = num2str(pos(2),  '%.2f');
        hBoxHi.String = num2str(pos(2) + pos(4),  '%.2f');
    end
    hRect.Position(1) = x1 - xb;
    hRect.Position(3) = x2-x1+xb*2;
        
    % bar
    hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
    hBar = data.Panel.Bar.Comp.hPlotObj.Bar;

    hAx2.XLim = [0 1];
    hAx2.YLim = hAx.YLim;
     
    x1 = 0.25;
    x2 = 1-x1;
    
    y1B = yy(end) - baseLine;
    hB = diff(hAx2.YLim)/20;
    hBar.Position = [x1 y1B x2-x1 hB];
    
end

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
        hBHC.String = num2str(tC, '%0.0f');
    end
end

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
    
    display(tt(end));
    display(MRN);
    display(Fraction);
    
end