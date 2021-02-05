function updateBHLimit

global hFig2
global wBH
global wiwBH
global ViewBHLim

data2 = guidata(hFig2);

if ~isempty(wiwBH)
    x1 = wiwBH.tt(1);
    x2 = wiwBH.tt(end);
    y1 = min(wiwBH.yy);
    y2 = max(wiwBH.yy);
else
    x1 = inf;
    x2 = 0;
    y1 = inf;
    y2 = -inf;
end


for iB = 1:length(wBH)
    x1 = min(x1, wBH(iB).wib.tt(1));
    x2 = max(x2, wBH(iB).wib.tt(end));
    y1 = min(y1, min(wBH(iB).wib.yy));
    y2 = max(y2, max(wBH(iB).wib.yy));
end
        
xr = x2 - x1;
yr = y2 - y1;
data2.Panel.ViewBH.Comp.hAxis.ViewBH.XLim = [x1 - xr*0.1 x2 + xr*0.1];
data2.Panel.ViewBH.Comp.hAxis.ViewBH.YLim = [y1 - yr*0.1 y2 + yr*0.1];

ViewBHLim.x1 = x1;
ViewBHLim.x2 = x2;
ViewBHLim.y1 = y1;
ViewBHLim.y2 = y2;