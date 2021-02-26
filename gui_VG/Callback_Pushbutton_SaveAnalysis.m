function Callback_Pushbutton_SaveAnalysis(src, evnt)

% global hFig
global hFig2
global TimeRange
global tMax
global tt yy baseLine
global avgB yBAll periodBAll % all previous wave y and period
global wBH
global LAVBox LAVBoxBH
global paramB paramBH
global Thresh
global pps

data2 = guidata(hFig2);
datafn = data2.FileNames.data.fn;
analysisfn = ['Analysis_', datafn(6:end)];

%% data
analysisData.avgB = avgB;
analysisData.yBAll = yBAll;
analysisData.periodBAll = periodBAll;
analysisData.wBH = wBH;
analysisData.paramB = paramB;
analysisData.paramBH = paramBH;
analysisData.Thresh = Thresh;
analysisData.pps = pps;
analysisData.LAVBox = LAVBox;
analysisData.LAVBoxBH = LAVBoxBH;

%% boxes
Boxes.Positions.WaveWin = data2.Panel.AllWave.Comp.hPlotObj.WaveWin.Position;
Boxes.Positions.LAVBox = data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Position;
Boxes.Positions.LAVBoxBH = data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Position;

Boxes.BoxB.Wave =   data2.Panel.Wave.Comp.hPlotObj.BoxB;
Boxes.BoxB.AllWave = data2.Panel.AllWave.Comp.hPlotObj.BoxB;
Boxes.BoxBText =  data2.Panel.AllWave.Comp.hPlotObj.BoxBText;
Boxes.BoxBH.Wave =   data2.Panel.Wave.Comp.hPlotObj.BoxBH;
Boxes.BoxBH.AllWave = data2.Panel.AllWave.Comp.hPlotObj.BoxBH;
Boxes.BoxBHText =  data2.Panel.AllWave.Comp.hPlotObj.BoxBHText;

analysisData.Boxes = Boxes;

%% Lim
AxisLim.Wave.XLim = data2.Panel.Wave.Comp.hAxis.Wave.XLim;
AxisLim.Wave.YLim = data2.Panel.Wave.Comp.hAxis.Wave.YLim;
AxisLim.ViewB.XLim = data2.Panel.ViewB.Comp.hAxis.ViewB.XLim;
AxisLim.ViewB.YLim = data2.Panel.ViewB.Comp.hAxis.ViewB.YLim;
AxisLim.ViewBH.XLim = data2.Panel.ViewBH.Comp.hAxis.ViewBH.XLim;
AxisLim.ViewBH.YLim = data2.Panel.ViewBH.Comp.hAxis.ViewBH.YLim;
analysisData.AxisLim = AxisLim;

%% box table
RB.BoxB = data2.Panel.TableB.Comp.Radiobutton.Box;
RB.BoxBH = data2.Panel.TableBH.Comp.Radiobutton.Box;
analysisData.RB = RB;

%% delete popup
delPU.ListBoxB = data2.Panel.DeleteB.Comp.PopUpMenu.BoxList; 
delPU.ListBoxBH = data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList;
analysisData.delPU = delPU;

%% save data
save(fullfile(data2.FileNames.data.path, analysisfn), 'analysisData')
%     data2.Panel.Wave.Comp.hPlotObj.BoxB(n) = hWaveComp.hPlotObj.BoxB(n+1);
%     data2.Panel.AllWave.Comp.hPlotObj.BoxB(n) = hAllWaveComp.hPlotObj.BoxB(n+1);
%     data2.Panel.AllWave.Comp.hPlotObj.BoxText(n) = hAllWaveComp.hPlotObj.BoxText(n+1);
% data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.String = BLS; 
% data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.Value = nBox+1; 


msg{1} = '       Analysis has been saved successfully...';
msg{2} = ' ';
msgColor = 'g';
[hMB_saveData] = fun_messageBox('Save Data', msg, msgColor);

