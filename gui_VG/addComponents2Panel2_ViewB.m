function Comp = addComponents2Panel2_ViewB(hPanel)

global BoxColor
global avgB avgBnP

avgB = [];

% wgBAll = []; % 

FC = [255 255 102]/255;
FC = [255 255 255]/255;

% axes
Comp.hAxis.ViewB = axes('Parent',                   hPanel, ...
                            'color',        'none',...
                            'xcolor', FC,...
                            'ycolor', FC, ...
                            'gridcolor',   FC,...
                            'Units',                    'normalized', ...
                            'HandleVisibility',     'callback', ...
                            'Position',                 [0.05 0.1 0.85 0.85]);

Comp.hAxis.ViewB.XTick = [];
Comp.hAxis.ViewB.XLim = [1 avgBnP];
hold(Comp.hAxis.ViewB, 'on')

Comp.hPlotObj.hg_wiwB = hggroup(Comp.hAxis.ViewB);  % active 
Comp.hPlotObj.Avg = line(Comp.hAxis.ViewB, 'XData', [], 'YData', [],...
    'Color', 'g', 'LineStyle', '-', 'LineWidth', 6, 'Tag', 'avgLine');

Comp.hPlotObj.LAVBox = images.roi.Rectangle(Comp.hAxis.ViewB, 'Position', [0 0 0 0], 'Color', 'm',...
        'LineWidth', 1, 'FaceAlpha', 0.2, 'Tag', 'LAVBox', 'Visible', 'on', 'Deletable', false);
addlistener(Comp.hPlotObj.LAVBox, 'MovingROI', @Callback_LAVBox);

for n = 1:3
    Comp.hPlotObj.BoxText(n) = text(Comp.hAxis.ViewB, 0, 0, '',   'Color', 'w', 'FontSize', 12);
end