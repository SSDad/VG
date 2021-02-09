function Comp = addComponents2Panel_Wave(hPanel)

global waveLW
global TimeRange extT
global yLim_Wave
global y_WaveRect
global boxAlpha

FC = [255 255 102]/255;
FC = [255 255 255]/255;

% Wave
axPos = [0.1 0.1 0.85 0.85];
Comp.hAxis.Wave = axes('Parent',                   hPanel, ...
                            'color',        'none',...
                            'xcolor', FC,...
                            'ycolor', FC, ...
                            'gridcolor',   FC,...
                            'Units',                    'normalized', ...
                            'HandleVisibility',     'callback', ...
                            'Position',     axPos             );

Comp.hAxis.Wave.XLabel.String = 'Time (s)';                        
Comp.hAxis.Wave.YLabel.String = 'Relative Pressure (kPa)';                        
Comp.hAxis.Wave.XLim = [0 TimeRange+extT];
Comp.hAxis.Wave.YLim = [-0.1 1];
Comp.hAxis.Wave.Box='on';
% hold(Comp.hAxis.Wave, 'on')

Comp.hPlotObj.Wave = line(Comp.hAxis.Wave, 'XData', [], 'YData', [],...
    'Marker', 'none',  'MarkerSize', 24,...
    'Color', 'y', 'LineStyle', '-', 'LineWidth', waveLW);

% Box
Comp.hAxis.Box = axes('Parent',                   hPanel, ...
                            'color',        'none',...
                            'xcolor', FC,...
                            'ycolor', FC, ...
                            'gridcolor',   FC,...
                            'Units',                    'normalized', ...
                            'HandleVisibility',     'callback', ...
                            'Position',                 axPos);

Comp.hAxis.Box.XLim = [0 TimeRange+extT];
Comp.hAxis.Box.YLim = yLim_Wave;
Comp.hAxis.Box.XTick = [];
Comp.hAxis.Box.YTick = [];

pos = [-extT y_WaveRect(1) TimeRange+extT*3 diff(y_WaveRect)];
Comp.hPlotObj.WaveRect = images.roi.Rectangle(Comp.hAxis.Box, 'Position', pos, 'Color', 'g',...
        'LineWidth', 1, 'FaceAlpha', boxAlpha, 'Tag', 'WaveRect', 'Visible', 'off');
addlistener(Comp.hPlotObj.WaveRect, 'MovingROI', @Callback_WaveRect);

axes(Comp.hAxis.Box);
linkaxes([Comp.hAxis.Box Comp.hAxis.Wave],'y')

% Comp.hPlotObj.AvgLine = line(Comp.hAxis.Wave, 'XData', [], 'YData', [],...
%     'Marker', 'none',  'MarkerSize', 24,...
%     'Color', 'r', 'LineStyle', '-', 'LineWidth', 1);