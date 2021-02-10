function fun_tmrBH(src, evnt)

global BHC hBHC

hBHC.String = num2str(BHC - src.TasksExecuted, '%0.0f');

% disp(src.TasksExecuted);