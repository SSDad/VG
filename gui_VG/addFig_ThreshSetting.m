function addFig_ThreshSetting

global hFig2
% global TimeRange dt
% global avgBnP yBAll periodBAll % all previous wave y and period
% global LAVBox
% global BoxColor BoxColorBH
global hFig_ThreshSetting


%% main window
hFig_ThreshSetting = figure('MenuBar',            'none', ...
                    'Toolbar',              'none', ...
                    'HandleVisibility',  'callback', ...
                    'Name',                'Threshhold Setting', ...
                    'NumberTitle',      'off', ...
                    'Units',                 'normalized',...
                    'Position',             [0.7 0.3 0.175 0.3],...
                    'Color',                 'black', ...
                    'CloseRequestFcn', @figCloseReq_ThreshSetting, ...
                    'Visible',               'on', ...
                    'Tag', 'ThreshSetting');

dataTS.Panel.Thresh.hPanel = uipanel('parent', hFig_ThreshSetting,...
                                'Unit', 'Normalized',...
                                'Position', [0, 0.55, 1, 0.45], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'm',...
                                'ShadowColor',            'none');
                
dataTS.Panel.Thresh.Comp = addComponents2PanelTS_Thresh(dataTS.Panel.Thresh.hPanel);
                          
% Abbreviation
hAbbrPanel = uipanel('parent', hFig_ThreshSetting,...
                                'Unit', 'Normalized',...
                                'Position', [0, 0.1, 1, 0.45], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'm',...
                                'ShadowColor',            'none');

str{1} = 'GAV: Global Amplitude Variation';
str{2} = 'LAV: Local Amplitude Variation';
str{3} = 'PV: Period Variation';
str{4} = 'BH-AV: Breath Holding Amplitude Variation';

nR = length(str);           
h_gap = 0.05;
hB = (1-h_gap*(1+nR))/nR;

FS = 11;

for n = 1:nR
    y = h_gap*(nR-n+1)+hB*(nR-n);
    
    uicontrol('parent', hAbbrPanel, ...
                            'Style', 'text',...
                            'String', str{n},...
                            'Unit', 'Normalized',...
                            'Position', [0.05 y .95 hB], ...
                            'HorizontalAlignment', 'Left', ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0,...
                            'ForegroundColor', 'w',...
                            'Visible', 'on');
end
                            
% pps
hppsPanel = uipanel('parent', hFig_ThreshSetting,...
                                'Unit', 'Normalized',...
                                'Position', [0, 0, 1, 0.1], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'm',...
                                'ShadowColor',            'none');
                           
    uicontrol('parent', hppsPanel, ...
                            'Style', 'text',...
                            'String','Wave data is resampled to 10 points/second.' ,...
                            'Unit', 'Normalized',...
                            'Position', [0.025 0 0.95 1], ...
                            'HorizontalAlignment', 'Left', ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0,...
                            'ForegroundColor', 'w',...
                            'Visible', 'on');
                            
                            
                          