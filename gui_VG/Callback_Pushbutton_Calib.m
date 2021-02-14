function Callback_Pushbutton_Calib(src, evnt)

global hFig
global bEmu
global dyn
global baseLine

data = guidata(hFig);

bDevice = 1;
msg{1} = 'Bingo!';
msg{2} = 'Barometer calibration is done.';
msgColor = 'g';
if bEmu
    baseLine = 100+rand(1);
    msg{2} = 'Barometer calibration is viutually done.';
else
    if exist('dyn')
        if ~isempty(dyn)
            if isvalid(dyn)
                dyn.delete;
            end
        end
    end

    try
        dyn = dynamometer;
    catch
        bDevice = 0;
        msg{1} = 'Ehh...';
        msg{2} = 'GoLink is not connected...';
        msgColor = 'r';
    end
    if bDevice
        baseLine = dyn.baseline;
    end
end
[hMB] = fun_messageBox('Calibration', msg, msgColor);

if bDevice
    data.Panel.Calib.Comp.Text.CalibValue.String = [num2str(baseLine, '%0.2f'), ' kPa'];

    data.Panel.PtInfo.hPanel.Visible = 'on';
    data.Panel.Collect.hPanel.Visible = 'on';
    data.Panel.WaveBar.hPanel.Visible = 'on';
    data.Panel.ParamButton.hPanel.Visible = 'on';
    data.Panel.Analysis.hPanel.Visible = 'on';
end

% data.Panel.Calib.hPanel.Visible = 'off';
% data.Panel.BH.hPanel.Visible = 'on';
% data.Panel.BHC.hPanel.Visible = 'on';
% data.Panel.Param.Comp.subPanel.Time.hPanel.Visible = 'on';
% data.Panel.Param.Comp.subPanel.WaveBar.hPanel.Visible = 'on';
% data.Panel.Collect.hPanel.Visible = 'on';