function Callback_LAVBox(src, evnt)

global hFig2
global LAVBox

% data2 = guidata(hFig2);
pos = src.Position;
LAVBox.y1 = pos(2);
LAVBox.y2 = pos(2)+pos(4);

updateLAVBoxParam;