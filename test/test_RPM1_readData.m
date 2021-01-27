clearvars;

ffn = '012.txt';

fid=fopen(ffn);
tLine = fgetl(fid);
tLines = cell(0,1);
while ischar(tLine)
    tLines{end+1,1} = tLine;
    tLine = fgetl(fid);
end
fclose(fid);

pos{1} = 'Anterior-Posterior';
pos{2} = 'Left-Right';
pos{3} = 'Head-Feet';

for n = 1:3
    
    ort = pos{n};

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
tt(:, n) = junk(:, 1);
yy(:, n) = junk(:, 2);

end

save('dataRPM', 'tt', 'yy', 'pos')

figure(99), clf
plot(tt, yy)
set(gca, 'XLim', [tt(1, 1), tt(end, 1)])
legend(pos)

figure(100), clf
for n = 1:3
    subplot(3, 1, n);
    plot(tt(:, n), yy(:, n));
    set(gca, 'XLim', [tt(1, 1), tt(end, 1)]);
    title(pos{n});
end