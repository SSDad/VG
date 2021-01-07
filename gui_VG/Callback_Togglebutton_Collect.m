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
    data.Panel.BHC.hPanel.Visible = 'on';

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
   
    data.Panel.BH.hPanel.Visible = 'off';
    data.Panel.BHC.hPanel.Visible = 'off';
    hBH.String = 'Start';
    hBH.ForegroundColor = 'g';
    hBH.BackgroundColor = [1 1 1]*0.25;
    hBHC.String = num2str(tC, '%0.0f');
    
    src.String = 'Go';
    src.ForegroundColor = 'g';
    src.BackgroundColor = [1 1 1]*0.25;
    
    % save data
    fd_VG = fullfile(tempdir, 'VG');
    if ~exist(fd_VG, 'dir')
    %     [matFile, dataPath] = uigetfile('*.mat');
        mkdir(fd_VG);
    end
    
    MRN = data.Panel.PtInfo.Comp.Edit.MRN.String;
    Fraction = data.Panel.PtInfo.Comp.Edit.Fraction.String;
    datafn = fullfile(fd_VG, ['data_MRN', MRN, '_Fraction', Fraction, '_', datestr(tStart,'YYYYmmDD_HHMMSS'), '-',...
        datestr(now,'HHMMSS'), '_', num2str(round(range(tt))), 's.mat']);
    save(datafn, 'tt', 'yy', 'baseLine');
   
end