function Callback_Edit_pps_(src, evnt)

global pps tmr
TT = 12*60*60;

pps = str2double(src.String);

if pps > 50
    pps = 50;
    src.String = '50';
end

tmr.Period = 1/pps;
tmr.TasksToExecute = TT*pps;
