function Callback_Pushbutton_PatientSearch(src, evnt)

global hFig

data = guidata(hFig);
fd_VG = data.fd_VG;

dname = uigetdir(fd_VG);
if dname ~= 0
    [~, data.MRN] = fileparts(dname);
    data.Panel.PtInfo.Comp.Edit.MRN.String = data.MRN;
    
    guidata(hFig, data);
end