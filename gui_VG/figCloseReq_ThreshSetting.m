function figCloseReq_ThreshSetting(src, evnt)

figHandles = get(0, 'Children');

if strcmp(src.Visible, 'off')
    src.Visible = 'on';
else
    src.Visible = 'off';
end