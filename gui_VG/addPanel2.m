function Panel = addPanel2(hFig)

w_Menu = 0.075;

w_Table = 0.1;
w_View = (1-w_Table*2)/2;

h_AllWave = 0.1;
h_Wave = 0.4;
h_View = 1-h_Wave-h_AllWave;

%% AllWave
w_Cut = 0.05;
Panel.AllWave.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [0, h_Wave+h_View, 1-w_Cut, h_AllWave], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'none');

%% AllWave cut
Panel.AllWaveCut.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [1-w_Cut, h_Wave+h_View, w_Cut, h_AllWave], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'none');
                            
%% Patient info
Panel.PatientInfo.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [1-w_Menu, h_View+h_Wave*0.6, w_Menu, h_Wave*0.4], ...
                                'Title', '',...
                                'FontSize',                 12,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');
                            
%% Menu
Panel.Menu.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [1-w_Menu, h_View, w_Menu, h_Wave*0.6], ...
                                'Title', '',...
                                'FontSize',                 12,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

%% Wave
Panel.Wave.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [0, h_View, 1-w_Menu, h_Wave], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'none',...
                                'ShadowColor',            'none');
                            
%% Zoom
h_Zoom = 0.04;
w_Zoom = 0.2;
Panel.Zoom.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [(1-w_Zoom)/2, 1-h_Zoom-h_AllWave - 0.01, w_Zoom, h_Zoom], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'none');
                           
%% Pick
Panel.Pick.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [(1-w_Zoom)/2+w_Zoom+0.1 , 1-h_Zoom-h_AllWave - 0.01, 0.2, h_Zoom], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'none',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'none');
                            

h1 = h_View*0.1;
h2 = h_View*0.25;
h3 = h_View*0.2;
h4 = h_View*0.35;
h5 = h_View - h1 - h2 - h3 - h4;
%% avgB param
Panel.ParamBRaw.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [0, h2+h3+h4+h5, w_Table, h1], ...
                                'Title', 'Average Curve (Raw)',...
                                'FontSize',                 9,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');
                            
Panel.ParamBNorm.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [0, h5+h4+h3, w_Table, h2], ...
                                'Title', 'AV (Normalized)',...
                                'FontSize',                 9,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

Panel.ParamBPeriod.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [0, h4+h5, w_Table, h3], ...
                                'Title', 'Period',...
                                'FontSize',                 9,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');
                            
%% avgB table
Panel.TableB.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [0, h5, w_Table, h4], ...
                                'Title', '',...
                                'FontSize',                 11,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

%% deleteB
Panel.DeleteB.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [0, 0, w_Table, h5], ...
                                'Title', '',...
                                'FontSize',                 12,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');


%% avgB
Panel.ViewB.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [w_Table, 0, w_View, h_View], ...
                                'Title', 'Breath (normalized)',...
                                'FontSize',                 12,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

%% avgBH
Panel.ViewBH.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [w_Table+w_View, 0, w_View, h_View], ...
                                'Title', 'Breath Holding (normalized)',...
                                'TitlePosition', 'RightTop', ...
                                'FontSize',                 12,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

%% sync ylim
w_Sync = 0.05;
h_Sync = 0.05;
Panel.SyncYLim.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [w_Table+w_View-w_Sync/2, h_View-h_Sync, w_Sync, h_Sync], ...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');
                            
h1 = h_View*0.3;
h2 = h_View*0.6;
h3 = h_View - h1 - h2;
%% avgBH param
Panel.ParamBH.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [w_Table+w_View*2, h2+h3, w_Table, h1], ...
                                'Title', 'AV (Normalized)',...
                                'FontSize',                 9,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');
                            
%% avgBH table
Panel.TableBH.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [w_Table+w_View*2, h3, w_Table, h2], ...
                                'Title', '',...
                                'FontSize',                 12,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');
                            
%% deleteBH
Panel.DeleteBH.hPanel = uipanel('parent', hFig,...
                                'Unit', 'Normalized',...
                                'Position', [w_Table+w_View*2, 0, w_Table, h3], ...
                                'Title', '',...
                                'FontSize',                 12,...
                                'Units',                     'normalized', ...
                                'visible',                      'on', ...
                                'ForegroundColor',       'w',...
                                'BackgroundColor',       'k', ...
                                'HighlightColor',          'b',...
                                'ShadowColor',            'k');

