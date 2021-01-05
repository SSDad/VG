function Callback_Pushbutton_ParamButton(src, evnt)

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hParam = data.Panel.Param.hPanel;
hCalib = data.Panel.Calib.hPanel;
if strcmp(hParam.Visible, 'off')
    hParam.Visible = 'on';
    hCalib.Visible = 'on';
else
    hParam.Visible = 'off';
    hCalib.Visible = 'off';
end