function test_timer

global dyn
global tt yy
global tmr

tt = [];
yy = [];

%% 
vernierToolPath = fullfile(fileparts(pwd), 'vernier-toolbox-master');
addpath(vernierToolPath);
dyn = dynamometer;
dyn.start;

%% timer
tmr = timer;

tmr.StartFcn = @fun_tmrStart;
tmr.TimerFcn = @fun_tmr;
tmr.StopFcn = @fun_tmrStop;

tmr.Period = 0.1;
tmr.TasksToExecute = 12*60*60/0.1;
tmr.ExecutionMode = 'fixedRate';
start(tmr)
wait(tmr)

% delete(tmr)
figure(1), clf
plot(yy)