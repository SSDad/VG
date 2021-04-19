function Comp = addComponents2Panel2_AllWaveCut(hPanel)

h_Gap = 0.1;
nH = 2;
h_C = (1-h_Gap*(nH+1))/nH;
 
w_C = 0.9;
w_Gap = (1-w_C)/2;
 
BC = [1 1 1]*0.25;

%% Cut
y0 = 1-h_Gap-h_C;
Comp.Pushbutton.Cut = uicontrol('parent', hPanel, ...
                                'Style', 'Pushbutton',...
                                'Unit', 'Normalized',...
                                'Position', [w_Gap y0 w_C h_C],...
                                'FontSize', 11, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', BC,...
                                'ForegroundColor', 'c',...
                                'String', 'Range', ...
                                'Visible', 'on', ...
                                'Tag', 'Cut', ...
                                'Callback', @Callback_Pushbutton_AllWaveCut_);
                            
y0 = y0-h_Gap-h_C;
Comp.Pushbutton.Reset = uicontrol('parent', hPanel, ...
                                'Style', 'Pushbutton',...
                                'Unit', 'Normalized',...
                                'Position', [w_Gap y0 w_C h_C],...
                                'FontSize', 11, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', BC,...
                                'ForegroundColor', 'c',...
                                'String', 'Max', ...
                                'Visible', 'on', ...
                                'Tag', 'Reset', ...
                                'Callback', @Callback_Pushbutton_AllWaveCut_);