function saveData

global hFig
global tt yy
global baseLine

data = guidata(hFig);
fd_VG = data.fd_VG;
MRN = data.Panel.PtInfo.Comp.Edit.MRN.String;
fd_MRN = fullfile(fd_VG, MRN);
if ~exist(fd_MRN, 'dir')
    mkdir(fd_MRN);
end

Fraction = data.Panel.PtInfo.Comp.Edit.Fraction.String;
datafn = fullfile(fd_MRN, ['Wave_', MRN, '_F', Fraction, '_', datestr(now,'YYYYmmDD'), '.mat']);

% dt = 1/pps;
% tt = (1:length(yy))*dt;
save(datafn, 'tt', 'yy', 'baseLine');