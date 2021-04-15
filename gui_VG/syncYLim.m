function syncYLim

global hFig2
global ViewBYLim ViewBHLim

if ~isempty(ViewBYLim) && ~isempty(ViewBHLim)
    data2 = guidata(hFig2);
    hAB = data2.Panel.ViewB.Comp.hAxis.ViewB;
    hABH = data2.Panel.ViewBH.Comp.hAxis.ViewBH;

    data2 = guidata(hFig2);
    y1BH =  ViewBHLim.y1;
    y2BH =  ViewBHLim.y2;
    yrBH = y2BH-y1BH;
    y1BH = y1BH-yrBH*0.1;
    y2BH = y2BH+yrBH*0.1;
    
    if strcmp(data2.Panel.SyncYLim.Comp.Pushbutton.SyncYLim.String, 'Sync')
        y1 = min(ViewBYLim(1), y1BH);
        y2 = max(ViewBYLim(2), y2BH);
        hAB.YLim = [y1 y2];
        hABH.YLim = [y1 y2];
    else
        hAB.YLim =ViewBYLim;
        hABH.YLim = [y1BH y2BH];
    end
end