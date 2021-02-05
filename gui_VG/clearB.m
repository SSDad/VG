function clearB

global hFig2

data2 = guidata(hFig2);

set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'XData', [], 'YData', []);

for n = [2 3 4 6]
    data2.Panel.ParamB.Comp.Text.Param(n).Name(3).String = '';
end

for n = 1:6
    data2.Panel.ParamB.Comp.Text.Param(n).Name(2).String = '';
end

data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'off';
