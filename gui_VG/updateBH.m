function updateBH

global hFig2
% global tt yy baseLine dt
global wBH
global LAVBoxBH

data2 = guidata(hFig2);
x1 = LAVBoxBH.x1;
x2 = LAVBoxBH.x2;

data2.Panel.ParamBH.Comp.Text.ParamValue(1).String = num2str(x2 - x1, 3);

nBH = length(wBH);
for n = 1:nBH
    t2(n) = wBH(n).wib.tt(end);
end
tt2 = min([t2 x2]);
tt1 = max(0, x1);
tt = linspace(tt1, tt2, 1000);

for n = 1:nBH
    yBHAll(n, :) = interp1( wBH(n).wib.tt,  wBH(n).wib.yy, tt);
end
yy1B = repmat( LAVBoxBH.y1, size(yBHAll));
yy2B = repmat( LAVBoxBH.y2, size(yBHAll));

yBHAll(yBHAll < yy1B) = nan;
yBHAll(yBHAll > yy2B) = nan;

set(data2.Panel.ViewBH.Comp.hPlotObj.Avg, 'XData', tt, 'YData', mean(yBHAll));
junk = abs(yBHAll - repmat(mean(yBHAll, 'omitnan'), nBH, 1));
AV = mean(junk(:), 'omitnan');
data2.Panel.ParamBH.Comp.Text.ParamValue(2).String = num2str(AV, 2);

% global yBAll periodBAll % all previous wave y and period
% global avgBnP
% global LAVBox

% if ~isempty(wiwBH)
    




% % hAllWaveComp = data2.Panel.AllWave.Comp;
% hPeaks = data2.Panel.Wave.Comp.hPlotObj.Peaks;
% hTroughs = data2.Panel.Wave.Comp.hPlotObj.Troughs;
% hwiwBH = data2.Panel.ViewBH.Comp.hPlotObj.wiwBH;
% hg_wiwB =    data2.Panel.ViewB.Comp.hPlotObj.hg_wiwB;

% pos = data2.Panel.Wave.Comp.hPlotObj.WavePickWin.Position;
% [~, ind(1)] = min(abs(tt-pos(1)));
% [~, ind(2)] = min(abs(tt-pos(1)-pos(3)));
% wiwBH.tt = tt(ind(1):ind(2)) - tt(ind(1));
% wiwBH.yy = yy(ind(1):ind(2));
% set(hwiwBH, 'XData', wiwBH.tt, 'YData', wiwBH.yy-baseLine);

% 
% %% peaks and troughs on wave
% peakInd = wiwB.locs1+ind(1)-1;
% set(hPeaks, 'XData', tt(peakInd), 'YData', yy(peakInd)-baseLine);
% troughInd = wiwB.locs2+ind(1)-1;
% set(hTroughs, 'XData', tt(troughInd), 'YData', yy(troughInd)-baseLine);
%     
% if ~isempty(hg_wiwB.Children)
%     delete(hg_wiwB.Children(:));
% end
% 
% x = 1:avgBnP;
% for iW = 1:size(wiwB.yy, 1)
%     y = wiwB.yy(iW, :);
%     line(hg_wiwB, 'XData', x, 'YData', y, 'Color', 'g');
% end
% 
% yA = [yBAll; wiwB.yy];
% set(hAvg, 'XData', x, 'YData', mean(yA));
% data2.Panel.ViewB.Comp.hAxis.ViewB.YLim = [min(yA(:))*.9 max(yA(:))*1.1];
% 
% pA = [periodBAll diff(wiwB.locs2)];
% 
% %% update param
% junk = abs(yA-mean(yA));
% GAV = sum(junk(:))/numel(junk);
% data2.Panel.ParamB.Comp.Text.ParamValue(1).String = num2str(GAV, 2 );
% 
% PV = sum(abs(pA-mean(pA)))/numel(pA)*dt;
% data2.Panel.ParamB.Comp.Text.ParamValue(2).String = num2str(PV, 2 );
% 
% hLAVBox = data2.Panel.ViewB.Comp.hPlotObj.LAVBox;
% 
% if isempty(LAVBox.y2)
%     y2 = mean(yA(:));
%     LAVBox.y2 = y2;
% end
% y1 = min(yA(:))*0.8;
% hLAVBox.Position = [0 y1 avgBnP+2 LAVBox.y2-y1];
% 
% [LAV] = fun_getLAV(yA, LAVBox.y2);
% data2.Panel.ParamB.Comp.Text.ParamValue(3).String = num2str(LAV, 2 );
% 
% % reorder
% reorderPlotObj(data2.Panel.ViewB.Comp.hAxis.ViewB);
% 
