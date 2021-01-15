function Comp = addComponents2Panel2_ViewB(hPanel)

global BoxColor
global avgB

avgB = [];

% wgBAll = []; % 
BoxColor = [0 1 1
                1 0 1];
BoxColor = [BoxColor; rand(10, 3)];            

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

Comp.hAxis.ViewB.XTick = [];                        
hold(Comp.hAxis.ViewB, 'on')

Comp.hPlotObj.hg_wiwB = hggroup(Comp.hAxis.ViewB);  % active 
% Comp.hPlotObj.hg_wgBAll = hggroup(Comp.hAxis.ViewB); % previous
Comp.hPlotObj.Avg = line(Comp.hAxis.ViewB, 'XData', [], 'YData', [],...
    'Color', 'r', 'LineStyle', '-', 'LineWidth', 4);