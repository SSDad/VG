function Callback_Popup_Mode(src, evnt)

global bEmu
global tmr
global hFig

data = guidata(hFig);

iMode = src.Value;
if iMode == 1
    bEmu = 0;
    tmr.TimerFcn = @fun_tmr;
    data.Panel.PtInfo.Comp.Edit.MRN.String = 'MRN';
else
    bEmu = 1;
    tmr.TimerFcn = @fun_tmrEmu;
    data.Panel.PtInfo.Comp.Edit.MRN.String = 'Demo';
end

        data.Panel.PtInfo.hPanel.Visible = 'off';
        data.Panel.Collect.hPanel.Visible = 'off';
        data.Panel.WaveBar.hPanel.Visible = 'off';
        data.Panel.ParamButton.hPanel.Visible = 'off';
        data.Panel.Analysis.hPanel.Visible = 'off';