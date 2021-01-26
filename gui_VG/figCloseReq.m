function figCloseReq(src, callbackdata)

global hFig2 hFig_ThreshSetting

global dyn

% delete object
if exist('dyn')
    if ~isempty(dyn)
        if isvalid(dyn)
            dyn.delete;
        end
    end
end

% close fig2
% if ishandle(hFig2)
    delete(hFig2)
    delete(hFig_ThreshSetting);
% end

% close fig
delete(src)


%    selection = questdlg('Close This Figure?',...
%       'Close Request Function',...
%       'Yes','No','Yes'); 
%    switch selection 
%       case 'Yes'
%          delete(gcf)
%       case 'No'
%       return 
%    end
% end