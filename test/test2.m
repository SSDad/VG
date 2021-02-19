clearvars

vernierToolPath = fullfile(fileparts(pwd), 'vernier-toolbox-master');
addpath(vernierToolPath);

% trial duration
T  = 3600 ; % in s
pps = 20;
dt = 1/pps; % display refresh lag

% create dynamometer object
d=dynamometer;

% start recording
d.start;
tic

% time loop
for i=1:round(T*pps) 
    if mod(i, 60*pps) == 0
        junk = T/60 - i/60/pps;
        display([num2str(junk), ' min left']);
    end
    pause(dt);
    w(i) = d.read; 
end

% stop recording and get the buffer
% alternative use: d.stop; timeseries = d.get_buffer ;
d.stop; 
% w = d.get_buffer;

save('wave', 'w');

% cleaning
clear d