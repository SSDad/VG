function fun_tmrBHStop(src, evnt)

global hFig
global hBH hBHC BHC
data = guidata(hFig);

    hBHC.String = num2str(BHC, '%0.0f');

    hBH.String = 'Start';
    hBH.ForegroundColor = 'g';
    hBH.BackgroundColor = [1 1 1]*0.25;
    
    data.Panel.Collect.Comp.Togglebutton.Collect.Enable = 'on';