function Callback_Pushbutton_Analysis(src, evnt)

global hFig2

if strcmp(hFig2.Visible, 'on')
    hFig2.Visible = 'off';
else
    hFig2.Visible = 'on';
end