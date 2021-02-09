function fun_tmrStop(src, evnt)

global dyn

disp('Bingo!');

dyn.stop;
dyn.delete;

disp('dyn deleted...');