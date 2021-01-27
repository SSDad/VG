function [tt, yy, baseLine] = fun_loadRPMTxtData(ffn)

fid=fopen(ffn);
tLine = fgetl(fid);
tLines = cell(0,1);
while ischar(tLine)
    tLines{end+1,1} = tLine;
    tLine = fgetl(fid);
end
fclose(fid);

% ort = 'Anterior-Posterior';
ort = 'Left-Right';
% ort = 'Head-Feet';
idx = find(contains(tLines, ort, 'IgnoreCase',true));
idx = idx(end);

while ~contains(tLines{idx}, 'Time', 'IgnoreCase',true)
    idx = idx+1;
end
idx1 = idx+1;
while ~isempty(tLines{idx})
    idx = idx+1;
end
idx2 = idx -1;

dataCell = tLines(idx1:idx2);

junk = cell2mat(cellfun(@str2num, dataCell, 'UniformOutput', false));
tt = junk(:, 1);
yy = junk(:, 2);

baseLine = 0;

figure(99), clf
plot(tt, yy)