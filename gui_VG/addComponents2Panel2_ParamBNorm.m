function Comp = addComponents2Panel2_ParamBNorm(hPanel)

paramName{1} = 'GAV';
paramName{2} = 'Box';
paramName{3} = 'LAV';
paramName{4} = 'Period';
paramName{5} = 'PV';

nR = length(paramName);
h_gap = 0.01;
hB = (1-h_gap*(1+nR))/nR;

w_gap = 0.0;
wB = [0.3 0.3 0.4];
for n = 1:length(wB)
    xx(n) = w_gap*n + sum(wB(1:n-1));
end

for n = 1:nR
    yy(n) = h_gap*(nR-n+1)+hB*(nR-n);
end

FS = 10;
CLR = 'wcg';
for iR = 1:nR
    for m = 1:3
        Comp.Text.Param(iR).Name(m) = uicontrol('parent', hPanel, ...
                            'Style', 'text',...
                            'String', paramName{iR},...
                            'Unit', 'Normalized',...
                            'Position', [xx(m) yy(iR) wB(m) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0,...
                            'ForegroundColor', CLR(m),...
                            'Visible', 'on', ...
                            'Enable', 'on');
    end
end
Comp.Text.Param(2).Name(1).ForegroundColor = 'm';
Comp.Text.Param(2).Name(3).ForegroundColor = 'c';

Comp.Text.Param(4).Name(3).String = '';