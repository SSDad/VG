function Callback_LAVBox(src, evnt)

global hFig2
global yBAll LAVBox

data2 = guidata(hFig2);
pos = src.Position;
% pos(2) = min(yBAll(:))*0.8;
LAVBox.y2 = pos(2)+pos(4);


[LAV] = fun_getLAV(yBAll, LAVBox.y2);
data2.Panel.ParamB.Comp.Text.ParamValue(3).String = num2str(LAV, 2 );