function gui_VG

%% global 
global hFig hFig2
global TimeRange
global waveLW boxAlpha
global tC

TimeRange = 30;
waveLW= 3;
boxAlpha = 0.25;
tC = 20;

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
                    'Visible',               'on',...
                    'Tag', 'main');

% addToolbar(hFig);
                
data.Panel = addPanel(hFig);

data.Panel.PtInfo.Comp = addComponents2Panel_PtInfo(data.Panel.PtInfo.hPanel);
data.Panel.Collect.Comp = addComponents2Panel_Collect(data.Panel.Collect.hPanel);
data.Panel.WaveBar.Comp = addComponents2Panel_WaveBar(data.Panel.WaveBar.hPanel);
data.Panel.BH.Comp = addComponents2Panel_BH(data.Panel.BH.hPanel);
data.Panel.BHC.Comp = addComponents2Panel_BHC(data.Panel.BHC.hPanel);
data.Panel.ParamButton.Comp = addComponents2Panel_ParamButton(data.Panel.ParamButton.hPanel);
data.Panel.Analysis.Comp = addComponents2Panel_Analysis(data.Panel.Analysis.hPanel);
data.Panel.Calib.Comp = addComponents2Panel_Calib(data.Panel.Calib.hPanel);
data.Panel.Param.Comp = addComponents2Panel_Param(data.Panel.Param.hPanel);

data.Panel.Wave.Comp = addComponents2Panel_Wave(data.Panel.Wave.hPanel);
data.Panel.Bar.Comp = addComponents2Panel_Bar(data.Panel.Bar.hPanel);

data.FC = [255 255 102]/255;
data.ActiveAxis.MovePoints = 0;

data.WaveParam.dt = 1/20;
data.WaveParam.T = 30;

% save data
fd_VG = fullfile(tempdir, 'VG');
if ~exist(fd_VG, 'dir')
    mkdir(fd_VG);
end
data.fd_VG = fd_VG;

guidata(hFig, data);

%% analysis window
addAnalysisFig;
hFig2.Visible = 'off';