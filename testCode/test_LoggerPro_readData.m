clearvars

addpath(fullfile(fileparts(pwd), 'gui_VG'));

ffn = 'C:\VIZ\LoggerPro\Romano_FX 1.cmbl';

ffn = 'C:\Users\zhen_\Desktop\temp\EthosART_Patients\Romano_FX 2.cmbl';
[tt, yy, baseLine] = fun_loadLoggerProData(ffn);

figure(1), clf
plot(tt, yy, '-')