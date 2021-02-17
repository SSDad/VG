function Comp = addComponents2Panel2_Pick(hPanel)

w_Gap = 0.3;
w_ratio = [1 1];
nSub = length(w_ratio);
wB = (1-w_Gap)/sum(w_ratio);

x(1) = 0;
x(2) = wB+w_Gap;

% for n = 1:nSub
%     w(n) = w_1 * w_ratio(n);
%     x(n) = w_Gap*n+sum(w(1:n-1));
% end

str{1} = 'B';
str{2} = 'BH';

CLR = 'gr';
%% load data
for n = 1:nSub
    Comp.Pushbutton.Pick(n) = uicontrol('parent', hPanel,...
                            'Unit', 'Normalized',...
                            'Position', [x(n), 0.1, wB, 0.8], ...
                            'Style', 'pushbutton',...
                            'String', str{n},...
                            'FontSize', 12, ...
                            'FontWeight', 'bold', ...
                            'BackgroundColor', [1 1 1]*0.25,...
                            'ForegroundColor', CLR(n),...
                            'Value', 1, ...
                            'Visible', 'on', ...
                            'Enable', 'on', ...
                            'Tag', str{n}, ...
                            'Callback', @Callback_Pushbutton_Pick_);
end

% Comp.Pushbutton.Pick(n).Enable = 'off';
