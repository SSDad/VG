function Callback_Pushbutton_TextButton(src, evnt)

global hFig
data = guidata(hFig);

if strcmp(data.Panel.TextWin.hPanel.Visible, 'on')
    data.Panel.TextWin.hPanel.Visible = 'off';
    data.Panel.TextWin.Comp.Edit.Text.String = '';

    data.Panel.TextBox.hPanel.Visible = 'off';
else
    data.Panel.TextWin.hPanel.Visible = 'on';
end
    