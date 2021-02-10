function fun_tmr(src, evnt)

global dyn
global yy

s = dyn.read; 
yy = [yy s];

updateWave;

% if length(yy) > 30
%     fun_stopTimer(src);
% end
