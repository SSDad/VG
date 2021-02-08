function Comp = addComponents2PanelTS_Thresh(hPanel)

global Thresh

nR = 4;
h_gap = 0.05;
hB = (1-h_gap*(1+nR))/nR;

paramName{1} = 'GAV';
paramName{2} = 'PV';
paramName{3} = 'LAV';
paramName{4} = 'BH-AV';

w_gap = [0 0 0. 0.05 0 0.05];
wC = [0.2 0.3 0.05 0.3 0.05];
nC = numel(wC);
for n = 1:nC
    x(n) = sum(w_gap(1:n)) + sum(wC(1:n-1));
end

for n = 1:nR
    yy(n) = h_gap*(nR-n+1)+hB*(nR-n);
end

FS = 11;
for n = 1:nR
    y = yy(n);
    Comp.Text.ParamName(n) = uicontrol('parent', hPanel, ...
                            'Style', 'text',...
                            'String', paramName{n},...
                            'Unit', 'Normalized',...
                            'Position', [x(1) y wC(1) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0,...
                            'ForegroundColor', 'w',...
                            'Visible', 'on', ...
                            'Enable', 'on');
end

for n = 1:nR
    y = yy(n);
    Comp.Edit.ParamValue(n, 1) = uicontrol('parent', hPanel, ...
                            'Style', 'edit',...
                            'String', num2str(Thresh(n,1)),...
                            'Unit', 'Normalized',...
                            'Position', [x(2) y wC(2) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', 'k',...
                            'ForegroundColor', 'y',...
                            'Visible', 'on', ...
                            'Enable', 'on', ...
                            'Tag', [num2str(n), '1'], ...
                            'Callback', @Callback_Edit_Thresh_);
end

for n = 1:nR
    y = yy(n);
    Comp.Edit.ParamValue(n, 2) = uicontrol('parent', hPanel, ...
                            'Style', 'edit',...
                            'String', num2str(Thresh(n,2)),...
                            'Unit', 'Normalized',...
                            'Position', [x(4) y wC(4) hB], ...
                            'FontSize', FS, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', 'k',...
                            'ForegroundColor', 'r',...
                            'Visible', 'on', ...
                            'Enable', 'on', ...
                            'Tag', [num2str(n), '2'], ...
                            'Callback', @Callback_Edit_Thresh_);
end

for m = [3 5]
    for n = 1:nR
        y = yy(n);
        uicontrol('parent', hPanel, ...
                                'Style', 'text',...
                                'String', '%',...
                                'Unit', 'Normalized',...
                                'Position', [x(m) y wC(m) hB], ...
                                'FontSize', FS, ...
                                'FontWeight', 'bold', ...
                                'BackgroundColor', 'k',...
                                'ForegroundColor', 'w',...
                                'Visible', 'on', ...
                                'Enable', 'on');
    end
end