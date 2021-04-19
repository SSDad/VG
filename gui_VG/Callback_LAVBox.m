function Callback_LAVBox(src, evnt)

global hFig2
global LAVBox

data2 = guidata(hFig2);
pos = src.Position;
LAVBox.y1 = pos(2);
LAVBox.y2 = pos(2)+pos(4);

yp(1) = LAVBox.y1;
yp(2) = LAVBox.y2;
yp(3) = (yp(1) + yp(2))/2;
yt = yp;
yt(3) = yp(2) - yp(1);
for n = 1:3
    data2.Panel.ViewB.Comp.hPlotObj.BoxText(n).Position = [data2.Panel.ViewB.Comp.hAxis.ViewB.XLim(2) yp(n)];
    data2.Panel.ViewB.Comp.hPlotObj.BoxText(n).String = num2str(yt(n), 2);
end

% data2.Panel.ViewB.Comp.hPlotObj.TextRect.Position = [data2.Panel.ViewB.Comp.hAxis.ViewB.XLim(2) yp(3) 0.2 0.2];

updateLAVBoxParam;