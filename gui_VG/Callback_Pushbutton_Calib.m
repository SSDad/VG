function Callback_Pushbutton_Calib(src, evnt)

global hFig
global dyn
global baseLine

str = src.String;

if exist('dyn')
    if ~isempty(dyn)
        if isvalid(dyn)
            dyn.delete;
        end
    end
end

dyn = dynamometer;
baseLine = dyn.baseline;

data = guidata(hFig);
data.Panel.Calib.Comp.Text.CalibValue.String = [num2str(baseLine, '%0.2f'), ' kPa'];

data.Panel.PtInfo.hPanel.Visible = 'on';
data.Panel.Collect.hPanel.Visible = 'on';
data.Panel.WaveBar.hPanel.Visible = 'on';
data.Panel.BH.hPanel.Visible = 'on';
data.Panel.BHC.hPanel.Visible = 'on';
data.Panel.ParamButton.hPanel.Visible = 'on';
data.Panel.Param.hPanel.Visible = 'on';

% data.Panel.Param.Comp.subPanel.Time.hPanel.Visible = 'on';
% data.Panel.Param.Comp.subPanel.WaveBar.hPanel.Visible = 'on';

% data.Panel.Collect.hPanel.Visible = 'on';