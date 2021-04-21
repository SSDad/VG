function Comp = addComponents2Panel2_ViewBH(hPanel)

global BoxColor
global wBH avgBnP

wBH = [];

% wgBAll = []; % 

FC = [255 255 102]/255;
FC = [255 255 255]/255;

% axes
Comp.hAxis.ViewBH = axes('Parent',                   hPanel, ...
                            'color',        'none',...
                            'xcolor', FC,...
                            'ycolor', FC, ...
                            'gridcolor',   FC,...
                            'Units',                    'normalized', ...
                            'HandleVisibility',     'callback', ...
                            'Position',                 [0.1 0.1 0.85 0.85]);

Comp.hAxis.ViewBH.XTick = [];
% Comp.hAxis.ViewBH.XLim = [1 avgBnP];
hold(Comp.hAxis.ViewBH, 'on')

Comp.hPlotObj.hg_wiwBH = hggroup(Comp.hAxis.ViewBH);  % active 
Comp.hPlotObj.wiwBH = line(Comp.hAxis.ViewBH, 'XData', [], 'YData', [],...
    'Color', 'g', 'LineStyle', '-', 'LineWidth', 1, 'Tag', 'wiwBH');
Comp.hPlotObj.Avg = line(Comp.hAxis.ViewBH, 'XData', [], 'YData', [],...
    'Color', 'g', 'LineStyle', '-', 'LineWidth', 4, 'Tag', 'avgLine');

Comp.hPlotObj.LAVBoxBH = images.roi.Rectangle(Comp.hAxis.ViewBH, 'Position', [0 0 0 0], 'Color', 'm',...
        'LineWidth', 1, 'FaceAlpha', 0.2, 'Tag', 'LAVBox', 'Visible', 'off', 'Deletable', false);
addlistener(Comp.hPlotObj.LAVBoxBH, 'MovingROI', @Callback_LAVBoxBH);

CLR = 'wwc';
for n = 1:3
    Comp.hPlotObj.BoxText(n) = text(Comp.hAxis.ViewBH, 0, 0, '',   'Color', CLR(n), 'FontSize', 12);
end