function updateLAVBoxParam

global hFig2
global yBAll
global yA_mean
global LAVBox
global Thresh
global ampAvgB

data2 = guidata(hFig2);

[LAV stdLAV] = fun_getLAV((yBAll-yA_mean.min)/ampAvgB, LAVBox.y2, LAVBox.y1);
% [LAV] = LAVBox.y2 - LAVBox.y1;
boxH = LAVBox.y2-LAVBox.y1;
data2.Panel.ParamBNorm.Comp.Text.Param(2).Name(2).String = num2str(boxH, 2);       
data2.Panel.ParamBNorm.Comp.Text.Param(2).Name(3).String = '';       
data2.Panel.ParamBNorm.Comp.Text.Param(3).Name(2).String = num2str(LAV, 2 );       
data2.Panel.ParamBNorm.Comp.Text.Param(3).Name(3).String = [num2str(stdLAV, 2)];

LAVP = LAV*100;

if LAVP <= Thresh(3, 1)
    CLR = 'g';
elseif LAVP >= Thresh(3, 2)
    CLR = 'r';
else
    CLR = 'y';
end
data2.Panel.ParamBNorm.Comp.Text.ParamValueP(3).ForegroundColor = CLR;
