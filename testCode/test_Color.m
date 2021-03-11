clearvars

bgColor = [0 255 255];
boxColor = [0 255 0];
barColor = [255 255 0];

hF = figure(11); clf
hF.Color = 'none';
hA = axes(hF, 'Color', bgColor/255);

hBox = patch('XData', [0 1 1 0], 'YData', [0 0 0.5 0.5], 'FaceColor', boxColor/255, 'EdgeColor', 'none');
hBar1 = patch('XData', [0.2 0.8 0.8 0.2], 'YData', [0.1 0.1 0.2 0.2], 'FaceColor', barColor/255, 'EdgeColor', 'none');
hBar2 = patch('XData', [0.2 0.8 0.8 0.2], 'YData', [0.7 0.7 0.8 0.8], 'FaceColor', barColor/255, 'EdgeColor', 'none');

hA.XLim = [0 1];
hA.YLim = [0 1];
hA.XTick = [];
hA.YTick = [];
