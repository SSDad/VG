function [LAV] = fun_getLAV(yA, y2, y1)
    
yBLV = [];
yAmean = mean(yA);
for iW = 1:size(yA, 1)
    W = yA(iW, :);
    dd= abs(W-yAmean);
    yBLV = [yBLV dd(W<y2 & W>y1)];
end
[LAV] = sum(yBLV)/numel(yBLV);