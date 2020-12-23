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
data.Panel.Param.Comp.subPanel.Calib.Text.CalibValue.String = [num2str(baseLine), ' kPa'];

data.Panel.Param.Comp.subPanel.Scale.hPanel.Visible = 'on';
data.Panel.Param.Comp.subPanel.WaveBar.hPanel.Visible = 'on';

data.Panel.Collect.hPanel.Visible = 'on';