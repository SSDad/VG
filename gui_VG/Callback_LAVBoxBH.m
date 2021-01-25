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
% [LAV] = fun_getLAV(yBAll, LAVBox.y2, LAVBox.y1);
% data2.Panel.ParamB.Comp.Text.ParamValue(3).String = num2str(LAV, 2 );
% LAVP = LAV/(max(yBAll(:))-min(yBAll(:)))*100;
% data2.Panel.ParamB.Comp.Text.ParamValueP(3).String = [num2str(LAVP, 2), '%'];
