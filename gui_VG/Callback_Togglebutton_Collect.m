function Callback_Togglebutton_Collect(src, evnt)

global bEmu
global hFig
global yy
global avgNP

global tmr
global BHC
global tmrSaveData

global dyn

global startTime

str = src.String;
data = guidata(hFig);

hBHC = data.Panel.BHC.Comp.Edit.Counter;
hBH = data.Panel.BH.Comp.Togglebutton.BH;

if strcmp(str, 'Go')
    startTime = datestr(now, 'YYYYmmDD_HHMMSS');
    
    data.Panel.Wave.Comp.hPlotObj.WaveRect.Visible = 'on';
    data.Panel.BH.hPanel.Visible = 'on';
    data.Panel.BH.Comp.Togglebutton.BH.Visible = 'off';
    data.Panel.Calib.Comp.Pushbutton.Calib.Enable = 'off'; % disable calib 
    data.Panel.Calib.Comp.Pushbutton.Recover.Enable = 'off';  
    data.Panel.Mode.Comp.PopUpMenu.Mode.Enable = 'off'; % disable mode 
    data.Panel.Analysis.hPanel.Visible = 'off'; % disable analysis
    data.Panel.Param.Comp.subPanel.pps.Edit.pps.Enable = 'off'; % disable calib 

    src.String = 'Stop';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;

    if ~bEmu
        % create dynamometer object
        if ~isvalid(dyn)
            dyn = dynamometer;
        end
        dyn.start;      % start recording
    end
    yy = zeros(1, avgNP-1);
    pause(0.1);
    start(tmr);
    start(tmrSaveData);
else
    stop(tmr)
    stop(tmrSaveData);
    saveData;
    msg{1} = '         Data has been saved successfully...';
    msg{2} = ' ';
    msgColor = 'g';
    [hMB_saveData] = fun_messageBox('Save Data', msg, msgColor);
    
    if ~bEmu
        if isvalid(dyn)
            dyn.stop;
            dyn.delete;
        end
    end
    
    data.Panel.Calib.Comp.Pushbutton.Calib.Enable = 'on'; % disable calib
    data.Panel.Calib.Comp.Pushbutton.Recover.Enable = 'on'; % disable calib
    data.Panel.Mode.Comp.PopUpMenu.Mode.Enable = 'on'; % disable mode
    data.Panel.Param.Comp.subPanel.pps.Edit.pps.Enable = 'on'; % disable calib 

    hBH.String = 'Start';
    hBH.ForegroundColor = 'g';
    hBH.BackgroundColor = [1 1 1]*0.25;
    hBHC.String = num2str(BHC, '%0.0f');
    data.Panel.BH.hPanel.Visible = 'off';
    data.Panel.BHC.hPanel.Visible = 'off';

    if ~bEmu
        data.Panel.PtInfo.Comp.Edit.MRN.String = 'MRN';
        data.Panel.PtInfo.Comp.Edit.Fraction.String = 'Fx';
    else
        data.Panel.PtInfo.Comp.Edit.MRN.String = 'Demo';
    end
    
    src.String = 'Go';
    src.ForegroundColor = 'g';
    src.BackgroundColor = [1 1 1]*0.25;
    
    data.Panel.Analysis.hPanel.Visible = 'on'; % disable analysis
    
end