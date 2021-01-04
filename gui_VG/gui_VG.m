function gui_VG

%% global 
global hFig
global TimeRange

% global stopSlither
% global reContL
% global contrastRectLim

%% main window
hFig = figure('MenuBar',            'none', ...
                    'Toolbar',              'none', ...
                    'HandleVisibility',  'callback', ...
                    'Name',                'VIZ - Department of Radiation Oncology, Washington University in St. Louis', ...
                    'NumberTitle',      'off', ...
                    'Units',                 'normalized',...
                    'Position',             [0.1 0.2 0.6 0.6],...
                    'Color',                 'black', ...
                    'CloseRequestFcn', @figCloseReq, ...
                    'Visible',               'on');

% addToolbar(hFig);
                
data.Panel = addPanel(hFig);

data.Panel.Param.Comp = addComponents2Panel_Param(data.Panel.Param.hPanel);

data.Panel.Wave.Comp = addComponents2Panel_Wave(data.Panel.Wave.hPanel);
data.Panel.Bar.Comp = addComponents2Panel_Bar(data.Panel.Bar.hPanel);

data.Panel.Collect.Comp = addComponents2Panel_Collect(data.Panel.Collect.hPanel);

data.Panel.About.Comp = addComponents2Panel_About(data.Panel.About.hPanel);

data.FC = [255 255 102]/255;
data.ActiveAxis.MovePoints = 0;

data.WaveParam.dt = 1/20;
data.WaveParam.T = 30;
TimeRange = 30;

guidata(hFig, data);