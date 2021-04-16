clearvars

ffn = 'C:\VIZ\LoggerPro\Romano_FX 1.cmbl';

 [tt, yy, baseLine] = fun_loadLoggerProData(ffn);

 plot(tt, yy, '-')