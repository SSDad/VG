function gui_VG

%% global 
global hFig hFig2

% global stopSlither
% global reContL
% global contrastRectLim

%% main window
hFig = figure('MenuBar',            'none', ...
                    'Toolbar',              'none', ...
                    'HandleVisibility',  'callback', ...
                    'Name',                'Visual Guidance - Department of Radiation Oncology, Washington University in St. Louis', ...
                    'NumberTitle',      'off', ...
                    'Units',                 'normalized',...
                    'Position',             [0.1 0.2 0.6 0.6],...
                    'Color',                 'black', ...
                    'CloseRequestFcn', @figCloseReq, ...
                    'Visible',               'on');

% addToolbar(hFig);
                
data.Panel = addPanel(hFig);

data.Panel.Menu.Comp = addComponents2Panel_Menu(data.Panel.Menu.hPanel);
data.Panel.View.Comp = addComponents2Panel_View(data.Panel.View.hPanel);

data.FC = [255 255 102]/255;
data.ActiveAxis.MovePoints = 0;

data.WaveParam.dt = 1/20;
data.WaveParam.T = 30;

guidata(hFig, data);

%% point fig
hFig2 = figure('MenuBar',            'none', ...
                    'Toolbar',              'none', ...
                    'HandleVisibility',  'callback', ...
                    'Name',                '', ...
                    'NumberTitle',      'off', ...
                    'Units',                 'normalized',...
                    'Position',             [0.7 0.2 0.2 0.6],...
                    'Color',                 'black', ...
                   'Visible',               'on');
%                     'CloseRequestFcn', @fig2CloseReq, ...
 
% addToolbar(hFig2);
data2.Panel = addPanel2(hFig2);
data2.Panel.Bar.Comp = addComponents2Panel2_Bar(data2.Panel.Bar.hPanel);
guidata(hFig2, data2);
                               
