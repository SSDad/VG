function Callback_Togglebutton_Collect(src, evnt)

global hFig
global tt yy tStart
global dyn
global baseLine
global bWaveRectInit;
global bBHStart bBHReset tC

str = src.String;
data = guidata(hFig);
global bCollecting

hBHC = data.Panel.BHC.Comp.Edit.Counter;
hBH = data.Panel.BH.Comp.Togglebutton.BH;

if strcmp(str, 'Go')
    data.Panel.BH.hPanel.Visible = 'on';

    bCollecting = 1;
    data.Panel.Calib.hPanel.Visible = 'off'; % disable calib 

    bBHStart = 0;
    bBHReset = 0;
    
    bWaveRectInit = 0;
    data.Panel.Wave.Comp.hPlotObj.WaveRect.Position = [0 0 0 0];

    
    src.String = 'Stop';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;

    % create dynamometer object
    if ~isvalid(dyn)
        dyn = dynamometer;
    end

    dt = data.WaveParam.dt;

    % start recording
    dyn.start;
    tt = [];
    yy = [];
    tStart = clock;

    while 1
        pause(dt);
        % update internal buffer and return last value
        if isvalid(dyn)
            tt = [tt etime(clock, tStart)];
            yy = [yy dyn.read+baseLine]; 
            % display
            updateWave;
        else
            break;
        end
    end
else

    if isvalid(dyn)
        dyn.stop;
        dyn.delete;
    end
    
    bCollecting = 0;
    if data.Panel.Param.hPanel.Visible == 'on'
        data.Panel.Calib.hPanel.Visible = 'on'; % disable calib 
    end
   
    hBH.String = 'Start';
    hBH.ForegroundColor = 'g';
    hBH.BackgroundColor = [1 1 1]*0.25;
    hBHC.String = num2str(tC, '%0.0f');
    data.Panel.BH.hPanel.Visible = 'off';
    
    src.String = 'Go';
    src.ForegroundColor = 'g';
    src.BackgroundColor = [1 1 1]*0.25;
    
    fd_VG = data.fd_VG;
    
    MRN = data.Panel.PtInfo.Comp.Edit.MRN.String;
    fd_MRN = fullfile(fd_VG, MRN);
    if ~exist(fd_MRN, 'dir')
        mkdir(fd_MRN);
    end
    
    Fraction = data.Panel.PtInfo.Comp.Edit.Fraction.String;
    datafn = fullfile(fd_MRN, ['data_MRN-', MRN, '_Fraction-', Fraction, '_DT-', datestr(tStart,'YYYYmmDD-HHMMSS'), '-',...
        datestr(now,'HHMMSS'), '_TE_', num2str(round(range(tt))), '.mat']);
    save(datafn, 'tt', 'yy', 'baseLine');
   
end