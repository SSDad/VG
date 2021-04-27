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

% LAVBoxBH text
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
%     data2.Panel.ParamBH.Comp.Text.ParamValue(1).String = [num2str(x2 - x1, 3), 's'];

    boxH = LAVBoxBH.y2-LAVBoxBH.y1;
    % boxH = (boxH-yA_mean.min)/range(yA_mean.data);
    data2.Panel.ParamBH.Comp.Text.ParamValue(2).String = [num2str(boxH, 3)];
    data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = '';
    paramBH.boxH = boxH;

% if ~isempty(ampAvgB)
%     data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = [num2str(boxH*100, 3), '%'];
% end

tt2 = min([t2 x2]);
tt1 = max(0, x1);
tt = linspace(tt1, tt2, 1000);

nsBH = length(sBH);
for m = 1:nsBH
    iBox = sBH(m);
    yBHAll(m, :) = interp1( wBH(iBox).wib.tt,  wBH(iBox).wib.yy, tt);
end

% normalize
yBHAll = (yBHAll - yA_mean.min)/range(yA_mean.data);
 
yy1B = repmat( LAVBoxBH.y1, size(yBHAll));
yy2B = repmat( LAVBoxBH.y2, size(yBHAll));

yBHAll(yBHAll < yy1B) = nan;
yBHAll(yBHAll > yy2B) = nan;

%avg line
if size(yBHAll, 1) > 1
    set(data2.Panel.ViewBH.Comp.hPlotObj.Avg, 'XData', tt, 'YData', mean(yBHAll)); 
    data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Visible = 'on';  
    wBHAvg.tt = tt;
    wBHAvg.yy = mean(yBHAll);
else
    set(data2.Panel.ViewBH.Comp.hPlotObj.Avg, 'XData', [], 'YData', []);
    data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Visible = 'off';  
    wBHAvg.tt = [];
    wBHAvg.yy = [];
end

% AV
junk = abs(yBHAll - repmat(mean(yBHAll, 'omitnan'), nsBH, 1));
junk = (junk-yA_mean.min)/range(yA_mean.data);
junk = abs(junk);
AV = mean(junk(:), 'omitnan');
AVStd = std(junk(:), 'omitnan');
data2.Panel.ParamBH.Comp.Text.ParamValue(2).String = num2str(AV, 3);
data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = num2str(AVStd, 3);

paramBH.AV = AV;
paramBH.AVStd = AVStd;

% updateBHLimit;

if ~isempty(ampAvgB)
    AVP = AV*100;
    if AVP < Thresh(4, 1)
        CLR = 'g';
    elseif AVP > Thresh(4, 2)
        CLR = 'r';
    else
        CLR = 'y';
    end
    data2.Panel.ParamBH.Comp.Text.ParamValueP(2).ForegroundColor = CLR;
end
% bring avg line to top
reorderPlotObj(data2.Panel.ViewBH.Comp.hAxis.ViewBH);
end