function Callback_Togglebutton_Collect(src, evnt)

global hFig
global tt yy
global dyn
global baseLine

str = src.String;

if strcmp(str, 'Collect')
    
    src.String = 'Stop';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;
    
    vernierToolPath = fullfile(fileparts(pwd), 'vernier-toolbox-master');
    addpath(vernierToolPath);

    % create dynamometer object
    dyn = dynamometer;
    baseLine = dyn.baseline;

    data = guidata(hFig);
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
    
    src.String = 'Collect';
    src.ForegroundColor = 'g';
    src.BackgroundColor = [1 1 1]*0.25;
end