function Callback_Togglebutton_Collect(src, evnt)

global hFig
global yy
global dyn
global tsd_prev

global tmr
global BHC

global tmrSaveData

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

    src.String = 'Stop';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;

    % create dynamometer object
    if ~isvalid(dyn)
        dyn = dynamometer;
    end

    % start recording
    dyn.start;
%     tt = [];
    yy = [];

    pause(0.1);
    start(tmr);
%     wait(tmr);

start(tmrSaveData);

%     while 1
%         pause(dt);
%         % update internal buffer and return last value
%         if isvalid(dyn)
%             tt = [tt etime(clock, tStart)];
%             yy = [yy dyn.read+baseLine]; 
%             % display
%             updateWave;
%         else
%             break;
%         end
%     end
else
    stop(tmr)

    stop(tmrSaveData);
    saveData;
    
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
    hBHC.String = num2str(BHC, '%0.0f');
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