function Callback_Togglebutton_Collect(src, evnt)

global hFig
global tt yy tStart
global pps
global dyn
global baseLine
% global bWaveRectInit;
global bBHStart bBHReset tC
global tsd_prev

str = src.String;
data = guidata(hFig);
global bCollecting

hBHC = data.Panel.BHC.Comp.Edit.Counter;
hBH = data.Panel.BH.Comp.Togglebutton.BH;

if strcmp(str, 'Go')
    
    data.Panel.Wave.Comp.hPlotObj.WaveRect.Visible = 'on';
    
    data.Panel.BH.hPanel.Visible = 'on';

    bCollecting = 1;
    data.Panel.Calib.Comp.Pushbutton.Calib.Enable = 'off'; % disable calib 
    
    data.Panel.Analysis.hPanel.Visible = 'off'; % disable analysis

    bBHStart = 0;
    bBHReset = 0;
    
%     bWaveRectInit = 0;
%     data.Panel.Wave.Comp.hPlotObj.WaveRect.Position = [0 0 0 0];

    
    src.String = 'Stop';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;

    % create dynamometer object
    if ~isvalid(dyn)
        dyn = dynamometer;
    end

    dt = 1/pps;

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
%     if data.Panel.Param.hPanel.Disable == 'on'
    data.Panel.Calib.Comp.Pushbutton.Calib.Enable = 'on'; % disable calib 
%     end
   
    hBH.String = 'Start';
    hBH.ForegroundColor = 'g';
    hBH.BackgroundColor = [1 1 1]*0.25;
    hBHC.String = num2str(tC, '%0.0f');
    data.Panel.BH.hPanel.Visible = 'off';
    data.Panel.BHC.hPanel.Visible = 'off';
    
    src.String = 'Go';
    src.ForegroundColor = 'g';
    src.BackgroundColor = [1 1 1]*0.25;
    
%     % save wave
tsd_prev = 0;

%     fd_VG = data.fd_VG;
%     
%     MRN = data.Panel.PtInfo.Comp.Edit.MRN.String;
%     fd_MRN = fullfile(fd_VG, MRN);
%     if ~exist(fd_MRN, 'dir')
%         mkdir(fd_MRN);
%     end
%     
%     Fraction = data.Panel.PtInfo.Comp.Edit.Fraction.String;
%     datafn = fullfile(fd_MRN, ['Wave_MRN-', MRN, '_F-', Fraction, '_DT-', datestr(tStart,'YYYYmmDD-HHMMSS'), '-',...
%         datestr(now,'HHMMSS'), '_TE_', num2str(round(range(tt))), '.mat']);
%     save(datafn, 'tt', 'yy', 'baseLine');

    data.Panel.Analysis.hPanel.Visible = 'on'; % disable analysis

end