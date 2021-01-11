function updateAvgB

global hFig2
global tt yy
global wgB yBAll

data2 = guidata(hFig2);
hAllWaveComp = data2.Panel.AllWave.Comp;
hAvg = data2.Panel.ViewB.Comp.hPlotObj.Avg;
hg_wgB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wgB;
% hg_wgBAll =    data2.Panel.ViewB.Comp.hPlotObj.hg_wgBAll;

pos = data2.Panel.Wave.Comp.hPlotObj.WavePickWin.Position;

% if isfield(hAllWaveComp.hPlotObj, 'BoxH')
% else
    
    [~, ind(1)] = min(abs(tt-pos(1)));
    [~, ind(2)] = min(abs(tt-pos(1)-pos(3)));
    [wgB] = fun_getAvgB(tt, yy, ind);
    
%     wgBAll{length(wgBAll)+1} = wgB;
    
if ~isempty(hg_wgB.Children)
    delete(hg_wgB.Children(:));
end
    x = 1:wgB.nP;
    for iW = 1:size(wgB.yy, 1)
        y = wgB.yy(iW, :);
        line(hg_wgB, 'XData', x, 'YData', y, 'Color', 'g');
    end
    
%     yBAll = [yBAll; wgB.yy];
    set(hAvg, 'XData', x, 'YData', mean([yBAll; wgB.yy]));
% end
