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