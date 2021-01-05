 function Comp = addComponents2Panel_BH(hPanel)

BC_TB = [1 1 1]*0.5;

Comp.subPanel.WaveBar.Togglebutton.WaveBar = uicontrol('parent', hPanel, ...
                                'Style', 'togglebutton',...
                                'String', 'Start',...
                                'Unit', 'Normalized',...
                                'Position', [0.1 0.2 0.8 0.6], ...
                                'FontSize', 16, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', BC_TB,...
                                'ForegroundColor', 'g',...
                                'Visible', 'on', ...
                                'Enable', 'on', ...
                                'Callback', @Callback_Togglebutton_BH);