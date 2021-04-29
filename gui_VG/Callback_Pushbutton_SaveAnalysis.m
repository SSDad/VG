function Callback_Pushbutton_SaveAnalysis(src, evnt)

% global hFig
global hFig2
global TimeRange
global tMax
global tt yy baseLine
global avgB yBAll periodBAll % all previous wave y and period
global wBH wBHAvg
global LAVBox LAVBoxBH
global paramB paramBH
global Thresh
global pps

addpath(fullfile(pwd, 'inputdlg'));

data2 = guidata(hFig2);
datafn = data2.FileNames.data.fn;
% junk = datafn(1:end-8);
[~, junk, ~]=fileparts(datafn);
analysisfn = [junk, '_Analysis'];
pdffn = [junk, '_Screen'];

% if exist('analysisData', 'var')
%     delete analysisData;
% end

%% data
analysisData.avgB = avgB;
analysisData.yBAll = yBAll;
analysisData.periodBAll = periodBAll;
analysisData.wBH = wBH;
analysisData.wBHAvg = wBHAvg;
analysisData.paramB = paramB;
analysisData.paramBH = paramBH;
analysisData.Thresh = Thresh;
analysisData.pps = pps;
analysisData.LAVBox = LAVBox;
analysisData.LAVBoxBH = LAVBoxBH;

%% boxes
Boxes.Positions.WinOnAllWave = data2.Panel.AllWave.Comp.hPlotObj.WinOnAllWave.Position;
Boxes.Positions.LAVBox = data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Position;
Boxes.Positions.LAVBoxBH = data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Position;

Boxes.BoxB.Wave =   data2.Panel.Wave.Comp.hPlotObj.BoxB;
Boxes.BoxB.AllWave = data2.Panel.AllWave.Comp.hPlotObj.BoxB;
Boxes.BoxBText =  data2.Panel.AllWave.Comp.hPlotObj.BoxBText;

if ~isempty(wBH)
    Boxes.BoxBH.Wave =   data2.Panel.Wave.Comp.hPlotObj.BoxBH;
    Boxes.BoxBH.AllWave = data2.Panel.AllWave.Comp.hPlotObj.BoxBH;
    Boxes.BoxBHText =  data2.Panel.AllWave.Comp.hPlotObj.BoxBHText;
end
analysisData.Boxes = Boxes;

%% Lim
AxisLim.AllWave.XLim = data2.Panel.AllWave.Comp.hAxis.AllWave.XLim;
AxisLim.AllWave.YLim = data2.Panel.AllWave.Comp.hAxis.AllWave.YLim;
AxisLim.Wave.XLim = data2.Panel.Wave.Comp.hAxis.Wave.XLim;
AxisLim.Wave.YLim = data2.Panel.Wave.Comp.hAxis.Wave.YLim;
AxisLim.ViewB.XLim = data2.Panel.ViewB.Comp.hAxis.ViewB.XLim;
AxisLim.ViewB.YLim = data2.Panel.ViewB.Comp.hAxis.ViewB.YLim;
if isfield(Boxes, 'BoxBH')
    AxisLim.ViewBH.XLim = data2.Panel.ViewBH.Comp.hAxis.ViewBH.XLim;
    AxisLim.ViewBH.YLim = data2.Panel.ViewBH.Comp.hAxis.ViewBH.YLim;
end
analysisData.AxisLim = AxisLim;

%% box table
RB.BoxB = data2.Panel.TableB.Comp.Radiobutton.Box;
if isfield(Boxes, 'BoxBH')
    RB.BoxBH = data2.Panel.TableBH.Comp.Radiobutton.Box;
end
analysisData.RB = RB;

%% delete popup
delPU.ListBoxB = data2.Panel.DeleteB.Comp.PopUpMenu.BoxList; 

if isfield(Boxes, 'BoxBH')
    delPU.ListBoxBH = data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList;
end
analysisData.delPU = delPU;

%% save data
% prompt = {'\fontsize{16} Enter suffix:'};
prompt = {'Enter suffix:'};
dlgtitle = 'Analysis Suffix';
dims = [1 50];
definput = {''};
opts.Interpreter = 'tex';
suffix = fun_inputdlg(prompt, dlgtitle, dims, definput, opts);

if ~isempty(suffix)
    save(fullfile(data2.FileNames.data.path, [analysisfn, '_', suffix{1}, '.mat']), 'analysisData')

    ffn = fullfile(data2.FileNames.data.path, [pdffn, '_', suffix{1}, '.pdf']);
    set(hFig2, 'Units', 'Inches');
    pos = get(hFig2, 'Position');
    set(hFig2, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Inches', 'PaperSize', [pos(3), pos(4)])
    print(hFig2, ffn, '-dpdf', '-r0')

    set(hFig2, 'Units', 'normalized');

    msg{1} = '       Analysis has been saved successfully...';
    msg{2} = ' ';
    msgColor = 'g';
    [hMB_saveData] = fun_messageBox('Save Data', msg, msgColor);
end
