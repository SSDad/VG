function figCloseReq(src, callbackdata)

global hFig2
global dyn

% delete object
if isvalid(dyn)
    dyn.delete;
end

% close fig2
if ishandle(hFig2)
    delete(hFig2)
end

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