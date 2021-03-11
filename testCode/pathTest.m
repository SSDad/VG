clearvars;

hd = '\\bjcfs02.carenet.org\rocdata\ROCData';
if exist(hd, 'dir')
    fd_VG = fullfile(hd, 'VIZ');
else
    fd_VG = 'C:\VIZ';
end
