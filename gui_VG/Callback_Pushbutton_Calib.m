function Callback_Pushbutton_Calib(src, evnt)

global hFig
global bEmu
global dyn
global baseLine

data = guidata(hFig);

bDevice = 1;
msg{1} = '            Barometer calibration is done...';
msg{2} = '';
msgColor = 'g';
if bEmu
    baseLine = 100+rand(1);
    msg{1} = '            Barometer calibration is virtually done...';
    msg{2} = '';
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
        msg{1} = '            Sensor is not connected...';
        msg{2} = '';
        msgColor = 'y';
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