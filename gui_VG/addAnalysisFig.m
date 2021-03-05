function addAnalysisFig

global hFig2
global TimeRange
global avgBnP yBAll periodBAll % all previous wave y and period
global LAVBox
global BoxColor BoxColorBH
global hFig_ThreshSetting
global Thresh
global ViewBYLim ViewBHLim
global ampAvgB
global paramBH
global pps

TimeRange = 30;
avgBnP = 100;
yBAll = [];
periodBAll = [];

LAVBox.y1= [];
LAVBox.y2= [];

BoxColor = [1 0 0
                 0 1 1
                1 0 1
                1 1 0];
BoxColor = [BoxColor; rand(6, 3)];            
BoxColorBH = BoxColor;

Thresh = [7 8
               8 9
               6 7
               10 11];

ViewBYLim = [];           
ViewBHLim = [];

ampAvgB = [];
paramBH.boxH = [];
paramBH.AV = [];

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
                    'Visible',               'on', ...
                    'Tag', 'analysis');

% addToolbar(hFig);
                
data2.Panel = addPanel2(hFig2);

data2.Panel.Menu.Comp = addComponents2Panel2_Menu(data2.Panel.Menu.hPanel);
data2.Panel.PatientInfo.Comp = addComponents2Panel2_PatientInfo(data2.Panel.PatientInfo.hPanel);

data2.Panel.AllWave.Comp = addComponents2Panel2_AllWave(data2.Panel.AllWave.hPanel);
data2.Panel.Wave.Comp = addComponents2Panel2_Wave(data2.Panel.Wave.hPanel);
data2.Panel.Zoom.Comp = addComponents2Panel2_Zoom(data2.Panel.Zoom.hPanel);
data2.Panel.Pick.Comp = addComponents2Panel2_Pick(data2.Panel.Pick.hPanel);

data2.Panel.ViewB.Comp = addComponents2Panel2_ViewB(data2.Panel.ViewB.hPanel);
data2.Panel.TableB.Comp = addComponents2Panel2_TableB(data2.Panel.TableB.hPanel);
data2.Panel.ParamB.Comp = addComponents2Panel2_ParamB(data2.Panel.ParamB.hPanel);
data2.Panel.DeleteB.Comp = addComponents2Panel2_DeleteB(data2.Panel.DeleteB.hPanel);

data2.Panel.ViewBH.Comp = addComponents2Panel2_ViewBH(data2.Panel.ViewBH.hPanel);
data2.Panel.ParamBH.Comp = addComponents2Panel2_ParamBH(data2.Panel.ParamBH.hPanel);
data2.Panel.TableBH.Comp = addComponents2Panel2_TableBH(data2.Panel.TableBH.hPanel);
data2.Panel.DeleteBH.Comp = addComponents2Panel2_DeleteBH(data2.Panel.DeleteBH.hPanel);

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
% data.WaveParam.T = 30;
% 
guidata(hFig2, data2);

addFig_ThreshSetting;
hFig_ThreshSetting.Visible = 'off';