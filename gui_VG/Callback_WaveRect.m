function Callback_WaveRect(src, evnt)

global hFig
global baseLine

pos = src.Position;

data = guidata(hFig);
YLim = data.Panel.Bar.Comp.hAxis.Bar.YLim;
hgPatch = data.Panel.Bar.Comp.hPlotObj.gPatch;
hrPatch = data.Panel.Bar.Comp.hPlotObj.rPatch;
        set(hgPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2) pos(2)+pos(4) pos(2)+pos(4) pos(2) ]);
        set(hrPatch, 'XData', [0 0 1 1 ], 'YData', [pos(2)+pos(4) YLim(2) YLim(2) pos(2)+pos(4)]);
