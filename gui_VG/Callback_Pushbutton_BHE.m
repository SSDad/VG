function Callback_Pushbutton_BHE(src, evnt)

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hBHC = data.Panel.BHC.hPanel;
hBH = data.Panel.BH.Comp.Togglebutton.BH;
if strcmp(hBHC.Visible, 'off')
    hBHC.Visible = 'on';
    hBH.Visible = 'on';
else
    hBHC.Visible = 'off';
    hBH.Visible = 'off';
end