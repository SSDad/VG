function Callback_Togglebutton_BH(src, evnt)

global hFig
global t0 tE tC
global bBHStart bBHReset

str = src.String;
data = guidata(hFig);
hBHC = data.Panel.BHC.Comp.Edit.Counter;

if strcmp(str, 'Start')
    bBHStart = 1;
    
    src.String = ' X';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;

    tC = str2double(hBHC.String);
    t0 = tic;
    tE = toc(t0);

%     et = toc(t0);
%     bBHReset = false;
%     while (et < tC) & (~bBHReset)
%         pause(0.1);
%         et = toc(t0);
%         hBHC.String = num2str(abs(tC-et), '%0.0f');
%         
%     end
else
    bBHReset = 1;
end

% src.String = 'Start';
% src.ForegroundColor = 'g';
% src.BackgroundColor = [1 1 1]*0.25;
% 
% hBHC.String = num2str(tC, '%0.0f');
