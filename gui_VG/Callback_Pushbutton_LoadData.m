function Callback_Pushbutton_LoadData(src, evnt)

% global hFig
global hFig2
global TimeRange
global tMax
global tt yy baseLine
global avgB yBAll periodBAll % all previous wave y and period
global wBH wBHAvg
global LAVBox LAVBoxBH
global paramB paramBH
global avgBnP
global BoxColor BoxColorBH
global pps

% data = guidata(hFig);
% fd_VG = data.fd_VG;
data2 = guidata(hFig2);

% fd_VG = fullfile(tempdir, 'VG');

hd = '\\bjcfs02.carenet.org\rocdata\ROCData';
if exist(hd, 'dir')
    fd_VG = fullfile(hd, 'VIZ');
else
    fd_VG = 'C:\VIZ';
end

%% load wave
[fn_Wave, dataPath] = uigetfile(fullfile(fd_VG, '*Wave*'));
data2.FileNames.data.fn = fn_Wave;
data2.FileNames.data.path = dataPath;
guidata(hFig2, data2);

if fn_Wave~=0
    [~, ~, ext] = fileparts(fn_Wave);
    if strcmp(ext, '.mat')
        load(fullfile(dataPath, fn_Wave))
    elseif strcmp(ext, '.txt')
        [tt, yy, baseLine] = fun_loadRPMTxtData(fullfile(dataPath, fn_Wave));
        tt = tt';
        yy = yy';
    end
    tMax = tt(end);

    ind = strfind(fn_Wave, '_');
    data2.Panel.PatientInfo.Comp.Text.MRN.String = fn_Wave(1:ind(1)-1);
    data2.Panel.PatientInfo.Comp.Text.Fx.String = ['Fx - ', fn_Wave(ind(1)+2:ind(2)-1)];
    data2.Panel.PatientInfo.Comp.Text.Time.String = fn_Wave(ind(2)+1:ind(4)-1);
    
    % wave
    hAxWave = data2.Panel.Wave.Comp.hAxis.Wave;
    hWave = data2.Panel.Wave.Comp.hPlotObj.Wave;
    set(hWave, 'XData', tt, 'YData', yy);
    
    hAxWave.XLim(1) = 0;
    if tMax < TimeRange
        hAxWave.XLim(2) = tt(end);
    else
        hAxWave.XLim(2) = TimeRange;
    end
    [~, i1] = min(abs(hAxWave.XLim(1)-tt));
    [~, i2] = min(abs(hAxWave.XLim(2)-tt));
    yMin = min(yy(i1:i2));
    yMax = max(yy(i1:i2));
    junk = (yMax-yMin)/10;
    hAxWave.YLim = [yMin-junk yMax+junk];
    
    % all wave
    hAllWave = data2.Panel.AllWave.Comp.hPlotObj.AllWave;
    set(hAllWave, 'XData', tt, 'YData', yy);
    hAxAllWave = data2.Panel.AllWave.Comp.hAxis.AllWave;
    hAxAllWave.XLim = [tt(1) tt(end)];
    y1 = min(yy);
    y2 = max(yy);
    hAxAllWave.YLim = [y1 y2];

    hWinOnAllWave = data2.Panel.AllWave.Comp.hPlotObj.WinOnAllWave;
    yR = y2-y1;
    hWinOnAllWave.Position = [hAxWave.XLim(1) y1-yR/10 range(hAxWave.XLim) yR+yR/10*2];
    
    % clear B
%     hWaveComp = data2.Panel.Wave.Comp;
%     hAllWaveComp = data2.Panel.AllWave.Comp;
    if isfield(data2.Panel.AllWave.Comp.hPlotObj, 'BoxB')
        delete(data2.Panel.Wave.Comp.hPlotObj.BoxB(:));
        delete(data2.Panel.AllWave.Comp.hPlotObj.BoxB(:));  
        delete(data2.Panel.AllWave.Comp.hPlotObj.BoxBText(:));

        data2.Panel.Wave.Comp.hPlotObj.BoxB(:) = [];
        data2.Panel.AllWave.Comp.hPlotObj.BoxB(:) = [];  
        data2.Panel.AllWave.Comp.hPlotObj.BoxBText(:) = [];

        for n = 1:length(avgB) 
            delete(avgB(n).hg.Children(:)); % avgB waves
            data2.Panel.TableB.Comp.Radiobutton.Box(n).Visible = 'off'; % radio button off
        end
        avgB(1:length(avgB)) = []; % avgB
        yBAll = [];
        periodBAll = [];

        set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'XData', [], 'YData', []); % avg line
        
        data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Position = [0 0 0 0]; % LAV box
        
        %param
        data2.Panel.ParamB.Comp.Text.Param(1).Name(2).String = 'Amp';
        data2.Panel.ParamB.Comp.Text.Param(2).Name(2).String = 'GAV';
        data2.Panel.ParamB.Comp.Text.Param(2).Name(3).String = 'GAV';
        data2.Panel.ParamB.Comp.Text.Param(2).Name(3).ForegroundColor = 'g';

        data2.Panel.ParamB.Comp.Text.Param(3).Name(2).String = 'Box';
        data2.Panel.ParamB.Comp.Text.Param(3).Name(3).String = 'Box';

        data2.Panel.ParamB.Comp.Text.Param(4).Name(2).String = 'LAV';
        data2.Panel.ParamB.Comp.Text.Param(4).Name(3).String = 'LAV';
        data2.Panel.ParamB.Comp.Text.Param(4).Name(3).ForegroundColor = 'g';

        data2.Panel.ParamB.Comp.Text.Param(5).Name(2).String = 'Period';

        data2.Panel.ParamB.Comp.Text.Param(6).Name(2).String = 'PV';
        data2.Panel.ParamB.Comp.Text.Param(6).Name(3).String = 'PV';
        data2.Panel.ParamB.Comp.Text.Param(6).Name(3).ForegroundColor = 'g';
        
        % delete list
        data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.String = 'Box List'; 
        data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.Value = 1; 

    end
    
    % clear BH
    if isfield(data2.Panel.AllWave.Comp.hPlotObj, 'BoxBH')
        delete(data2.Panel.Wave.Comp.hPlotObj.BoxBH(:));
        delete(data2.Panel.AllWave.Comp.hPlotObj.BoxBH(:));
        delete(data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(:));
        data2.Panel.Wave.Comp.hPlotObj.BoxBH(:) = [];
        data2.Panel.AllWave.Comp.hPlotObj.BoxBH(:) = [];  
        data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(:) = [];

        for n = 1:length(wBH) 
            delete(wBH(n).hLine); % avgB waves
%             data2.Panel.TableBH.Comp.Radiobutton.Box(n).Value = 0;
            data2.Panel.TableBH.Comp.Radiobutton.Box(n).Visible = 'off'; % radio button off
        end
        wBH = []; % wBH
        
        set(data2.Panel.ViewBH.Comp.hPlotObj.Avg, 'XData', [], 'YData', []); % avg line
        
        data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Position = [0 0 0 0]; % LAV box
        
        % param
        data2.Panel.ParamBH.Comp.Text.ParamValue(1).String = 'Time';
        data2.Panel.ParamBH.Comp.Text.ParamValue(2).String = 'Box';
        data2.Panel.ParamBH.Comp.Text.ParamValueP(2).String = 'Box';
        data2.Panel.ParamBH.Comp.Text.ParamValue(3).String = 'AV';
        data2.Panel.ParamBH.Comp.Text.ParamValueP(3).String = 'AV';
        data2.Panel.ParamBH.Comp.Text.ParamValueP(3).ForegroundColor = 'g';

        % delete list
        data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.String = 'Box List'; 
        data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.Value = 1; 
    end
    
    guidata(hFig2, data2);
end

%% load analysis
fn_AA = [fn_Wave(1:end-8), 'Analysis*'];
fns = dir(fullfile(dataPath, fn_AA));

if ~isempty(fns)
[fn_Analysis, ~] = uigetfile(fullfile(dataPath, fn_AA));

% affn = fullfile(dataPath, fn_AA);
if fn_Analysis
    load(fullfile(dataPath, fn_Analysis));

    % data
    avgB = analysisData.avgB;
    yBAll = analysisData.yBAll;
    periodBAll = analysisData.periodBAll;
    wBH = analysisData.wBH;
    wBHAvg = analysisData.wBHAvg;
    paramB = analysisData.paramB;
    paramBH = analysisData.paramBH;
    LAVBox =  analysisData.LAVBox;
    LAVBoxBH =  analysisData.LAVBoxBH;

    % boxes
    Boxes = analysisData.Boxes;
    hAxWave = data2.Panel.Wave.Comp.hAxis.Wave;
    hAxAllWave = data2.Panel.AllWave.Comp.hAxis.AllWave;
    
    % boxB
    hB = Boxes.BoxB.AllWave;
    for iB = 1:length(hB)
        pos = Boxes.BoxB.AllWave(iB).Position;
        BoxCLR = Boxes.BoxB.AllWave(iB).EdgeColor;
        data2.Panel.Wave.Comp.hPlotObj.BoxB(iB) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
            'Tag', num2str(iB));
        data2.Panel.AllWave.Comp.hPlotObj.BoxB(iB) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
            'Tag', num2str(iB));
        data2.Panel.AllWave.Comp.hPlotObj.BoxBText(iB) = text(hAxAllWave, pos(1)+pos(3)/2, pos(2)+pos(4)/2, num2str(iB),...
            'Color', BoxCLR, 'FontSize', 24, 'FontWeight', 'bold');
    end
    
    % boxBH
    if isfield(Boxes, 'BoxBH')
        hBH = Boxes.BoxBH.AllWave;
        for iBH = 1:length(hBH)
            pos = Boxes.BoxBH.AllWave(iBH).Position;
            BoxCLR = Boxes.BoxBH.AllWave(iBH).EdgeColor;
            data2.Panel.Wave.Comp.hPlotObj.BoxBH(iBH) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
                'Tag', num2str(iBH));
            data2.Panel.AllWave.Comp.hPlotObj.BoxBH(iBH) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
                'Tag', num2str(iBH));
            data2.Panel.AllWave.Comp.hPlotObj.BoxBHText(iBH) = text(hAxAllWave, pos(1)+pos(3)/3, pos(2)+pos(4)/2, char(iBH+'A'-1),...
                'Color', BoxCLR, 'FontSize', 24, 'FontWeight', 'bold');
        end
    end
    % WaveWin
    data2.Panel.AllWave.Comp.hPlotObj.WinOnAllWave.Position = Boxes.Positions.WinOnAllWave;
    
    % LAVBox
    data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Position = Boxes.Positions.LAVBox;

    if isfield(Boxes, 'BoxBH')
        data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Position = Boxes.Positions.LAVBoxBH;
        data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Visible = 'on';
    end

    % ViewB
    x = 1:avgBnP;
    for iB = 1:length(avgB)
        avgB(iB).hg = hggroup(data2.Panel.ViewB.Comp.hAxis.ViewB);  
        BoxCLR = BoxColor(iB, :);
        for iW = 1:size(avgB(iB).wib.yy, 1)
            line(avgB(iB).hg, 'XData', x, 'YData', avgB(iB).wib.yy(iW, :), 'Color', BoxCLR);
        end
    end
%     set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'XData', x, 'YData', mean(yBAll));
    updateAvgB;
    updateLAVBoxParam;

    RB = analysisData.RB;
    for iB = 1:length(RB.BoxB)
        data2.Panel.TableB.Comp.Radiobutton.Box(iB).Visible = RB.BoxB(iB).Visible;
    end
    
    delPU = analysisData.delPU;
    data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.String = delPU.ListBoxB.String; 
    data2.Panel.DeleteB.Comp.PopUpMenu.BoxList.Value = delPU.ListBoxB.Value; 
    
    % ViewBH
    if isfield(Boxes, 'BoxBH')
        for iBH = 1:length(wBH)
            BoxCLR = BoxColorBH(iBH, :);
            wBH(iBH).hLine = line(data2.Panel.ViewBH.Comp.hAxis.ViewBH,...
                'XData', wBH(iBH).wib.tt, 'YData', wBH(iBH).wib.yy, ...
                'Color', BoxCLR, 'LineStyle', '-', 'LineWidth', 1);
            data2.Panel.TableBH.Comp.Radiobutton.Box(iBH).Visible = RB.BoxBH(iBH).Visible;
            data2.Panel.TableBH.Comp.Radiobutton.Box(iBH).Value = RB.BoxBH(iBH).Value;
        end
        % BH Avg
        set(data2.Panel.ViewBH.Comp.hPlotObj.Avg, 'XData', wBHAvg.tt, 'YData', wBHAvg.yy); 
    
        data2.Panel.ParamBH.Comp.Text.ParamValue(1).String = [num2str(paramBH.Time, 3), 's'];

        data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.String = delPU.ListBoxBH.String; 
        data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.Value = delPU.ListBoxBH.Value; 
    end
    
    % AxisLim
    AxisLim = analysisData.AxisLim;
    % AllWave
    data2.Panel.AllWave.Comp.hAxis.Wave.XLim = AxisLim.AllWave.XLim;
    data2.Panel.AllWave.Comp.hAxis.Wave.YLim = AxisLim.AllWave.YLim ;
    % Wave
    data2.Panel.Wave.Comp.hAxis.Wave.XLim = AxisLim.Wave.XLim;
    data2.Panel.Wave.Comp.hAxis.Wave.YLim = AxisLim.Wave.YLim ;
    % ViewB
    data2.Panel.ViewB.Comp.hAxis.ViewB.XLim = AxisLim.ViewB.XLim;
    data2.Panel.ViewB.Comp.hAxis.ViewB.YLim = AxisLim.ViewB.YLim;
    
    %ViewBH
    if isfield(Boxes, 'BoxBH')
        data2.Panel.ViewBH.Comp.hAxis.ViewBH.XLim = AxisLim.ViewBH.XLim;
        data2.Panel.ViewBH.Comp.hAxis.ViewBH.YLim = AxisLim.ViewBH.YLim;
    end
    
    guidata(hFig2, data2)
    
end
end

