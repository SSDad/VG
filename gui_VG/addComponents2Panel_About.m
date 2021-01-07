 function Comp = addComponents2Panel_About(hPanel)

 Comp.Pushbutton.About = uicontrol('parent', hPanel, ...
                                'Style', 'pushbutton',...
                                'String', 'About VIZ',...
                                'Unit', 'Normalized',...
                                'Position', [0.25 0.1 0.5 0.8], ...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', [1 1 1]*0.25,...
                                'ForegroundColor', 'c',...
                                'Visible', 'on', ...
                                'Enable', 'on', ...
                                'Callback', @Callback_Pushbutton_About);