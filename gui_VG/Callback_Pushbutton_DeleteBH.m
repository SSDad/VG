function Callback_Pushbutton_DeleteBH(src, evnt)

global hFig2
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
    wBH(n) = wBH(n+1); % update wBH
    % update box
    data2.Panel.Wave.Comp.hPlotObj.BoxBH(n) = data2.Panel.Wave.Comp.hPlotObj.BoxBH(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxBH(n) = data2.Panel.AllWave.Comp.hPlotObj.BoxBH(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(n) = data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(n+1);
    data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(n).String = char(n+'A'-1);
    
    BoxColorBH(n, :) =  BoxColorBH(n+1, :);
end
BoxColorBH(nBox, :) = junkColor;

% delete(data2.Panel.Wave.Comp.hPlotObj.BoxBH(iBox));
% delete(data2.Panel.AllWave.Comp.hPlotObj.BoxBH(iBox));
% delete(data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(iBox));
delete(junk1);
delete(junk2);
delete(junk3);

wBH(nBox) = []; 
data2.Panel.Wave.Comp.hPlotObj.BoxBH(nBox) = [];
data2.Panel.AllWave.Comp.hPlotObj.BoxBH(nBox) = [];
data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(nBox) = [];

% update TableBH color
for n = iBox:nBox%size(BoxColorBH, 1)
    data2.Panel.TableBH.Comp.Radiobutton.Box(n).BackgroundColor = BoxColorBH(n, :);
end

data2.Panel.TableBH.Comp.Radiobutton.Box(nBox).Visible = 'off'; % TableBH
% data2.Panel.TableBH.Comp.Radiobutton.Box(nBox).Value = 0; % TableBH

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