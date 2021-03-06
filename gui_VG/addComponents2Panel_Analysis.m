 function Comp = addComponents2Panel_Analysis(hPanel)

 Comp.Pushbutton.Analysis = uicontrol('parent', hPanel, ...
                                'Style', 'pushbutton',...
                                'String', 'Analysis',...
                                'Unit', 'Normalized',...
                                'Position', [0. 0.2 1 0.6], ...
                                'FontSize', 11, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', [1 1 1]*0.25,...
                                'ForegroundColor', 'y',...
                                'Visible', 'on', ...
                                'Enable', 'on', ...
                                'Callback', @Callback_Pushbutton_Analysis);