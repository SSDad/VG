function saveData

global hFig
global tt yy pps
global baseLine
global startTime

data = guidata(hFig);
fd_VG = data.fd_VG;
MRN = data.Panel.PtInfo.Comp.Edit.MRN.String;
fd_MRN = fullfile(fd_VG, MRN);
if ~exist(fd_MRN, 'dir')
    mkdir(fd_MRN);
end

Fraction = data.Panel.PtInfo.Comp.Edit.Fraction.String;
datafn = fullfile(fd_MRN, [MRN, '_F', Fraction, '_', startTime, '_Wave.mat']);

save(datafn, 'pps', 'tt', 'yy', 'baseLine');