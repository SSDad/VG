function Comp = addComponents2Panel2_ParamBH(hPanel)

nR = 3;
h_gap = 0.01;
hB = (1-h_gap*(1+nR))/nR;

paramName{1} = 'BH-Time';
paramName{2} = 'BH-Box';
paramName{3} = 'BH-AV';

w_gap = 0.0;
nC = 3;
wB = [0.4 0.3 0.3];
for n = 1:nC
    x(n) = w_gap*n + sum(wB(1:n-1));
end

for n = 1:nR
    yy(n) = h_gap*(nR-n+1)+hB*(nR-n);
end

FS = 10;
for n = 1:nR
    y = yy(n);
    Comp.Text.ParamName(n) = uicontrol('parent', hPanel, ...
                            'Style', 'text',...
                            'String', paramName{n},...
                            'Unit', 'Normalized',...
                            'Position', [x(1) y wB(1) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0,...
                            'ForegroundColor', 'w',...
                            'Visible', 'on', ...
                            'Enable', 'on');
end
Comp.Text.ParamName(2).ForegroundColor = 'm';

for n = 1:nR
    y = yy(n);
    Comp.Text.ParamValue(n) = uicontrol('parent', hPanel, ...
                            'Style', 'text',...
                            'String', paramName{n},...
                            'Unit', 'Normalized',...
                            'Position', [x(2) y wB(2) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', 'k',...
                            'ForegroundColor', 'c',...
                            'Visible', 'on', ...
                            'Enable', 'on');
end

for n = 1:nR
    y = yy(n);
    Comp.Text.ParamValueP(n) = uicontrol('parent', hPanel, ...
                            'Style', 'text',...
                            'String', paramName{n},...
                            'Unit', 'Normalized',...
                            'Position', [x(3) y wB(3) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', 'k',...
                            'ForegroundColor', 'g',...
                            'Visible', 'on', ...
                            'Enable', 'on');
end
Comp.Text.ParamValueP(1).Visible = 'off';
Comp.Text.ParamValueP(2).ForegroundColor = 'c';