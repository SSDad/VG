function Callback_Togglebutton_BH(src, evnt)

% global hFig
% global t0 tE tC
% global bBHStart bBHReset
global BHC tmrBH hBHC

str = src.String;
% data = guidata(hFig);
% hBHC = data.Panel.BHC.Comp.Edit.Counter;

if strcmp(str, 'Start')
    
    src.String = ' X';
    src.ForegroundColor = 'r';
    src.BackgroundColor = [1 1 1]*0.2;

    start(tmrBH);
%     
%     bBHStart = 1;
%     
% 
%     tC = BHC;
%     t0 = tic;
%     tE = toc(t0);

%     hBHC.String = num2str(BHC);
    
%     et = toc(t0);
%     bBHReset = false;
%     while (et < tC) & (~bBHReset)
%         pause(0.1);
%         et = toc(t0);
%         hBHC.String = num2str(abs(tC-et), '%0.0f');
%         
%     end
else
    stop(tmrBH);
%     hBHC.String = num2str(BHC, '%0.0f');
% 
%     hBH.String = 'Start';
%     hBH.ForegroundColor = 'g';
%     hBH.BackgroundColor = [1 1 1]*0.25;

%     bBHReset = 1;
end

% src.String = 'Start';
% src.ForegroundColor = 'g';
% src.BackgroundColor = [1 1 1]*0.25;
% 
% hBHC.String = num2str(tC, '%0.0f');
