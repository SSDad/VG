function Callback_Popup_Mode(src, evnt)

global bEmu
global tmr

iMode = src.Value;
if iMode == 1
    bEmu = 0;
    tmr.TimerFcn = @fun_tmr;
else
    bEmu = 1;
    tmr.TimerFcn = @fun_tmrEmu;
end


