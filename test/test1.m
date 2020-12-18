clearvars

vernierToolPath = fullfile(fileparts(pwd), 'vernier-toolbox-master');
addpath(vernierToolPath);

% addpath('D:\Zhen\Box Sync\Taeho\VG\vernier-toolbox-master');

% dyn = dynamometer;
% create a dynamometer handle and connect to the device

% dyn.start;
% % start recording
% 
% dyn.read;
% % update the internal buffer and return the current value
% 
% dyn.stop;

% minimal example




% trial duration
T  = 5 ; % in s
dt = 0.01 ; % display refresh lag

% display
figure; hold on;
xlim([0 T])
ylim([-5 10])

% create dynamometer object
d=dynamometer;

% start recording
d.start;
tic

% time loop
for i=1:round(T/dt) 
    pause(dt);
    % update internal buffer and return last value
    f = d.read; 
    % display
    plot(toc,f,'r.'); 
end

% stop recording and get the buffer
% alternative use: d.stop; timeseries = d.get_buffer ;
d.stop; 
timeseries = d.get_buffer;

% plot at full resolution (200Hz)
plot((0:numel(timeseries)-1)/200,timeseries,'k') ; 

% cleaning
clear d