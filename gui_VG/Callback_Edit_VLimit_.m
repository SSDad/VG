function Callback_Edit_VLimit_(src, evnt)

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hAx = data.Panel.Wave.Comp.hAxis.Wave;
hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
if strcmp(src.Tag, 'VLimitHigh')
    hAx.YLim(2) = str2double(data.Panel.Param.Comp.subPanel.VLimit.Edit.High.String);
else
    hAx.YLim(1) = str2double(data.Panel.Param.Comp.subPanel.VLimit.Edit.Low.String);
end
hAx2.YLim = hAx.YLim;