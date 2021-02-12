 function Comp = addComponents2Panel_Mode(hPanel)

Comp.PopUpMenu.Mode = uicontrol('parent', hPanel,...
                                    'Style',  'popupmenu',...
                                    'Units',                          'normalized', ...
                                    'Position',                      [0 -0.2 1 1],...
                                    'ForegroundColor',         [1 1 1],...
                                     'BackgroundColor',         [0 0 0],...
                                    'FontSize',                     12, ...
                                    'FontWeight', 'bold', ...
                                    'String', {'Clinical', 'Demo'}, ...
                                    'Callback', @Callback_Popup_Mode);
