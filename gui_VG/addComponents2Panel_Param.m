 function Comp = addComponents2Panel_Param(hPanel)

 global boxLW boxAlpha
 
 h_Gap = 0.01;
 h_ratio = [2.5 1.5 4 1];
 nSubPanel = length(h_ratio);
 h_1 = (1-h_Gap*(nSubPanel+1))/sum(h_ratio);
 
 h_VLimit = h_ratio(1)*h_1;
 h_Time = h_ratio(2)*h_1;
 h_Box = h_ratio(3)*h_1;
 h_About = h_ratio(4)*h_1;
%  h_Gap = (1-h_Collect-h_WaveBar)/3;
 
 w_Button = 0.7;
 w_Gap = (1-w_Button)/2;
 
 FS = 11;
 BC_PB = [1 1 1]*0.25;
 BC_TB = [1 1 1]*0.5;

%% Vertical Limit
y0 = 1;
y0 = y0-h_Gap-h_VLimit;
Comp.subPanel.VLimit.hPanel = uipanel('parent', hPanel,...
                                'Unit', 'Normalized',...
                                'Position', [0, y0, 1, h_VLimit], ...
                                'Title', 'Vertical Limit',...
                                'FontSize',                 10,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

hh_Gap = 0.01;
hh = (1-hh_Gap*4)/3;

ww_Gap = 0.01;
ww = (1-ww_Gap)/2;

y = 1-hh_Gap-hh;
x = ww_Gap;
Comp.subPanel.VLimit.Radiobutton.Auto = uicontrol('parent', Comp.subPanel.VLimit.hPanel, ...
                                'Style', 'radiobutton',...
                                'String', 'Auto',...
                                'Unit', 'Normalized',...
                                'Position', [x y ww hh], ...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', [1 1 1]*0.25,...
                                'ForegroundColor', 'c',...
                                'Value', 1, ...
                                'Visible', 'on', ...
                                'Enable', 'on', ...
                                'Tag', 'VLimitAuto', ...
                                'Callback', @Callback_Radiobutton_VLimit_);

x = x+ww+ww_Gap;
Comp.subPanel.VLimit.Radiobutton.Manual = uicontrol('parent', Comp.subPanel.VLimit.hPanel, ...
                                'Style', 'radiobutton',...
                                'String', 'Manual',...
                                'Unit', 'Normalized',...
                                'Position', [x y ww hh], ...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', [1 1 1]*0.25,...
                                'ForegroundColor', 'c',...
                                'Value', 0, ...
                                'Visible', 'on', ...
                                'Enable', 'on', ...
                                'Tag', 'VLimitManual', ...
                                'Callback', @Callback_Radiobutton_VLimit_);
                            
y = y-hh_Gap-hh;
x = 0.2;
ww = (1-x*2);
Comp.subPanel.VLimit.Edit.High = uicontrol('parent', Comp.subPanel.VLimit.hPanel, ...
                                'Style', 'edit',...
                                'Unit', 'Normalized',...
                                'Position', [x y ww hh],...
                                'FontSize', 12, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'g',...
                                'String', '1', ...
                                'Enable', 'off', ...
                                'Visible', 'on', ...
                                'Tag', 'VLimitHigh', ...
                                'Callback', @Callback_Edit_VLimit_);

y = y-hh_Gap-hh;
Comp.subPanel.VLimit.Edit.Low = uicontrol('parent', Comp.subPanel.VLimit.hPanel, ...
                                'Style', 'edit',...
                                'Unit', 'Normalized',...
                                'Position', [x y ww hh],...
                                'FontSize', 12, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'g',...
                                'String', '0', ...
                                'Enable', 'off', ...
                                'Visible', 'on', ...
                                'Tag', 'VLimitLow', ...
                                'Callback', @Callback_Edit_VLimit_);

%% Time
y0 = y0-h_Gap-h_Time;
Comp.subPanel.Time.hPanel = uipanel('parent', hPanel,...
                                'Unit', 'Normalized',...
                                'Position', [0, y0, 1, h_Time], ...
                                'Title', 'Time Range',...
                                'FontSize',                 10,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

hh_Gap = 0.01;
hh = (1-hh_Gap*4)/3;

ww_Gap = 0.01;
ww = (1-ww_Gap)/2;

Comp.subPanel.Time.Edit.High = uicontrol('parent', Comp.subPanel.Time.hPanel, ...
                                'Style', 'edit',...
                                'Unit', 'Normalized',...
                                'Position', [0.3 0.05 0.3 0.9],...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'g',...
                                'String', '30', ...
                                'Enable', 'on', ...
                                'Visible', 'on', ...
                                'Tag', 'VLimitHigh', ...
                                'Callback', @Callback_Edit_Time_);
                            
Comp.subPanel.Time.Text.s = uicontrol('parent', Comp.subPanel.Time.hPanel, ...
                                'Style', 'text',...
                                'Unit', 'Normalized',...
                                'Position', [0.6 0 0.2 0.8],...
                                'FontSize', 10, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'w',...
                                'String', 's', ...
                                'Visible', 'on');

%% Box
y0 = y0-h_Gap-h_Box;
Comp.subPanel.Box.hPanel = uipanel('parent', hPanel,...
                                'Unit', 'Normalized',...
                                'Position', [0, y0, 1, h_Box], ...
                                'Title', 'Box',...
                                'FontSize',                 10,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

hh_Gap = 0.1;
nH = 3;
hh_C = (1-hh_Gap*(nH+1))/nH;
 
ww_Gap = 0.025;
nW = 2;
ww_C1 = 0.4;
ww_C2 = 1-ww_Gap*(nW+1)-ww_C1;

% height
yy0 = 1-hh_Gap-hh_C;
Comp.subPanel.Box.Text.BoxH = uicontrol('parent', Comp.subPanel.Box.hPanel, ...
                                'Style', 'Text',...
                                'Unit', 'Normalized',...
                                'Position', [ww_Gap yy0 ww_C1 hh_C],...
                                'FontSize', 9, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'w',...
                                'String', 'Height', ...
                                'Visible', 'on');
                            
Comp.subPanel.Box.Edit.BoxH = uicontrol('parent', Comp.subPanel.Box.hPanel, ...
                                'Style', 'edit',...
                                'Unit', 'Normalized',...
                                'Position', [ww_Gap*2+ww_C1 yy0 ww_C2 hh_C],...
                                'FontSize', 11, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'g',...
                                'String', '0', ...
                                'Visible', 'on', ...
                                'Tag', 'BoxH', ...
                                'Callback', @Callback_Edit_Box_);
                            
% Line Width
yy0 = yy0-hh_Gap-hh_C;
Comp.subPanel.Box.Text.LW = uicontrol('parent', Comp.subPanel.Box.hPanel, ...
                                'Style', 'Text',...
                                'Unit', 'Normalized',...
                                'Position', [ww_Gap yy0 ww_C1 hh_C],...
                                'FontSize', 9, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'w',...
                                'String', 'Line Width', ...
                                'Visible', 'on');
                            
Comp.subPanel.Box.Edit.LW = uicontrol('parent', Comp.subPanel.Box.hPanel, ...
                                'Style', 'edit',...
                                'Unit', 'Normalized',...
                                'Position', [ww_Gap*2+ww_C1 yy0 ww_C2 hh_C],...
                                'FontSize', 11, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'g',...
                                'String', num2str(boxLW), ...
                                'Visible', 'on', ...
                                'Tag', 'BoxLW', ...
                                'Callback', @Callback_Edit_Box_);
                            
% alpha
yy0 = yy0-hh_Gap-hh_C;
Comp.subPanel.Box.Text.alpha = uicontrol('parent', Comp.subPanel.Box.hPanel, ...
                                'Style', 'Text',...
                                'Unit', 'Normalized',...
                                'Position', [ww_Gap yy0 ww_C1 hh_C],...
                                'FontSize', 9, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'w',...
                                'String', 'alpha (0-1)', ...
                                'Visible', 'on');
                            
Comp.subPanel.Box.Edit.alpha = uicontrol('parent', Comp.subPanel.Box.hPanel, ...
                                'Style', 'edit',...
                                'Unit', 'Normalized',...
                                'Position', [ww_Gap*2+ww_C1 yy0 ww_C2 hh_C],...
                                'FontSize', 11, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'g',...
                                'String', num2str(boxAlpha), ...
                                'Visible', 'on', ...
                                'Tag', 'BoxAlpha', ...
                                'Callback', @Callback_Edit_Box_);
                            
%% About
y0 = y0-h_Gap-h_About;
Comp.subPanel.About.hPanel = uipanel('parent', hPanel,...
                                'Unit', 'Normalized',...
                                'Position', [0, y0, 1, h_About], ...
                                'Title', '',...
                                'FontSize',                 10,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

Comp.subPanel.About.Pushbutton.About = uicontrol('parent', Comp.subPanel.About.hPanel, ...
                                'Style', 'Pushbutton',...
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
                            
