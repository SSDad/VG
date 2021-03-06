function Callback_Radiobutton_TableB_Box_(src, evnt)

global hFig2
global avgB avgBnP
global yBAll periodBAll % all previous wave y and period
global dt
global LAVBox

data2 = guidata(hFig2);

iBox = str2double(src.Tag);

%% update ViewB
if src.Value
    avgB(iBox).hg.Visible = 'on';
else
    avgB(iBox).hg.Visible = 'off';
end

%% update avgB
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

% no radiobutton selected
if isempty(yBAll)
    clearB;
else
    data2.Panel.ViewB.Comp.hPlotObj.Avg.Visible = 'on';
    
    updateAvgB;    
    % LAV
    updateLAVBoxParam;
    data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'on';

end
