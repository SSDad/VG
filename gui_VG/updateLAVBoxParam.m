function updateLAVBoxParam

global hFig2
global yBAll
global LAVBox

data2 = guidata(hFig2);

    [LAV] = fun_getLAV(yBAll, LAVBox.y2, LAVBox.y1);
    data2.Panel.ParamB.Comp.Text.ParamValue(3).String = num2str(LAV, 2 );       
    LAVP = LAV/(max(yBAll(:))-min(yBAll(:)))*100;
    data2.Panel.ParamB.Comp.Text.ParamValueP(3).String = [num2str(LAVP, 2), '%'];