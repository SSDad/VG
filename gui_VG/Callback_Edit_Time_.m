function Callback_Edit_Time_(src, evnt)

global TimeRange

TimeRange = str2double(src.String);
Comp.hAxis.Box.XLim = [0 TimeRange+extT];
