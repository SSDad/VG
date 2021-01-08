function Callback_Pushbutton_LoadData(src, evnt)

global hFig hFig2
global TimeRange
global tMax

data = guidata(hFig);
data2 = guidata(hFig2);

%% load image data
[matFileName, dataPath] = uigetfile(data.fd_VG);

if matFileName ~=0
%     hWB = waitbar(0, 'Loading Images...');

    ffn = fullfile(dataPath, matFileName);
    load(ffn)
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
    hAxAllWave.XLim = [tt(1) 30*60];

    hWaveWin = data2.Panel.AllWave.Comp.hPlotObj.WaveWin;
    hWaveWin.Position = [hAxWave.XLim(1) hAxAllWave.YLim(1)-1 range(hAxWave.XLim) range(hAxAllWave.YLim)+2];
end
%     %%%%%%%%%%%%%%%%%%%%%%%
%     % tumor
%     data.Tumor.gatedContour = gatedContour;
%     data.Tumor.trackContour = trackContour;
%     data.Tumor.refContour = refContour;
%     data.Panel.Tumor.Comp.Pushbutton.Init.Enable = 'on';
%     %%%%%%%%%%%%%%%%%%%%%%%
% 
%     data.FileInfo.DataPath = dataPath;
%     data.FileInfo.MatFile = matFileName;
% 
%     %% load image info
%     Image.Images = imgWrite;
%     nSlices = length(imgWrite);
%     [mImgSize, nImgSize, ~] = size(imgWrite{1});
%     Image.mImgSize = mImgSize;
%     Image.nImgSize = nImgSize;
%     Image.nSlices = nSlices;
% 
%     Image.indSS = 1:nSlices;
%     Image.SliderValue = 1;
%     Image.FreeHandSlice = [];
% 
%     Image.GatedContour = gatedContour;
%     Image.TrackContour = trackContour;
%     Image.RefContour = refContour;
%     % image info
%     Image.x0 = 0;
%     Image.y0 = 0;
% 
%     Image.FoV = str2num(data.Panel.LoadImage.Comp.hEdit.ImageInfo(1).String);
%     Image.dx = Image.FoV/nImgSize;
%     Image.dy = Image.dx;
% 
%     % save image info.
%     ImgInfoD2.FoV = Image.FoV;
%     ImgInfoD2.x0 = 0;
%     ImgInfoD2.y0 = 0;
%     
%     [~, fn1, ~] = fileparts(matFileName);
%     ffn_ImgInfo = fullfile(dataPath, [fn1, '_ImgInfo.mat']);
%     save(ffn_ImgInfo, 'ImgInfoD2');
%     
%     
%     data.Image = Image;
% 
%     data.Panel.LoadImage.Comp.hEdit.ImageInfo(2).String = num2str(nImgSize);
%     data.Panel.LoadImage.Comp.hEdit.ImageInfo(2).ForegroundColor = 'c';
% 
%     data.Panel.LoadImage.Comp.hEdit.ImageInfo(3).String = num2str(Image.dx);
%     data.Panel.LoadImage.Comp.hEdit.ImageInfo(3).ForegroundColor = 'c';
% 
%     % check previously saved snakes
%     [~, fn1, ~] = fileparts(matFileName);
%     ffn_snakes = fullfile(dataPath, [fn1, '_Snake.mat']);
%     data.FileInfo.ffn_snakes = ffn_snakes;
%     if exist(ffn_snakes, 'file')
%         data.Panel.Snake.Comp.Pushbutton.LoadSnake.Enable = 'on';
%     end
%     
%     ffn_SnakePoints = fullfile(dataPath, [fn1, '_SnakePoints.csv']);
%     data.FileInfo.ffn_snakePoints = ffn_SnakePoints;
% 
%     ffn_SnakePointsMatrix = fullfile(dataPath, [fn1, '_SnakePointsMatrix.csv']);
%     data.FileInfo.ffn_snakePointsMatrix = ffn_SnakePointsMatrix;
%     ffn_SnakePointsMatrix2 = fullfile(dataPath, [fn1, '_SnakePointsMatrix2.csv']);
%     data.FileInfo.ffn_snakePointsMatrix2 = ffn_SnakePointsMatrix2;
% 
%     % ffn_points
%     ffn_PointOnSnake = fullfile(dataPath, [fn1, '_PointOnSnake.mat']);
%     data.FileInfo.ffn_PointOnSnake = ffn_PointOnSnake;
% 
%     % ffn_measureData
%     ffn_measureData = fullfile(dataPath, [fn1, '_measureData.mat']);
%     data.FileInfo.ffn_measureData = ffn_measureData;
%     ffn_measureDataFig = fullfile(dataPath, [fn1, '_measureDataFig']);
%     data.FileInfo.ffn_measureDataFig = ffn_measureDataFig;
%     data.FileInfo.ffn_PointData = fullfile(dataPath, [fn1, '_PointData.csv']);
%     
%     data.Snake.Snakes = cell(nSlices, 1);
%     data.Body.Contours = cell(nSlices, 1);
%     data.Body.Abs = cell(nSlices, 1);
% 
%     % ffn_AbsContour
%     ffn_AbsContour = fullfile(dataPath, [fn1, '_AbsContour.mat']);
%     data.FileInfo.ffn_AbsContour = ffn_AbsContour;
% 
%     data.FileInfo.ffn_csv_AbsContour = fullfile(dataPath, [fn1, '_AbsContourMatrix2.csv']);
%     
%     % enable buttons
%     data.Panel.Snake.Comp.Pushbutton.FreeHand.Enable = 'on';
%     data.Panel.Snake.Comp.Pushbutton.StartSlice.Enable = 'on';
%     data.Panel.Snake.Comp.Pushbutton.EndSlice.Enable = 'on';
%     data.Panel.Snake.Comp.Edit.StartSlice.String = '1';
%     data.Panel.Snake.Comp.Edit.EndSlice.String = num2str(nSlices);
%     data.Panel.Snake.Comp.Edit.StartSlice.ForegroundColor = 'r';
%     data.Panel.Snake.Comp.Edit.EndSlice.ForegroundColor = 'r';
% 
%     data.Panel.Body.Comp.Pushbutton.Contour.Enable = 'on';
%     data.Panel.Body.Comp.Togglebutton.Boundary.Enable = 'on';
% 
%     waitbar(1/3, hWB, 'Initializing View...');
% 
%     % CT images
%     sV = 1;
%     nSlices = data.Image.nSlices;
% 
%     I = rot90(Image.Images{sV}, 3);
%     [M, N, ~] = size(I);
% 
%     x0 = Image.x0;
%     y0 = Image.y0;
%     dx = Image.dx;
%     dy = Image.dy;
%     xWL(1) = x0-dx/2;
%     xWL(2) = xWL(1)+dx*N;
%     yWL(1) = y0-dy/2;
%     yWL(2) = yWL(1)+dy*M;
%     RA = imref2d([M N], xWL, yWL);
%     data.Image.RA = RA;
% 
%     hA = data.Panel.View.Comp.hAxis.Image;
%     hPlotObj.Image = imshow(I, RA, 'parent', hA);
%     axis(data.Panel.View.Comp.hAxis.Image, 'tight', 'equal')
% 
%     % snake
%     hPlotObj.Snake = line(hA,...
%         'XData', [], 'YData', [], 'Color', 'm', 'LineStyle', '-', 'LineWidth', 3);
%     hPlotObj.SnakeMask = line(hA,...
%         'XData', [], 'YData', [], 'Color', 'm', 'LineStyle', '-', 'LineWidth', 1);
% 
%     % point on diaphragm
%     hPlotObj.Point = line(hA,...
%         'XData', [], 'YData', [], 'Color', 'g', 'LineStyle', 'none',...
%         'Marker', '.', 'MarkerSize', 24);
% 
%     hPlotObj.LeftPoints = line(hA,...
%             'XData', [], 'YData', [], 'Color', 'g', 'LineStyle', 'none',...
%             'Marker', '.', 'MarkerSize', 16);
% 
%     hPlotObj.RightPoints = line(hA,...
%             'XData', [], 'YData', [], 'Color', 'g', 'LineStyle', 'none',...
%             'Marker', '.', 'MarkerSize', 16);
% 
%     % body
%     hPlotObj.Body = line(hA,...
%         'XData', [], 'YData', [], 'Color', 'g', 'LineStyle', '-', 'LineWidth', 0.5);
% 
%     hPlotObj.Ab = line(hA,...
%         'XData', [], 'YData', [], 'Color', 'r', 'LineStyle', '-', 'LineWidth', 3);
% 
% %     pos = [x0 y0+yWL(2)*2/3
% %             xWL(2) y0+yWL(2)*2/3];
% %     hPlotObj.AbLine1 = images.roi.Line(hA, 'Color', 'g', 'Position', pos, 'LineWidth', 0.5,...
% %         'Tag', 'L1', 'InteractionsAllowed', 'Translate');
% %    addlistener(hPlotObj.AbLine1, 'MovingROI', @Callback_Line_AbL1);
% 
%     pos = [x0 y0+yWL(2)*2/3 xWL(2) yWL(2)/3];
%     hPlotObj.AbRect = images.roi.Rectangle(hA, 'Position', pos, 'Color', 'g',...
%         'LineWidth', .5, 'FaceAlpha', 0.1, 'Tag', 'AbRec', 'Visible', 'off');
%     addlistener(hPlotObj.AbRect, 'MovingROI', @Callback_AbRect);
%     
%     x1 = pos(1);
%     x2 = x1+pos(3);
%     y1 = pos(2)+pos(4)/2;
%     y2 = y1;
%     hPlotObj.AbRectCLine = images.roi.Line(hA, 'Position',[x1 y1; x2 y2], 'Color', 'c',...
%         'LineWidth', 1, 'Tag', 'AbRecCLine', 'Visible', 'off');
%     addlistener(hPlotObj.AbRectCLine, 'MovingROI', @Callback_AbRectCLine);
%   
%     data.Panel.View.Comp.hPlotObj = hPlotObj;
% 
%     % slider
%     hSS = data.Panel.SliceSlider.Comp.hSlider.Slice;
%     hSS.Min = 1;
%     hSS.Max = nSlices;
%     hSS.Value = sV;
%     hSS.SliderStep = [1 10]/(nSlices-1);
% 
%     data.Panel.SliceSlider.Comp.hText.nImages.String = [num2str(sV), ' / ', num2str(nSlices)];
% 
%     waitbar(1, hWB, 'All slices are loaded!');
%     pause(2);
%     close(hWB);
% 
%     % contrast
%     yc = histcounts(I, max(I(:))+1);
%     yc = log10(yc);
%     yc = yc/max(yc);
%     xc = 1:length(yc);
%     xc = xc/max(xc);
% 
%     data.Panel.ContrastBar.Comp.hPlotObj.Hist.XData = xc;
%     data.Panel.ContrastBar.Comp.hPlotObj.Hist.YData = yc;
% 
%     data.Snake.SlitherDone = false;
%     data.Point.InitDone = false;
%     data.Tumor.InitDone = false;
%     
%     data.Body.ContourDone = false;
% 
%     guidata(hFig, data);
%     
%     % tumor profile
%     Callback_Pushbutton_TumorPanel_Init;
%     