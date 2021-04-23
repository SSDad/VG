function updateLAVBoxText

global LAVBox periodBAll pps % all previous wave y and period
global hFig2
data2 = guidata(hFig2);

% LAVBox text
yp(1) = LAVBox.y1;
yp(2) = LAVBox.y2;
yp(3) = (yp(1) + yp(2))/2;
yp(4) = data2.Panel.ViewB.Comp.hAxis.ViewB.YLim(1) - 0.1;
yp(5) =data2.Panel.ViewB.Comp.hAxis.ViewB.YLim(1) + 0.2;
yp(6) = yp(5) - 0.1;

xp(1:3) = data2.Panel.ViewB.Comp.hAxis.ViewB.XLim(2);
xp(4) = data2.Panel.ViewB.Comp.hAxis.ViewB.XLim(1) + 50;
xp(5) = xp(4) - 48;
xp(6) = xp(5);

txt{1} = num2str(yp(1), 2);
txt{2} = num2str(yp(2), 2);
txt{3} = [num2str(yp(2) - yp(1), 2)];

pA = periodBAll;
PD = mean(pA)/pps;
junk = abs(pA-mean(pA))/pps;
PV = sum(junk)/numel(pA);
txt{4} =  ['Period-', num2str(PD, 2), 's'];
txt{5} =  ['Period Variation Mean-', num2str(PV, 2), 's'];
txt{6} =  ['Period Variation STD-', num2str(std(junk), 2), 's'];

for n = 1:6
    data2.Panel.ViewB.Comp.hPlotObj.BoxText(n).Position = [xp(n) yp(n)];
    data2.Panel.ViewB.Comp.hPlotObj.BoxText(n).String = txt{n};
    data2.Panel.ViewB.Comp.hPlotObj.BoxText(n).Visible = 'on';
end