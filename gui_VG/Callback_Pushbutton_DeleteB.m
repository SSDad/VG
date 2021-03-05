function Callback_Pushbutton_DeleteB(src, evnt)

global hFig2
global avgB yBAll periodBAll
global BoxColor

data2 = guidata(hFig2);

iBox = data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.Value-1;

if iBox >0
    
hWaveComp = data2.Panel.Wave.Comp;
hAllWaveComp = data2.Panel.AllWave.Comp;

% update ViewB
delete(avgB(iBox).hg.Children(:));

% hWaveComp = data2.Panel.Wave.Comp;
% hAllWaveComp = data2.Panel.AllWave.Comp;

% junk1 = hWaveComp.hPlotObj.BoxB(iBox);
% junk2 = hAllWaveComp.hPlotObj.BoxB(iBox);
% junk3 = hAllWaveComp.hPlotObj.BoxBText(iBox);
nBox = length(avgB);
junkColor = BoxColor(iBox, :);
for n = iBox:nBox-1
    avgB(n) = avgB(n+1); % update avgB
    
    % update box
    data2.Panel.Wave.Comp.hPlotObj.BoxB(n) = data2.Panel.Wave.Comp.hPlotObj.BoxB(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxB(n) = data2.Panel.AllWave.Comp.hPlotObj.BoxB(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxText(n) = data2.Panel.AllWave.Comp.hPlotObj.BoxText(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxText(n).String = num2str(n);

    BoxColor(n, :) =  BoxColor(n+1, :);
end
BoxColor(nBox, :) = junkColor;

delete(data2.Panel.Wave.Comp.hPlotObj.BoxB(iBox));
delete(data2.Panel.AllWave.Comp.hPlotObj.BoxB(iBox));
delete(data2.Panel.AllWave.Comp.hPlotObj.BoxBText(iBox));
data2.Panel.Wave.Comp.hPlotObj.BoxB(iBox) = [];
data2.Panel.AllWave.Comp.hPlotObj.BoxB(iBox) = [];
data2.Panel.AllWave.Comp.hPlotObj.BoxBText(iBox) = [];

% update TableB color
for n = iBox:size(BoxColor, 1)
    data2.Panel.TableB.Comp.Radiobutton.Box(n).BackgroundColor = BoxColor(n, :);
end

avgB(nBox) = [];  % update avgB 

data2.Panel.TableB.Comp.Radiobutton.Box(nBox).Visible = 'off'; % Table B

% popup list
nBox = nBox-1;
BLS{1} = 'Box List';
for n = 1:nBox
    BLS{n+1} = ['       ', num2str(n)];
end
data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.String = BLS; 
data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.Value = nBox+1; 

% update yBAll periodBAll
yA = [];
pA = [];
for iBox = 1:nBox
    if data2.Panel.TableB.Comp.Radiobutton.Box(iBox).Value
        yA = [yA; avgB(iBox).wib.yy];
        pA = [pA diff(avgB(iBox).wib.locs2)];
    end
end
yBAll = yA;
periodBAll = pA;

% % update avg line
% if isempty(yA)
%     set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'XData', [], 'YData', []);
% 
% else
%     data2.Panel.ViewB.Comp.hPlotObj.Avg.YData = mean(yA);
% end

guidata(hFig2, data2)

if nBox == 0
    clearB
else
    updateAvgB;
    updateLAVBoxParam;
end

end