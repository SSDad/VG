function Callback_Edit_Box_(src, evnt)

global boxHi boxLo boxAlpha

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hW = data.Panel.Wave.Comp.hPlotObj.Wave;
hB = data.Panel.Wave.Comp.hPlotObj.WaveRect;
% hAx = data.Panel.Wave.Comp.hAxis.Wave;
% hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
if strcmp(src.Tag, 'LW')
    LW = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.LW.String);
    hW.LineWidth = LW;
elseif strcmp(src.Tag, 'BoxHi')
     boxHi = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.BoxHi.String);
     hB.Position(4) = boxHi - hB.Position(2);
elseif strcmp(src.Tag, 'BoxLo')
    y0 = hB.Position(2);
    boxLo = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.BoxLo.String);
    hB.Position(2) = boxLo;
    hB.Position(4) = y0 - boxLo + hB.Position(4);
elseif strcmp(src.Tag, 'BoxAlpha')
    boxAlpha = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.alpha.String);
    hB.FaceAlpha = boxAlpha;
end
