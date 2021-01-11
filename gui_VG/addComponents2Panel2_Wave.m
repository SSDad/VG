function Comp = addComponents2Panel2_Wave(hPanel)

global waveLW

FC = [255 255 102]/255;
FC = [255 255 255]/255;

% axes
Comp.hAxis.Wave = axes('Parent',                   hPanel, ...
                            'color',        'none',...
                            'xcolor', FC,...
                            'ycolor', FC, ...
                            'gridcolor',   FC,...
                            'Units',                    'normalized', ...
                            'HandleVisibility',     'callback', ...
                            'Position',                 [0.04 0.15 0.95 0.75]);

Comp.hAxis.Wave.XLabel.String = 'Time (s)';                        
Comp.hAxis.Wave.YLabel.String = 'Relative Pressure (kPa)';                        
% Comp.hAxis.Image.XAxisLocation='top';
hold(Comp.hAxis.Wave, 'on')

Comp.hPlotObj.Wave = line(Comp.hAxis.Wave, 'XData', [], 'YData', [],...
    'Marker', 'none',  'MarkerSize', 24,...
    'Color', 'y', 'LineStyle', '-', 'LineWidth', 2);

Comp.hPlotObj.WavePickWin = images.roi.Rectangle(Comp.hAxis.Wave, 'Position', [0 0 0 0], 'Color', 'g',...
        'LineWidth', 1, 'FaceAlpha', 0.2, 'Tag', 'WavePickWin', 'Visible', 'off');
addlistener(Comp.hPlotObj.WavePickWin, 'MovingROI', @Callback_WavePickWin);


% Comp.hPlotObj.AvgLine = line(Comp.hAxis.Wave, 'XData', [], 'YData', [],...
%     'Marker', 'none',  'MarkerSize', 24,...
%     'Color', 'r', 'LineStyle', '-', 'LineWidth', 1);