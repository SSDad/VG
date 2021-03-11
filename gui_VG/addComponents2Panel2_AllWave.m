function Comp = addComponents2Panel2_AllWave(hPanel)

FC = [255 255 102]/255;
FC = [255 255 255]/255;

% axes
Comp.hAxis.AllWave = axes('Parent',                   hPanel, ...
                            'color',        'none',...
                            'xcolor', FC,...
                            'ycolor', FC, ...
                            'gridcolor',   FC,...
                            'Units',                    'normalized', ...
                            'HandleVisibility',     'callback', ...
                            'Position',                 [0 0 1 1]);

axis(Comp.hAxis.AllWave, 'off');

% Comp.hAxis.Wave.XLabel.String = 'Time (s)';                        
% Comp.hAxis.Wave.YLabel.String = 'Relative Pressure (kPa)';                        
% Comp.hAxis.Image.XAxisLocation='top';

hold(Comp.hAxis.AllWave, 'on')

Comp.hPlotObj.AllWave = line(Comp.hAxis.AllWave, 'XData', [], 'YData', [],...
    'Marker', 'none',  'MarkerSize', 24,...
    'Color', 'y', 'LineStyle', '-', 'LineWidth', 1);

pos = [0 0 0 0];
Comp.hPlotObj.WinOnAllWave = images.roi.Rectangle(Comp.hAxis.AllWave, 'Position', pos, 'Color', 'c',...
        'LineWidth', 2, 'FaceAlpha', 0.4, 'Tag', 'WaveRect', 'Visible', 'on');
addlistener(Comp.hPlotObj.WinOnAllWave, 'MovingROI', @Callback_WinOnAllWave);

Comp.hPlotObj.CutOnAllWave = images.roi.Rectangle(Comp.hAxis.AllWave, 'Position', pos, 'Color', 'g',...
        'LineWidth', 2, 'FaceAlpha', 0, 'Tag', 'AllWaveCut', 'Visible', 'on');