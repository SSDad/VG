function fig2CloseReq(src, evnt)

global hFig_ThreshSetting

figHandles = get(0, 'Children');

if isempty(find(contains({figHandles.Tag}, 'main')))
    delete(src)
    delete(hFig_ThreshSetting);
else
    src.Visible = 'off';
end