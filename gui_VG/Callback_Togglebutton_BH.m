function Callback_Togglebutton_BH(src, evnt)

global hFig
global tmrBH

data = guidata(hFig);
data.Panel.BHC.Comp.Edit.Counter;

if strcmp(src.String, 'Start')
    data.Panel.Collect.Comp.Togglebutton.Collect.Enable = 'off';

    src.String = ' X';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;
    start(tmrBH);
else
    stop(tmrBH);
end