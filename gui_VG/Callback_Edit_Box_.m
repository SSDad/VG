function Callback_Edit_Box_(src, evnt)

global boxLW boxAlpha

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hB = data.Panel.Wave.Comp.hPlotObj.WaveRect;
% hAx = data.Panel.Wave.Comp.hAxis.Wave;
% hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
if strcmp(src.Tag, 'BoxLW')
    boxLW = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.LW.String);
    hB.LineWidth = boxLW;
elseif strcmp(src.Tag, 'BoxAlpha')
    boxAlpha = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.alpha.String);
    hB.FaceAlpha = boxAlpha;
elseif strcmp(src.Tag, 'BoxH')
    hRect = data.Panel.Wave.Comp.hPlotObj.WaveRect;
    hRect.Position(4) = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.BoxH.String);
end
