function fun_tmr(src, evnt)

global dyn
global yy
global avgNP

s = dyn.read;
s = mean([yy(end-avgNP+2:end) s]);
yy = [yy s];

updateWave;