function [tt, yy, baseLine] = fun_loadLoggerProData(ffn)

bPlot = 0;

fid=fopen(ffn);
tLine = fgetl(fid);
tLines = cell(0,1);
while ischar(tLine)
    tLines{end+1,1} = tLine;
    tLine = fgetl(fid);
end
fclose(fid);

ind = find(contains(tLines, 'ColumnCells', 'IgnoreCase',  true));
tt = str2double(tLines(ind(1)+1:ind(2)-1));
yy = str2double(tLines(ind(3)+1:ind(4)-1));
baseLine = min(yy);