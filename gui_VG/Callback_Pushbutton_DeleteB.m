function Callback_Pushbutton_DeleteB(src, evnt)

global hFig2
global avgB yBAll periodBAll
global BoxColor
global wBH

data2 = guidata(hFig2);

iBox = data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.Value-1;

if iBox >0
nBox = length(avgB);
    
    if nBox == 1 && ~isempty(wBH)  % if any BH, cannot delete all B
        msg{1} =  'Cannot delele all Breath data while Breath Holding data still exist...';
        msg{2} = '';
        fun_messageBox('', msg, 'y');
    else
    
hWaveComp = data2.Panel.Wave.Comp;
hAllWaveComp = data2.Panel.AllWave.Comp;

% update ViewB
delete(avgB(iBox).hg.Children(:));

junk1 = hWaveComp.hPlotObj.BoxB(iBox);
junk2 = hAllWaveComp.hPlotObj.BoxB(iBox);
junk3 = hAllWaveComp.hPlotObj.BoxBText(iBox);

junkColor = BoxColor(iBox, :);
for n = iBox:nBox-1
    avgB(n) = avgB(n+1); % update avgB
    
    % update box
    data2.Panel.Wave.Comp.hPlotObj.BoxB(n) = data2.Panel.Wave.Comp.hPlotObj.BoxB(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxB(n) = data2.Panel.AllWave.Comp.hPlotObj.BoxB(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxBText(n) = data2.Panel.AllWave.Comp.hPlotObj.BoxBText(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxBText(n).String = num2str(n);

    % update Box Color
    BoxColor(n, :) =  BoxColor(n+1, :);
end
BoxColor(nBox, :) = junkColor;

% delete(data2.Panel.Wave.Comp.hPlotObj.BoxB(iBox));
% delete(data2.Panel.AllWave.Comp.hPlotObj.BoxB(iBox));
% delete(data2.Panel.AllWave.Comp.hPlotObj.BoxBText(iBox));
% 
delete(junk1);
delete(junk2);
delete(junk3);

avgB(nBox) = [];
data2.Panel.Wave.Comp.hPlotObj.BoxB(nBox) = [];
data2.Panel.AllWave.Comp.hPlotObj.BoxB(nBox) = [];
data2.Panel.AllWave.Comp.hPlotObj.BoxBText(nBox) = [];

% update TableB color
for n = iBox:nBox%size(BoxColor, 1)
    data2.Panel.TableB.Comp.Radiobutton.Box(n).BackgroundColor = BoxColor(n, :);
end

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

    end  %  if nBox == 1 && isempty(wBH) 

end