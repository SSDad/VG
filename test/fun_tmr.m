function fun_tmr(src, evnt)

global dyn
global yy

s = dyn.read; 

disp(['Fetching ', num2str(s)]);

yy = [yy s];

if length(yy) > 30
    fun_stopTimer(src);
end
