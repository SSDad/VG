function updateAvgB

global tt yy
global hFig2

data2 = guidata(hFig2);
hAllWaveComp = data2.Panel.AllWave.Comp;
hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
hg_wg =    data2.Panel.ViewB.Comp.hPlotObj.hg_wg;

delete(hg_wg.Children(:));

for iW = 1:length(hg_wg.Children)
    delete(hg_wg.Children(iW));
end

pos = data2.Panel.Wave.Comp.hPlotObj.WavePickWin.Position;

% if isfield(hAllWaveComp.hPlotObj, 'BoxH')
% else
    
    [~, ind(1)] = min(abs(tt-pos(1)));
    [~, ind(2)] = min(abs(tt-pos(1)-pos(3)));
    [wg] = fun_getAvgB(tt, yy, ind);
    
    for iW = 1:size(wg.yy, 1)
        hW(iW) = line(hg_wg, 'XData', 1:wg.nP, 'YData', wg.yy(iW, :), 'Color', 'y');
    end
        
    set(hAvg, 'XData', 1:wg.nP, 'YData', mean(wg.yy));
% end
