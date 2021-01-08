function Callback_WaveWin(src, evnt)

global hFig hFig2
pos = src.Position;

data2 = guidata(hFig2);
hAxWave = data2.Panel.Wave.Comp.hAxis.Wave;
hAxWave.XLim = [pos(1) pos(1)+pos(3)];
% 
% YLim = data.Panel.Bar.Comp.hAxis.Bar.YLim;
% hgPatch = data.Panel.Bar.Comp.hPlotObj.gPatch;
% hrPatch = data.Panel.Bar.Comp.hPlotObj.rPatch;
% set(hgPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2) ]);
% set(hrPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2)+pos(4) YLim(2) YLim(2) pos(2)+pos(4)]);
% 
% data.Panel.Param.Comp.subPanel.Box.Edit.BoxHi.String = num2str(pos(2) + pos(4),  '%.2f');
% data.Panel.Param.Comp.subPanel.Box.Edit.BoxLo.String = num2str(pos(2),  '%.2f');

