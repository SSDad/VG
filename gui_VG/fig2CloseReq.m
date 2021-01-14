function fig2CloseReq(src, evnt)

figHandles = get(0, 'Children');

if isempty(find(contains({figHandles.Tag}, 'main')))
    delete(src)
else
    src.Visible = 'off';
end