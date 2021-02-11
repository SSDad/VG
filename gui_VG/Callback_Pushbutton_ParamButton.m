function Callback_Pushbutton_ParamButton(src, evnt)

% global bCollecting

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hParam = data.Panel.Param.hPanel;
hCalib = data.Panel.Calib.hPanel;
if strcmp(hParam.Visible, 'off')
    hParam.Visible = 'on';
%     if ~bCollecting
%         hCalib.Visible = 'on';
%     end
else
    hParam.Visible = 'off';
%     hCalib.Visible = 'off';
end