function Callback_Radiobutton_TableB_Box_(src, evnt)

global hFig2
global avgB avgBnP
global yBAll periodBAll % all previous wave y and period
global dt
global LAVBox

data2 = guidata(hFig2);

iBox = str2double(src.Tag);

if src.Value
    avgB(iBox).hg.Visible = 'on';
else
    avgB(iBox).hg.Visible = 'off';
end

%% update param
nBoxB = length(avgB);
yA = [];
pA = [];
for iBox = 1:nBoxB
    if avgB(iBox).hg.Visible == 'on'
        yA = [yA; avgB(iBox).wib.yy];
        pA = [pA diff(avgB(iBox).wib.locs2)];
    end
end
yBAll = yA;
periodBAll = pA;

if isempty(yBAll)
    data2.Panel.ViewB.Comp.hPlotObj.Avg.Visible = 'off';
    data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'off';
    data2.Panel.ParamB.Comp.Text.ParamValue(1).String = '';
    data2.Panel.ParamB.Comp.Text.ParamValue(2).String = '';
    data2.Panel.ParamB.Comp.Text.ParamValue(3).String = '';
else
    % GAV
    junk = abs(yA-mean(yA));
    GAV = sum(junk(:))/numel(junk);
    data2.Panel.ParamB.Comp.Text.ParamValue(1).String = num2str(GAV, 2 );

    % PV
    PV = sum(abs(pA-mean(pA)))/numel(pA)*dt;
    data2.Panel.ParamB.Comp.Text.ParamValue(2).String = num2str(PV, 2 );

    % avg
    set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'YData', mean(yA));
    data2.Panel.ViewB.Comp.hPlotObj.Avg.Visible = 'on';

    % LAV
    [LAV] = fun_getLAV(yA, LAVBox.y2, LAVBox.y1);
    data2.Panel.ParamB.Comp.Text.ParamValue(3).String = num2str(LAV, 2 );
    LAVP = LAV/(max(yBAll(:))-min(yBAll(:)))*100;
    data2.Panel.ParamB.Comp.Text.ParamValueP(3).String = [num2str(LAVP, 2), '%'];

    data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'on';

    % viewB axis YLim
    data2.Panel.ViewB.Comp.hAxis.ViewB.YLim = [min(yA(:))*.9 max(yA(:))*1.1];

    y1 = min(yA(:))*0.8;
    data2.Panel.ViewB.Comp.hPlotObj.LVBox.Position = [0 y1 avgBnP+2 LAVBox.y2-y1];

    % reorder
    reorderPlotObj(data2.Panel.ViewB.Comp.hAxis.ViewB);

end
