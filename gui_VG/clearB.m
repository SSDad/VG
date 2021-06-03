function clearB

global hFig2
global ampAvgB

data2 = guidata(hFig2);

set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'XData', [], 'YData', []);

for n = [2 3 4 6]
    data2.Panel.ParamB.Comp.Text.Param(n).Name(3).String = '';
end

for n = 1:6
    data2.Panel.ParamB.Comp.Text.Param(n).Name(2).String = '';
end

data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'off';

for n = 1:3
    data2.Panel.ViewB.Comp.hPlotObj.BoxText(n).String = '';
end

ampAvgB = [];
data2.Panel.ParamBRaw.Comp.Text.Param.Name(2).String = ''; 

data2.Panel.ParamBNorm.Comp.Text.Param(2).Name(2).String = '';
data2.Panel.ParamBNorm.Comp.Text.Param(2).Name(3).String = '';
data2.Panel.ParamBNorm.Comp.Text.Param(3).Name(2).String = '';
data2.Panel.ParamBNorm.Comp.Text.Param(3).Name(3).String = '';

data2.Panel.ParamBPeriod.Comp.Text.Param(2).Name(2).String = '';
data2.Panel.ParamBPeriod.Comp.Text.Param(2).Name(3).String = '';

data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = '';