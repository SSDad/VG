function fun_tmr(src, evnt)

global dyn
global yy

s = dyn.read;
yy = [yy s];

updateWave;