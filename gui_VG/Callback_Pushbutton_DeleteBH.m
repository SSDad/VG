function Callback_Pushbutton_DeleteBH(src, evnt)

global hFig2
% global avgB yBAll periodBAll
global BoxColorBH
global wBH

data2 = guidata(hFig2);

iBox = data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.Value-1;

% update ViewBH
if iBox > 0
delete(wBH(iBox).hLine);

hWaveComp = data2.Panel.Wave.Comp;
hAllWaveComp = data2.Panel.AllWave.Comp;
junk1 = hWaveComp.hPlotObj.BoxBH(iBox);
junk2 = hAllWaveComp.hPlotObj.BoxBH(iBox);
junk3 = hAllWaveComp.hPlotObj.BoxBHText(iBox);
nBox = length(wBH);
junkColor = BoxColorBH(iBox, :);
for n = iBox:nBox-1
    wBH(n) = wBH(n+1); % update avgB
    % update box
    data2.Panel.Wave.Comp.hPlotObj.BoxBH(n) = hWaveComp.hPlotObj.BoxBH(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxBH(n) = hAllWaveComp.hPlotObj.BoxBH(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxTextBH(n) = hAllWaveComp.hPlotObj.BoxTextBH(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxTextBH(n).String = char(n+'A'-1);
    
    BoxColorBH(n, :) =  BoxColorBH(n+1, :);
end
BoxColorBH(nBox, :) = junkColor;

delete(junk1);
delete(junk2);
delete(junk3);

% update TableBH color
for n = iBox:size(BoxColorBH, 1)
    data2.Panel.TableBH.Comp.Radiobutton.Box(n).BackgroundColor = BoxColorBH(n, :);
end

wBH(nBox) = [];  % update avgB 

data2.Panel.TableBH.Comp.Radiobutton.Box(nBox).Visible = 'off'; % TableBH
data2.Panel.TableBH.Comp.Radiobutton.Box(nBox).Value = 0; % TableBH

% popup list
nBox = nBox-1;
BLS{1} = 'Box List';
for n = 1:nBox
    BLS{n+1} = ['       ', char(n+'A'-1)];
end
data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.String = BLS; 
data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.Value = nBox+1; 

% update yBAll periodBAll
updateBH;

guidata(hFig2, data2)

end