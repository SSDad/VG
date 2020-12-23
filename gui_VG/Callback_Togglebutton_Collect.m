function Callback_Togglebutton_Collect(src, evnt)

global hFig
global tt yy tStart
global dyn
global baseLine
global bWaveRectInit;

str = src.String;
data = guidata(hFig);

if strcmp(str, 'Go')
    
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
    
    src.String = 'Go';
    src.ForegroundColor = 'g';
    src.BackgroundColor = [1 1 1]*0.25;
    
    % save data
    fd_VG = fullfile(tempdir, 'VG');
    if ~exist(fd_VG, 'dir')
    %     [matFile, dataPath] = uigetfile('*.mat');
        mkdir(fd_VG);
    end
    datafn = fullfile(fd_VG, ['data_', datestr(tStart,'YYYYmmDD_HHMMSS'), '-',...
        datestr(now,'HHMMSS'), '_', num2str(round(range(tt))), 's.mat']);
    save(datafn, 'tt', 'yy', 'baseLine');
   
end