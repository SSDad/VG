function Callback_Pushbutton_LoadData(src, evnt)

% global hFig
global hFig2
global TimeRange
global tMax
global tt yy baseLine
global avgB yBAll periodBAll % all previous wave y and period
global wBH
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

% if matFileName ~=0
%     ffn = fullfile(dataPath, matFileName);

%     ffn = 'data_MRN-Mrn1234567_Fraction-1_DT-20210113-142422-145655_TE_1953.mat';
%     ffn = 'data_MRN-Mrn202101_Fraction-1_DT-20210118-090323-091507_TE_702';
%     ffn = 'data_MRN-Mrn202101_Fraction-2_DT-20210118-091655-092650_TE_595';

% ffn = uigetfile({'*.mat'; '*.txt'});
% ffn = uigetfile({'*.mat'});
[ffn, dataPath] = uigetfile(fd_VG);
data2.FileNames.data.fn = ffn;
data2.FileNames.data.path = dataPath;
guidata(hFig2, data2);

if ffn~=0
    [~, ~, ext] = fileparts(ffn);
    if strcmp(ext, '.mat')
        load(fullfile(dataPath, ffn))
    elseif strcmp(ext, '.txt')
        [tt, yy, baseLine] = fun_loadRPMTxtData(fullfile(dataPath, ffn));
        tt = tt';
        yy = yy';
    end
    tMax = tt(end);
    
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
    
    % all wave
    hAllWave = data2.Panel.AllWave.Comp.hPlotObj.AllWave;
    set(hAllWave, 'XData', tt, 'YData', yy);
    hAxAllWave = data2.Panel.AllWave.Comp.hAxis.AllWave;
    hAxAllWave.XLim = [tt(1) tt(end)];
    y1 = min(yy);
    y2 = max(yy);
    hAxAllWave.YLim = [y1 y2];

    hWaveWin = data2.Panel.AllWave.Comp.hPlotObj.WaveWin;
    yR = y2-y1;
    hWaveWin.Position = [hAxWave.XLim(1) y1-yR/10 range(hAxWave.XLim) yR+yR/10*2];
    
    % clear B
    hWaveComp = data2.Panel.Wave.Comp;
    hAllWaveComp = data2.Panel.AllWave.Comp;
    if isfield(hAllWaveComp.hPlotObj, 'BoxB')
        delete(hAllWaveComp.hPlotObj.BoxB(:));  
        delete(hWaveComp.hPlotObj.BoxB(:));
        delete(hAllWaveComp.hPlotObj.BoxBText(:));

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
    if isfield(hAllWaveComp.hPlotObj, 'BoxBH')
        delete(hAllWaveComp.hPlotObj.BoxBH(:));
        delete(hWaveComp.hPlotObj.BoxBH(:));
        delete(hAllWaveComp.hPlotObj.BoxBHText(:));

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
    
end

%% load analysis
analysisfn = ['Analysis_', ffn(6:end)];
affn = fullfile(dataPath, analysisfn);
if exist(affn, 'file')
    load(affn);

    % data
    avgB = analysisData.avgB;
    yBAll = analysisData.yBAll;
    periodBAll = analysisData.periodBAll;
    wBH = analysisData.wBH;
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
        hWaveComp.hPlotObj.BoxB(iB) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
            'Tag', num2str(iB));
        hAllWaveComp.hPlotObj.BoxB(iB) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
            'Tag', num2str(iB));
        hAllWaveComp.hPlotObj.BoxBText(iB) = text(hAxAllWave, pos(1)+pos(3)/2, pos(2)+pos(4)/2, num2str(iB),...
            'Color', BoxCLR, 'FontSize', 24, 'FontWeight', 'bold');
    end
    
    % boxBH
    hBH = Boxes.BoxBH.AllWave;
    for iBH = 1:length(hBH)
        pos = Boxes.BoxBH.AllWave(iBH).Position;
        BoxCLR = Boxes.BoxBH.AllWave(iBH).EdgeColor;
        hWaveComp.hPlotObj.BoxBH(iBH) = rectangle(hAxWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
            'Tag', num2str(iBH));
        hAllWaveComp.hPlotObj.BoxBH(iBH) = rectangle(hAxAllWave, 'Position', pos , 'EdgeColor', BoxCLR, 'LineWidth', 2,...
            'Tag', num2str(iBH));
        hAllWaveComp.hPlotObj.BoxBHText(iBH) = text(hAxAllWave, pos(1)+pos(3)/3, pos(2)+pos(4)/2, char(iBH+'A'-1),...
            'Color', BoxCLR, 'FontSize', 24, 'FontWeight', 'bold');
    end
    data2.Panel.Wave.Comp = hWaveComp;
    data2.Panel.AllWave.Comp = hAllWaveComp;

    % WaveWin
    data2.Panel.AllWave.Comp.hPlotObj.WaveWin.Position = Boxes.Positions.WaveWin;
    
    % AxisLim
    AxisLim = analysisData.AxisLim;
    % Wave
    data2.Panel.Wave.Comp.hAxis.Wave.XLim = AxisLim.Wave.XLim;
    data2.Panel.Wave.Comp.hAxis.Wave.YLim = AxisLim.Wave.YLim ;
    % ViewB
    data2.Panel.ViewB.Comp.hAxis.ViewB.XLim = AxisLim.ViewB.XLim;
    data2.Panel.ViewB.Comp.hAxis.ViewB.YLim = AxisLim.ViewB.YLim;
    %ViewBH
    data2.Panel.ViewBH.Comp.hAxis.ViewBH.XLim = AxisLim.ViewBH.XLim;
    data2.Panel.ViewBH.Comp.hAxis.ViewBH.YLim = AxisLim.ViewBH.YLim;
    
    % LAVBox
    data2.Panel.ViewB.Comp.hPlotObj.LAVBox.Position = Boxes.Positions.LAVBox;
    data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Position = Boxes.Positions.LAVBoxBH;
    data2.Panel.ViewBH.Comp.hPlotObj.LAVBoxBH.Visible = 'on';

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
    for iBH = 1:length(wBH)
        BoxCLR = BoxColorBH(iBH, :);
        wBH(iBH).hLine = line(data2.Panel.ViewBH.Comp.hAxis.ViewBH,...
            'XData', wBH(iBH).wib.tt, 'YData', wBH(iBH).wib.yy, ...
            'Color', BoxCLR, 'LineStyle', '-', 'LineWidth', 1);
        data2.Panel.TableBH.Comp.Radiobutton.Box(iBH).Visible = RB.BoxBH(iBH).Visible;
    end
    
    data2.Panel.ParamBH.Comp.Text.ParamValue(1).String = [num2str(paramBH.Time, 3), 's'];

    data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.String = delPU.ListBoxBH.String; 
    data2.Panel.DeleteBH.Comp.PopUpMenu.BoxList.Value = delPU.ListBoxBH.Value; 
    
    guidata(hFig2, data2)
    
end

