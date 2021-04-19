clearvars

addpath(fullfile(fileparts(pwd), 'gui_VG'));

fd = 'C:\Users\zhen_\Desktop\temp\EthosART_Patients';
ffn = fullfile(fd, 'Romano_FX 1.csv');

M = readmatrix(ffn);
% 
figure(1), clf
plot(M(:, 1), M(:, 2), '-')