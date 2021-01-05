function Callback_Radiobutton_VLimit_(src, evnt)

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hRadioM = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Manual;
hRadioA = data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Auto;
hEditH =  data.Panel.Param.Comp.subPanel.VLimit.Edit.High;
hEditL =  data.Panel.Param.Comp.subPanel.VLimit.Edit.Low;

if strcmp(src.Tag, 'VLimitAuto')
    hRadioA.Value = 1;
    hRadioM.Value = 0;
    
    hEditH.Enable = 'off';
    hEditL.Enable = 'off';
    
else
    hRadioA.Value = 0;
    hRadioM.Value = 1;

    hEditH.Enable = 'on';
    hEditL.Enable = 'on';
end