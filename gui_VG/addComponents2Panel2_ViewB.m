function Comp = addComponents2Panel2_ViewB(hPanel)

global wgBAll wgColor
wgBAll = [];
wgColor = [0 1 1
                1 1 1
                1 0 1
                1 1 0];
wgColor = [wgColor; rand(100, 3)];            

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
                            'Position',                 [0.1 0.1 0.85 0.85]);

Comp.hAxis.Wave.XLabel.String = '';                        
Comp.hAxis.Wave.YLabel.String = '';                        
% Comp.hAxis.Image.XAxisLocation='top';
hold(Comp.hAxis.ViewB, 'on')

% Comp.hPlotObj.wg = line(Comp.hAxis.ViewB, 'XData', [], 'YData', [],...
%     'Color', 'g', 'LineStyle', '-', 'LineWidth', 1);

Comp.hPlotObj.hg_wgB = hggroup(Comp.hAxis.ViewB);
Comp.hPlotObj.hg_wgBAll = hggroup(Comp.hAxis.ViewB);
Comp.hPlotObj.Avg = line(Comp.hAxis.ViewB, 'XData', [], 'YData', [],...
    'Color', 'r', 'LineStyle', '-', 'LineWidth', 4);