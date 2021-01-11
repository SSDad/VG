%% global 
global hFig2
global TimeRange
global waveLW boxAlpha
global tC

TimeRange = 30;
waveLW= 3;
boxAlpha = 0.25;
tC = 20;

%% main window
hFig2 = figure('MenuBar',            'none', ...
                    'Toolbar',              'none', ...
                    'HandleVisibility',  'callback', ...
                    'Name',                'VIZ Analysis', ...
                    'NumberTitle',      'off', ...
                    'Units',                 'normalized',...
                    'Position',             [0.1 0.2 0.8 0.6],...
                    'Color',                 'black', ...
                    'CloseRequestFcn', @fig2CloseReq, ...
                    'Visible',               'on');

% addToolbar(hFig);
                
data2.Panel = addPanel2(hFig2);
data2.Panel.Menu.Comp = addComponents2Panel2_Menu(data2.Panel.Menu.hPanel);
data2.Panel.AllWave.Comp = addComponents2Panel2_AllWave(data2.Panel.AllWave.hPanel);
data2.Panel.Wave.Comp = addComponents2Panel2_Wave(data2.Panel.Wave.hPanel);
data2.Panel.Zoom.Comp = addComponents2Panel2_Zoom(data2.Panel.Zoom.hPanel);
data2.Panel.Pick.Comp = addComponents2Panel2_Pick(data2.Panel.Pick.hPanel);

data2.Panel.ViewB.Comp = addComponents2Panel2_ViewB(data2.Panel.ViewB.hPanel);

% data.Panel.Collect.Comp = addComponents2Panel_Collect(data.Panel.Collect.hPanel);
% data.Panel.WaveBar.Comp = addComponents2Panel_WaveBar(data.Panel.WaveBar.hPanel);
% data.Panel.BH.Comp = addComponents2Panel_BH(data.Panel.BH.hPanel);
% data.Panel.BHC.Comp = addComponents2Panel_BHC(data.Panel.BHC.hPanel);
% data.Panel.ParamButton.Comp = addComponents2Panel_ParamButton(data.Panel.ParamButton.hPanel);
% data.Panel.Analysis.Comp = addComponents2Panel_Analysis(data.Panel.Analysis.hPanel);
% data.Panel.Calib.Comp = addComponents2Panel_Calib(data.Panel.Calib.hPanel);
% data.Panel.Param.Comp = addComponents2Panel_Param(data.Panel.Param.hPanel);
% 
% data.Panel.Bar.Comp = addComponents2Panel_Bar(data.Panel.Bar.hPanel);
% 
% data.FC = [255 255 102]/255;
% data.ActiveAxis.MovePoints = 0;
% 
% data.WaveParam.dt = 1/20;
% data.WaveParam.T = 30;
% 
guidata(hFig2, data2);
% 
% %% analysis window
% addAnalysisFig;