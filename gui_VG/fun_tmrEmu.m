function fun_tmrEmu(src, evnt)

global yy pps
global tmrBH

% tmrBH.Running
if strcmp(tmrBH.Running, 'off')
    t = src.TasksExecuted/pps;
    s = sin(t/4*pi*2-pi/2)/2+0.5;
else
    s = yy(end);
end
yy = [yy s];

updateWave;