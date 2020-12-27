function Comp = addComponents2Panel_Bar(hPanel)

FC = [255 255 102]/255;
FC = [255 255 255]/255;

% axes
Comp.hAxis.Bar = axes('Parent',                   hPanel, ...
                            'color',        'none',...
                            'Units',                    'normalized', ...
                            'HandleVisibility',     'callback', ...
                            'Position',                  [0.1 0.1 0.85 0.85], ...
                            'Visible', 'off');

hold(Comp.hAxis.Bar, 'on')

Comp.hPlotObj.Bar = rectangle(Comp.hAxis.Bar, 'Position', [0 0 0 0 ], ...
    'EdgeColor', 'y', 'FaceColor', 'y', 'LineWidth', 2);

Comp.hPlotObj.gPatch = patch(Comp.hAxis.Bar, 'XData', [0 0 0 0 ], 'YData', [0 0 0 0 ], ...
    'EdgeColor', 'none', 'FaceColor', 'g', 'FaceAlpha', 0.2);

Comp.hPlotObj.rPatch = patch(Comp.hAxis.Bar, 'XData', [0 0 0 0 ], 'YData', [0 0 0 0 ], ...
    'EdgeColor', 'none', 'FaceColor', 'r', 'FaceAlpha', 0.2);