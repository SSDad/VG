function updateAvgB

global hFig2
global wiwB  % wave group in current picked window
global yBAll periodBAll % all previous wave y and period
global yA_mean
global avgBnP
global Thresh
global ampAvgB
global ViewBYLim
global paramBH
global pps

data2 = guidata(hFig2);

hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
    
if ~isempty(wiwB)
    hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;
    if ~isempty(hg_wiwB.Children)
        delete(hg_wiwB.Children(:));
    end

    yA = [yBAll; wiwB.yy];
    pA = [periodBAll diff(wiwB.locs2)];

    yA_mean.data = mean(yA);
    yA_mean.min = min(yA_mean.data);
    yA_mean.shift = yA_mean.data - yA_mean.min;
    yA_mean.norm = yA_mean.shift/range(yA_mean.data);
    
    x = 1:avgBnP;
    for iW = 1:size(wiwB.yy, 1)
        y = wiwB.yy(iW, :);
        
        y = (y - yA_mean.min)/range(yA_mean.data);
        
        line(hg_wiwB, 'XData', x, 'YData', y, 'Color', 'g');
    end

else
    yA = yBAll;
    pA = periodBAll;
end

%% update avg
 if ~isempty(yA)
    x = 1:avgBnP;
% set(hAvg, 'XData', x, 'YData', mean(yA));
set(hAvg, 'XData', x, 'YData', yA_mean.norm);
junk = range(yA(:));
ViewBYLim = [min(yA(:)) - junk*.1 max(yA(:)) + junk*.1];
ViewBYLim = (ViewBYLim - yA_mean.min)/range(yA_mean.data);
data2.Panel.ViewB.Comp.hAxis.ViewB.YLim = ViewBYLim;

% bring avg line to top
reorderPlotObj(data2.Panel.ViewB.Comp.hAxis.ViewB);

%% update param
% yAmean = mean(yA);
% ampAvgB = max(yAmean)-min(yAmean);
ampAvgB = range(yA_mean.data);
data2.Panel.ParamBRaw.Comp.Text.Param(1).Name(2).String = num2str(ampAvgB, 2 );
junk = abs(yA-yA_mean.data)/ampAvgB;
GAV = sum(junk(:))/numel(junk);
data2.Panel.ParamBNorm.Comp.Text.Param(2).Name(2).String = num2str(GAV, 2 );
data2.Panel.ParamBNorm.Comp.Text.Param(2).Name(3).String = num2str(std(junk(:)), 2);
GAVP = GAV*100;
if GAVP <= Thresh(1, 1)
    CLR = 'g';
elseif GAVP >= Thresh(1, 2)
    CLR = 'r';
else
    CLR = 'y';
end
data2.Panel.ParamBNorm.Comp.Text.Param(1).Name(3).ForegroundColor = CLR;

dt = 1/pps;
junk = abs(pA-mean(pA))*dt;
PV = sum(junk)/numel(pA);
% data2.Panel.ParamBPeriod.Comp.Text.Param(4).Name(2).String = [num2str(mean(pA)*dt, 2 ), 's'];
data2.Panel.ParamBPeriod.Comp.Text.Param(2).Name(2).String = [num2str(PV, 2 ), 's'];
data2.Panel.ParamBPeriod.Comp.Text.Param(2).Name(3).String =  [num2str(std(junk), 2), 's'];

PVP = PV/mean(pA)/dt*100;
if PVP <= Thresh(2, 1)
    CLR = 'g';
elseif PVP >= Thresh(2, 2)
    CLR = 'r';
else
    CLR = 'y';
end
data2.Panel.ParamBNorm.Comp.Text.ParamValueP(1).ForegroundColor = CLR;

% syncYLim;

% paramBH
if ~isempty(paramBH.AV)
%     data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = [num2str(paramBH.boxH/ampAvgB*100, 3), '%'];

    data2.Panel.ParamBH.Comp.Text.ParamValue(2).String = num2str(paramBH.AV, 3);
    data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = num2str(paramBH.AVStd, 3);

%     AVP = paramBH.AV/ampAvgB*100;
%     data2.Panel.ParamBH.Comp.Text.ParamValueP(3).String = [num2str(AVP, 3), '%'];

%     if AVP < Thresh(4, 1)
%         CLR = 'g';
%     elseif AVP > Thresh(4, 2)
%         CLR = 'r';
%     else
%         CLR = 'y';
%     end
%     data2.Panel.ParamBH.Comp.Text.ParamValueP(3).ForegroundColor = CLR;
end

end
