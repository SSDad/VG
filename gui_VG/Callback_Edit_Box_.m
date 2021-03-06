function Callback_Edit_Box_(src, evnt)

global boxAlpha

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hW = data.Panel.Wave.Comp.hPlotObj.Wave;
hBox = data.Panel.Wave.Comp.hPlotObj.WaveRect;
hgRect = data.Panel.Bar.Comp.hPlotObj.gRect;
% hAx = data.Panel.Wave.Comp.hAxis.Wave;
% hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
if strcmp(src.Tag, 'LW')
    LW = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.LW.String);
    hW.LineWidth = LW;
elseif strcmp(src.Tag, 'BoxHi')
    pos = hBox.Position;
    y2 = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.BoxHi.String);
    hBox.Position(4) = y2 - pos(2);
    hgRect.Position = hBox.Position;
elseif strcmp(src.Tag, 'BoxLo')
    pos = hBox.Position;
    y2 = pos(2)+pos(4);
    y1 = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.BoxLo.String);
    hBox.Position(2) = y1;
    hBox.Position(4) = y2-y1;
    hgRect.Position = hBox.Position;
elseif strcmp(src.Tag, 'BoxAlpha')
    boxAlpha = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.alpha.String);
    hBox.FaceAlpha = boxAlpha;
end
