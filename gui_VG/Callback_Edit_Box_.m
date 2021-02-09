function Callback_Edit_Box_(src, evnt)

% global boxHi boxLo 
global boxAlpha
global y_WaveRect

hFig = ancestor(src, 'Figure');
data = guidata(hFig);

hW = data.Panel.Wave.Comp.hPlotObj.Wave;
hBox = data.Panel.Wave.Comp.hPlotObj.WaveRect;
hPatch = data.Panel.Bar.Comp.hPlotObj.gPatch;
% hAx = data.Panel.Wave.Comp.hAxis.Wave;
% hAx2 = data.Panel.Bar.Comp.hAxis.Bar;
if strcmp(src.Tag, 'LW')
    LW = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.LW.String);
    hW.LineWidth = LW;
elseif strcmp(src.Tag, 'BoxHi')
     y_WaveRect(2) = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.BoxHi.String);
     hBox.Position(4) = y_WaveRect(2) - hBox.Position(2);
    
     set(hPatch, 'XData', [0 1 1 0 ], 'YData', [y_WaveRect(1) y_WaveRect(1) y_WaveRect(2) y_WaveRect(2)]);

elseif strcmp(src.Tag, 'BoxLo')
    y0 = hBox.Position(2);
    y_WaveRect(1) = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.BoxLo.String);
    hBox.Position(2) = y_WaveRect(1);
    hBox.Position(4) = y0 - y_WaveRect(1) + hBox.Position(4);

     set(hPatch, 'XData', [0 1 1 0 ], 'YData', [y_WaveRect(1) y_WaveRect(1) y_WaveRect(2) y_WaveRect(2)]);
elseif strcmp(src.Tag, 'BoxAlpha')
    boxAlpha = str2double(data.Panel.Param.Comp.subPanel.Box.Edit.alpha.String);
    hBox.FaceAlpha = boxAlpha;
end
