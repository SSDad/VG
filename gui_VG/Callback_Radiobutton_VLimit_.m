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

% if data.Panel.Selection.Comp.Radiobutton.Diaphragm.Value
%     data.Panel.Body.hPanel.Visible = 'off';
%     data.Panel.Snake.hPanel.Visible = 'on';
%     data.Panel.Point.hPanel.Visible = 'on';
% 
%     data.Panel.View.Comp.hPlotObj.AbRect.Visible = 'off';
%     data.Panel.View.Comp.hPlotObj.AbRectCLine.Visible = 'off';
% else
%     data.Panel.Snake.hPanel.Visible = 'off';
%     data.Panel.Point.hPanel.Visible = 'off';
%     data.Panel.Body.hPanel.Visible = 'on';
%     
%     if exist(data.FileInfo.ffn_AbsContour, 'file')
%         data.Panel.Body.Comp.Pushbutton.LoadContour.Enable = 'on';
%     end
% 
% end