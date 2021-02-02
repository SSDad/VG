function Callback_Pushbutton_LoadData(src, evnt)

global hFig hFig2
global TimeRange
global tMax dt
global wgBAll hwgB
global tt yy baseLine

% data = guidata(hFig);
data2 = guidata(hFig2);
fd_VG = fullfile(tempdir, 'VG');

%% load image data
% [matFileName, dataPath] = uigetfile(data.fd_VG);
% [matFileName, dataPath] = uigetfile(fd_VG);

% if matFileName ~=0
%     ffn = fullfile(dataPath, matFileName);

%     ffn = 'data_MRN-Mrn1234567_Fraction-1_DT-20210113-142422-145655_TE_1953.mat';
%     ffn = 'data_MRN-Mrn202101_Fraction-1_DT-20210118-090323-091507_TE_702';
%     ffn = 'data_MRN-Mrn202101_Fraction-2_DT-20210118-091655-092650_TE_595';

ffn = uigetfile({'*.mat', '*.txt'});
% ffn = uigetfile({'*.mat'});

if ffn~=0
    [~, ~, ext] = fileparts(ffn);
    if strcmp(ext, '.mat')
        load(ffn)
    elseif strcmp(ext, '.txt')
        [tt, yy, baseLine] = fun_loadRPMTxtData(ffn);
        tt = tt';
        yy = yy';
        dt = tt(2) - tt(1);
    end
    tMax = tt(end);
    
    % wave
    hAxWave = data2.Panel.Wave.Comp.hAxis.Wave;
    hWave = data2.Panel.Wave.Comp.hPlotObj.Wave;
    set(hWave, 'XData', tt, 'YData', yy-baseLine);
    
    hAxWave.XLim(1) = 0;
    if tMax < TimeRange
        hAxWave.XLim(2) = tt(end);
    else
        hAxWave.XLim(2) = TimeRange;
    end
    
    % all wave
    hAllWave = data2.Panel.AllWave.Comp.hPlotObj.AllWave;
    set(hAllWave, 'XData', tt, 'YData', yy-baseLine);
    hAxAllWave = data2.Panel.AllWave.Comp.hAxis.AllWave;
    hAxAllWave.XLim = [tt(1) tt(end)];
%     hAxAllWave.XLim = [tt(1) 30*60];

    hWaveWin = data2.Panel.AllWave.Comp.hPlotObj.WaveWin;
    hWaveWin.Position = [hAxWave.XLim(1) hAxAllWave.YLim(1)-1 range(hAxWave.XLim) range(hAxAllWave.YLim)+2];
    
    % clear wave group
    hWaveComp = data2.Panel.Wave.Comp;
    hAllWaveComp = data2.Panel.AllWave.Comp;
    if isfield(hAllWaveComp.hPlotObj, 'BoxB')
        delete(hAllWaveComp.hPlotObj.BoxB(:));
        delete(hWaveComp.hPlotObj.BoxB(:));
        wgBAll = [];
        for n = 1:length(hwgB)
            delete(hwgB{n}.Children(:));
        end
        set(data2.Panel.ViewB.Comp.hPlotObj.Avg, 'XData', [], 'YData', []);
    end
end

