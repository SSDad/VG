function Callback_Pushbutton_ThreshSetting(src, evnt)

global hFig_ThreshSetting

if strcmp(hFig_ThreshSetting.Visible, 'on')
    hFig_ThreshSetting.Visible = 'off';
else
    hFig_ThreshSetting.Visible = 'on';
end