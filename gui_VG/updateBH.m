function updateBH

global hFig2
% global tt yy baseLine dt
global wBH wBHAvg
global LAVBoxBH
global Thresh
global ampAvgB
global paramBH
global yA_mean

data2 = guidata(hFig2);

nBH = length(wBH);
m = 0;
sBH = [];
t2 = [];
for iBox = 1:nBH
    if data2.Panel.TableBH.Comp.Radiobutton.Box(iBox).Value
        m = m+1;
        sBH(m) = iBox; % selected BH
        t2(m) = wBH(iBox).wib.tt(end);
    end
end

if isempty(sBH) % all off
    data2.Panel.ParamBH.Comp.Text.ParamValue(1).String = '';
    data2.Panel.ParamBH.Comp.Text.ParamValue(2).String = '';
    data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = '';
    data2.Panel.ParamBH.Comp.Text.ParamValue(3).String = '';
    data2.Panel.ParamBH.Comp.Text.ParamValueP(3).String = '';
    
    data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Visible = 'off';  
    paramBH.AV = [];
    paramBH.boxH = [];
    
else
    
    x1 = LAVBoxBH.x1;
x2 = LAVBoxBH.x2;
paramBH.Time = x2-x1;
data2.Panel.ParamBH.Comp.Text.ParamValue(1).String = [num2str(x2 - x1, 3), 's'];

boxH = LAVBoxBH.y2-LAVBoxBH.y1;
% boxH = (boxH-yA_mean.min)/range(yA_mean.data);
data2.Panel.ParamBH.Comp.Text.ParamValue(2).String = [num2str(boxH, 3)];
paramBH.boxH = boxH;

if ~isempty(ampAvgB)
    data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = [num2str(boxH*100, 3), '%'];
end

tt2 = min([t2 x2]);
tt1 = max(0, x1);
tt = linspace(tt1, tt2, 1000);

nsBH = length(sBH);
for m = 1:nsBH
    iBox = sBH(m);
    yBHAll(m, :) = interp1( wBH(iBox).wib.tt,  wBH(iBox).wib.yy, tt);
end
yy1B = repmat( LAVBoxBH.y1, size(yBHAll));
yy2B = repmat( LAVBoxBH.y2, size(yBHAll));

yBHAll(yBHAll < yy1B) = nan;
yBHAll(yBHAll > yy2B) = nan;

%avg line
if size(yBHAll, 1) > 1
    set(data2.Panel.ViewBH.Comp.hPlotObj.Avg, 'XData', tt, 'YData', (mean(yBHAll) - yA_mean.min)/range(yA_mean.data)); 
    data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Visible = 'on';  
    wBHAvg.tt = tt;
    wBHAvg.yy = mean(yBHAll);
else
    set(data2.Panel.ViewBH.Comp.hPlotObj.Avg, 'XData', [], 'YData', []);
    data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Visible = 'off';  
    wBHAvg.tt = [];
    wBHAvg.yy = [];
end

junk = abs(yBHAll - repmat(mean(yBHAll, 'omitnan'), nsBH, 1));
junk = (junk-yA_mean.min)/range(yA_mean.data);
junk = abs(junk);
AV = mean(junk(:), 'omitnan');
data2.Panel.ParamBH.Comp.Text.ParamValue(3).String = num2str(AV, 2);
paramBH.AV = AV;

% updateBHLimit;

if ~isempty(ampAvgB)
    AVP = AV*100;
    data2.Panel.ParamBH.Comp.Text.ParamValueP(3).String = [num2str(AVP, 3), '%'];

    if AVP < Thresh(4, 1)
        CLR = 'g';
    elseif AVP > Thresh(4, 2)
        CLR = 'r';
    else
        CLR = 'y';
    end
    data2.Panel.ParamBH.Comp.Text.ParamValueP(3).ForegroundColor = CLR;
end
% bring avg line to top
reorderPlotObj(data2.Panel.ViewBH.Comp.hAxis.ViewBH);
end