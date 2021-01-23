function updateAvgB

global hFig2
global tt yy baseLine dt
global wiwB  % wave group in current picked window
global yBAll periodBAll % all previous wave y and period
global avgBnP

data2 = guidata(hFig2);

hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
    
if ~isempty(wiwB)
    hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;
    if ~isempty(hg_wiwB.Children)
        delete(hg_wiwB.Children(:));
    end

    x = 1:avgBnP;
    for iW = 1:size(wiwB.yy, 1)
        y = wiwB.yy(iW, :);
        line(hg_wiwB, 'XData', x, 'YData', y, 'Color', 'g');
    end

    yA = [yBAll; wiwB.yy];
    pA = [periodBAll diff(wiwB.locs2)];
else
    yA = yBAll;
    pA = periodBAll;
end

%% update avg
    x = 1:avgBnP;
    set(hAvg, 'XData', x, 'YData', mean(yA));
    junk = range(yA(:));
    data2.Panel.ViewB.Comp.hAxis.ViewB.YLim = [min(yA(:)) - junk*.1 max(yA(:)) + junk*.1];

    % bring avg line to top
    reorderPlotObj(data2.Panel.ViewB.Comp.hAxis.ViewB);

%% update param
junk = abs(yA-mean(yA));
GAV = sum(junk(:))/numel(junk);
data2.Panel.ParamB.Comp.Text.ParamValue(1).String = num2str(GAV, 2 );
GAVP = GAV/(max(yA(:))-min(yA(:)))*100;
data2.Panel.ParamB.Comp.Text.ParamValueP(1).String = [num2str(GAVP, 2), '%'];

PV = sum(abs(pA-mean(pA)))/numel(pA)*dt;
data2.Panel.ParamB.Comp.Text.ParamValue(2).String = num2str(PV, 2 );
PVP = PV/mean(pA)/dt;
data2.Panel.ParamB.Comp.Text.ParamValueP(2).String =  [num2str(PVP, 2), '%'];