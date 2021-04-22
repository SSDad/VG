function Comp = addComponents2Panel2_ParamB(hPanel)

paramName{1} = 'Amplitude';

nR = length(paramName);
h_gap = 0.01;
hB = (1-h_gap*(1+nR))/nR;

w_gap = 0.0;
wB = [0.4 0.6];
for n = 1:length(wB)
    xx(n) = w_gap*n + sum(wB(1:n-1));
end

for n = 1:nR
    yy(n) = h_gap*(nR-n+1)+hB*(nR-n);
end

FS = 10;
CLR = 'wcg';
for iR = 1:nR
    for m = 1:length(wB)
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