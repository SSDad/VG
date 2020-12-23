function Callback_Togglebutton_WaveBar(src, evnt)

global hFig
global tt yy tStart
global dyn
global baseLine

str = src.String;
data = guidata(hFig);

if strcmp(str, 'Bar')
    
    src.String = 'Wave';
%     src.ForegroundColor = 'c';
%     src.BackgroundColor = [1 1 1]*0.2;
    
    data.Panel.Wave.hPanel.Visible = 'off';
    data.Panel.Bar.hPanel.Visible = 'on';
else
    src.String = 'Bar';
%     src.ForegroundColor = 'c';
%     src.BackgroundColor = [1 1 1]*0.2;
    
    data.Panel.Bar.hPanel.Visible = 'off';
    data.Panel.Wave.hPanel.Visible = 'on';
end