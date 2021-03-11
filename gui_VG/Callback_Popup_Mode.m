function Callback_Popup_Mode(src, evnt)

global bEmu
global tmr
global hFig

global TimeRange extT
global pps waveLW boxAlpha BHC
global yLim_Wave
global yInit_WaveRect y_WaveRect

TimeRange = 30;
extT = TimeRange/20;

pps = 10;
waveLW= 3;
boxAlpha = 0.25;

yLim_Wave = [-0.1 1];
yInit_WaveRect = [0 0.3];
y_WaveRect = yInit_WaveRect;
BHC = 20;

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
data.Panel.TextButton.hPanel.Visible = 'off';

% wave
set(data.Panel.Wave.Comp.hPlotObj.Wave, 'XData', [], 'YData', []);
data.Panel.Wave.Comp.hAxis.Wave.XLim = [0 TimeRange+extT];
data.Panel.Wave.Comp.hAxis.Wave.YLim = yLim_Wave;
data.Panel.Wave.Comp.hPlotObj.Wave.LineWidth = waveLW;

pos = [-extT yInit_WaveRect(1) TimeRange+extT*3 diff(yInit_WaveRect)];
data.Panel.Wave.Comp.hPlotObj.WaveRect.Position = pos;
data.Panel.Wave.Comp.hPlotObj.WaveRect.FaceAlpha = boxAlpha;

%setting
data.Panel.Param.Comp.subPanel.VLimit.Edit.High.String = '1';
data.Panel.Param.Comp.subPanel.VLimit.Edit.Low.String = '-0.1';
data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Auto.Value = 1;
data.Panel.Param.Comp.subPanel.VLimit.Radiobutton.Manual.Value = 0;

data.Panel.Param.Comp.subPanel.TimeRange.Edit.Time.String = num2str(TimeRange);
data.Panel.Param.Comp.subPanel.pps.Edit.pps.String = num2str(pps);
data.Panel.Param.Comp.subPanel.Box.Edit.LW.String = num2str(waveLW);

data.Panel.Param.Comp.subPanel.Box.Edit.BoxHi.String = num2str(y_WaveRect(2));
data.Panel.Param.Comp.subPanel.Box.Edit.BoxLo.String = num2str(y_WaveRect(1));
data.Panel.Param.Comp.subPanel.Box.Edit.alpha.String = num2str(boxAlpha);

data.Panel.Param.hPanel.Visible = 'off';
% data.Panel.Param.
% data.Panel.Param.
% data.Panel.Param.
% data.Panel.Param.