function gui_VIZ

%% global 
global hFig
global bEmu
global hFig hFig2
global TimeRange extT
global pps avgNP
global waveLW boxAlpha
global yLim_Wave
global yInit_WaveRect y_WaveRect
global BHC

global tmr
global tmrBH hBHC hBH
global tmrSaveData

bEmu = 0;

TimeRange = 30;
extT = TimeRange/20;
pps = 10;
avgNP = 4;

waveLW= 3;
boxAlpha = 0.25;

yLim_Wave = [-0.1 1];
yInit_WaveRect = [0 0.3];
y_WaveRect = yInit_WaveRect;

BHC = 20;
tAutoSaveData = 30;

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

% save data
% fd_VG = fullfile(tempdir, 'VG');
hd = '\\bjcfs02.carenet.org\rocdata\ROCData';
if exist(hd, 'dir')
    fd_VG = fullfile(hd, 'VIZ');
else
    fd_VG = 'C:\VIZ';
end
% fd_VG = 'C:\VIZ';
if ~exist(fd_VG, 'dir')
    mkdir(fd_VG);
end
data.fd_VG = fd_VG;
data.fd_baseLine =  'C:\VIZ';
data.MRN = [];
guidata(hFig, data);

data.Panel = addPanel(hFig);

data.Panel.PtInfo.Comp = addComponents2Panel_PtInfo(data.Panel.PtInfo.hPanel);
data.Panel.Collect.Comp = addComponents2Panel_Collect(data.Panel.Collect.hPanel);
data.Panel.WaveBar.Comp = addComponents2Panel_WaveBar(data.Panel.WaveBar.hPanel);
data.Panel.BH.Comp = addComponents2Panel_BH(data.Panel.BH.hPanel);
data.Panel.BHC.Comp = addComponents2Panel_BHC(data.Panel.BHC.hPanel);
data.Panel.ParamButton.Comp = addComponents2Panel_ParamButton(data.Panel.ParamButton.hPanel);
data.Panel.TextButton.Comp = addComponents2Panel_TextButton(data.Panel.TextButton.hPanel);
data.Panel.Analysis.Comp = addComponents2Panel_Analysis(data.Panel.Analysis.hPanel);
data.Panel.Mode.Comp = addComponents2Panel_Mode(data.Panel.Mode.hPanel);
data.Panel.Calib.Comp = addComponents2Panel_Calib(data.Panel.Calib.hPanel);
data.Panel.Param.Comp = addComponents2Panel_Param(data.Panel.Param.hPanel);
data.Panel.TextWin.Comp = addComponents2Panel_TextWin(data.Panel.TextWin.hPanel);

data.Panel.TextBox.Comp = addComponents2Panel_TextBox(data.Panel.TextBox.hPanel);

data.Panel.Wave.Comp = addComponents2Panel_Wave(data.Panel.Wave.hPanel);
data.Panel.Bar.Comp = addComponents2Panel_Bar(data.Panel.Bar.hPanel, data.Panel.Wave.Comp);
linkprop([data.Panel.Wave.Comp.hPlotObj.WaveRect, data.Panel.Bar.Comp.hPlotObj.gRect], 'Position');

hBH = data.Panel.BH.Comp.Togglebutton.BH;
hBHC = data.Panel.BHC.Comp.Edit.Counter;

data.FC = [255 255 102]/255;
data.ActiveAxis.MovePoints = 0;

% main timer
tmr = timer;
% tmr.StartFcn = @fun_tmrStart;
tmr.TimerFcn = @fun_tmr;
% tmr.StopFcn = @fun_tmrStop;
TT = 12*60*60;
tmr.Period = 1/pps;
tmr.TasksToExecute = TT*pps;
tmr.ExecutionMode = 'fixedRate';

% BH timer
tmrBH = timer;
tmrBH.TimerFcn = @fun_tmrBH;
tmrBH.StopFcn = @fun_tmrBHStop;
tmrBH.Period = 1;
tmrBH.TasksToExecute = BHC;
tmrBH.ExecutionMode = 'fixedRate';

% save data timer
tmrSaveData = timer;
tmrSaveData.TimerFcn = @fun_tmrSaveData;
tmrSaveData.Period = tAutoSaveData;
tmrSaveData.TasksToExecute = TT/tAutoSaveData;
tmrSaveData.ExecutionMode = 'fixedRate';

guidata(hFig, data);

%% analysis window
addAnalysisFig;
hFig2.Visible = 'off';