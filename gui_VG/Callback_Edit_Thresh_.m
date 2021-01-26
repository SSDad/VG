function Callback_Edit_Thresh_(src, evnt)

% global hFig_ThreshSetting
global Thresh

Tag = src.Tag;
n = str2num(Tag(1));
m = str2num(Tag(2));
Thresh(n, m) = str2num(src.String);