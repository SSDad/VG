function Callback_Radiobutton_TableB_Box_(src, evnt)

global hFig2
global avgB
global yBAll periodBAll % all previous wave y and period
global dt

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

junk = abs(yA-mean(yA));
GAV = sum(junk(:))/numel(junk);
data2.Panel.ParamB.Comp.Text.ParamValue(1).String = num2str(GAV, 2 );

PV = sum(abs(pA-mean(pA)))/numel(pA)*dt;
data2.Panel.ParamB.Comp.Text.ParamValue(2).String = num2str(PV, 2 );

set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'YData', mean(yA));