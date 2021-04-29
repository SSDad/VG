function updateLAVBoxBHText

global LAVBoxBH 
% periodBAll pps % all previous wave y and period
global hFig2

data2 = guidata(hFig2);

yp(1) = LAVBoxBH.y1;
yp(2) = LAVBoxBH.y2;
yp(3) = (yp(1) + yp(2))/2;
yp(4) = yp(1)-0.1;

xp(1:3) = LAVBoxBH.x2;
xp(4) = (LAVBoxBH.x1 + LAVBoxBH.x2)/2;

ytxt{1} =  num2str(yp(1), 2);
ytxt{2} =  num2str(yp(2), 2);
ytxt{3} = num2str(yp(2) - yp(1), 2);
junk = LAVBoxBH.x2 - LAVBoxBH.x1;
ytxt{4} = [num2str(junk, 3), 's'];
for n = 1:4
    data2.Panel.ViewBH.Comp.hPlotObj.BoxText(n).Position = [xp(n) yp(n)];
    data2.Panel.ViewBH.Comp.hPlotObj.BoxText(n).String = ytxt{n};
    data2.Panel.ViewBH.Comp.hPlotObj.BoxText(n).Visible = 'on';
end