function Callback_LAVBox(src, evnt)

global hFig2
global LAVBox

% data2 = guidata(hFig2);
pos = src.Position;
LAVBox.y1 = pos(2);
LAVBox.y2 = pos(2)+pos(4);

updateLAVBoxParam;
% [LAV] = fun_getLAV(yBAll, LAVBox.y2, LAVBox.y1);
% data2.Panel.ParamB.Comp.Text.ParamValue(3).String = num2str(LAV, 2 );
% LAVP = LAV/(max(yBAll(:))-min(yBAll(:)))*100;
% data2.Panel.ParamB.Comp.Text.ParamValueP(3).String = [num2str(LAVP, 2), '%'];
