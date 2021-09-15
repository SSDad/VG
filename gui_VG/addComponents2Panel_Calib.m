 function Comp = addComponents2Panel_Calib(hPanel)

global hFig 
data = guidata(hFig);

BC_TB = [1 1 1]*0.5;

% Calib
Comp.Pushbutton.Calib = uicontrol('parent', hPanel, ...
                                'Style', 'pushbutton',...
                                'String', 'Calib',...
                                'Unit', 'Normalized',...
                                'Position', [0. 0.51 0.5 0.48], ...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', BC_TB,...
                                'ForegroundColor', 'c',...
                                'Visible', 'on', ...
                                'Enable', 'on', ...
                                'Callback', @Callback_Pushbutton_Calib);

% Recover
Comp.Pushbutton.Recover = uicontrol('parent', hPanel, ...
                                'Style', 'pushbutton',...
                                'String', 'Load Calib',...
                                'Unit', 'Normalized',...
                                'Position', [0. 0.01 0.5 0.48], ...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', BC_TB,...
                                'ForegroundColor', 'c',...
                                'Visible', 'off', ...
                                'Enable', 'on', ...
                                'Callback', @Callback_Pushbutton_RecoverCalib);

fd_VG = data.fd_VG;
datafn = fullfile(fd_VG, 'BaseLine.mat');
FileInfo = dir(datafn);

if exist(datafn, 'file')
    [Y1, M1, D1, H, MN, S] = datevec(FileInfo.datenum);
    [Y2, M2, D2, H, MN, S] = datevec(now);
    if Y1==Y2 && M1==M2 && D1==D2
        Comp.Pushbutton.Recover.Visible = 'on';
    end
% else
%     Comp.Pushbutton.Recover.Visible = 'off';
end

Comp.Text.CalibValue = uicontrol('parent', hPanel, ...
                                'Style', 'text',...
                                'Unit', 'Normalized',...
                                'Position', [0.5 0.1 0.5 0.8],...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'r',...
                                'String', '0 kPa', ...
                                'Visible', 'on');