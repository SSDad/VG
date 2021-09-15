function Callback_Pushbutton_RecoverCalib(src, evnt)

global hFig
global bEmu
global baseLine

data = guidata(hFig);

if bEmu
    baseLine = 100+rand(1);
    msg{1} = '            Barometer calibration is virtually loaded...';
else
    fd_VG = data.fd_VG;
    datafn = fullfile(fd_VG, 'BaseLine.mat');
    load(datafn);
end

bDevice = 1;
msg{1} = '            Barometer calibration is loaded...';
msg{2} = '';
msgColor = 'g';

[hMB] = fun_messageBox('Calibration', msg, msgColor);

if bDevice
    data.Panel.Calib.Comp.Text.CalibValue.String = [num2str(baseLine, '%0.2f'), ' kPa'];

    data.Panel.PtInfo.hPanel.Visible = 'on';
    data.Panel.Collect.hPanel.Visible = 'on';
    data.Panel.WaveBar.hPanel.Visible = 'on';
    data.Panel.ParamButton.hPanel.Visible = 'on';
    data.Panel.TextButton.hPanel.Visible = 'on';
    data.Panel.Analysis.hPanel.Visible = 'on';
end

% data.Panel.Calib.hPanel.Visible = 'off';
% data.Panel.BH.hPanel.Visible = 'on';
% data.Panel.BHC.hPanel.Visible = 'on';
% data.Panel.Param.Comp.subPanel.Time.hPanel.Visible = 'on';
% data.Panel.Param.Comp.subPanel.WaveBar.hPanel.Visible = 'on';
% data.Panel.Collect.hPanel.Visible = 'on';