function updateLAVBoxParam

global hFig2
global yBAll
global LAVBox
global Thresh
global ampAvgB

data2 = guidata(hFig2);

[LAV] = fun_getLAV(yBAll, LAVBox.y2, LAVBox.y1);
data2.Panel.ParamB.Comp.Text.Param(3).Name(2).String = num2str(LAV, 2 );       
LAVP = LAV/ampAvgB*100;
data2.Panel.ParamB.Comp.Text.Param(3).Name(3).String = [num2str(LAVP, 2), '%'];

if LAVP <= Thresh(3, 1)
    CLR = 'g';
elseif LAVP >= Thresh(3, 2)
    CLR = 'r';
else
    CLR = 'y';
end
data2.Panel.ParamB.Comp.Text.ParamValueP(3).ForegroundColor = CLR;
