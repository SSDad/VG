function Callback_LAVBoxBH(src, evnt)

global hFig2
global LAVBoxBH

% data2 = guidata(hFig2);
pos = src.Position;
LAVBoxBH.x1 = pos(1);
LAVBoxBH.x2 = pos(1)+pos(3);
LAVBoxBH.y1 = pos(2);
LAVBoxBH.y2 = pos(2)+pos(4);

updateBH;