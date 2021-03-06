function Comp = addComponents2Panel2_ParamB(hPanel)

nR = 6;
h_gap = 0.01;
hB = (1-h_gap*(1+nR))/nR;

paramName{1} = 'Amp';
paramName{2} = 'GAV';
paramName{3} = 'Box';
paramName{4} = 'LAV';
paramName{5} = 'Period';
paramName{6} = 'PV';

w_gap = 0.0;
wB{1} = [0.3 0.3 0.4];
n = 0;
for m = [2 3 4 6]
    n = n+1;
    x{1}(n) = w_gap*n + sum(wB{1}(1:n-1));
end

wB{2} = [0.6 0.4];
n = 0;
for m = [1 5]
    n = n+1;
    x{2}(n) = w_gap*n + sum(wB{2}(1:n-1));
end

for n = 1:nR
    yy(n) = h_gap*(nR-n+1)+hB*(nR-n);
end

FS = 12;
nR = [2 3 4 6];
CLR = 'wcg';
for n = nR
    y = yy(n);
    for m = 1:3
        Comp.Text.Param(n).Name(m) = uicontrol('parent', hPanel, ...
                            'Style', 'text',...
                            'String', paramName{n},...
                            'Unit', 'Normalized',...
                            'Position', [x{1}(m) y wB{1}(m) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0,...
                            'ForegroundColor', CLR(m),...
                            'Visible', 'on', ...
                            'Enable', 'on');
    end
end
Comp.Text.Param(3).Name(1).ForegroundColor = 'm';
Comp.Text.Param(3).Name(3).ForegroundColor = 'c';


nR = [1 5];
for n = nR
    y = yy(n);
    for m = 1:2
        Comp.Text.Param(n).Name(m) = uicontrol('parent', hPanel, ...
                            'Style', 'text',...
                            'String', paramName{n},...
                            'Unit', 'Normalized',...
                            'Position', [x{2}(m) y wB{2}(m) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0,...
                            'ForegroundColor', CLR(m),...
                            'Visible', 'on', ...
                            'Enable', 'on');
    end
end