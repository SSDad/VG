function Callback_Radiobutton_TableBH_Box_(src, evnt)

% global hFig2
% global avgB avgBnP
% global yBAll periodBAll % all previous wave y and period
% global dt
% global LAVBox

global wBH

% data2 = guidata(hFig2);

iBox = str2double(src.Tag);

%% update ViewB
if src.Value
     wBH(iBox).hLine.Visible = 'on';
else
     wBH(iBox).hLine.Visible = 'off';
end

updateBH;

% %% update avgB
% nBoxB = length(avgB);
% yA = [];
% pA = [];
% for iBox = 1:nBoxB
%     if avgB(iBox).hg.Visible == 'on'
%         yA = [yA; avgB(iBox).wib.yy];
%         pA = [pA diff(avgB(iBox).wib.locs2)];
%     end
% end
% yBAll = yA;
% periodBAll = pA;
% 
% % no radiobutton selected
% if isempty(yBAll)
%     data2.Panel.ViewB.Comp.hPlotObj.Avg.Visible = 'off';
%     data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'off';
%     data2.Panel.ParamB.Comp.Text.ParamValue(1).String = '';
%     data2.Panel.ParamB.Comp.Text.ParamValue(2).String = '';
%     data2.Panel.ParamB.Comp.Text.ParamValue(3).String = '';
% 
%     data2.Panel.ParamB.Comp.Text.ParamValueP(1).String = '';
%     data2.Panel.ParamB.Comp.Text.ParamValueP(2).String = '';
%     data2.Panel.ParamB.Comp.Text.ParamValueP(3).String = '';
% else
%     data2.Panel.ViewB.Comp.hPlotObj.Avg.Visible = 'on';
%     
%     updateAvgB;    
%     % LAV
%     updateLAVBoxParam;
%     data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Visible = 'on';
% 
% %     % viewB axis YLim
% %     data2.Panel.ViewB.Comp.hAxis.ViewB.YLim = [min(yA(:))*.9 max(yA(:))*1.1];
% % 
% %     y1 = min(yA(:))*0.8;
% %     data2.Panel.ViewB.Comp.hPlotObj.LVBox.Position = [0 y1 avgBnP+2 LAVBox.y2-y1];
% % 
% %     % reorder
% %     reorderPlotObj(data2.Panel.ViewB.Comp.hAxis.ViewB);
% 
% end
