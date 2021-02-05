function syncYLim

global hFig2
global ViewBYLim ViewBHLim

if ~isempty(ViewBYLim) && ~isempty(ViewBHLim)
    data2 = guidata(hFig2);
    hAB = data2.Panel.ViewB.Comp.hAxis.ViewB;
    hABH = data2.Panel.ViewBH.Comp.hAxis.ViewBH;

    y1 = min(ViewBYLim(1), ViewBHLim.y1);
    y2 = max(ViewBYLim(2), ViewBHLim.y2);

    hAB.YLim = [y1 y2];
    hABH.YLim = [y1 y2];
end