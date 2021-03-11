function Callback_Pushbutton_TextSend(src, evnt)

global hFig
data = guidata(hFig);

if strcmp(src.Tag, 'Send')
    data.Panel.TextBox.hPanel.Visible = 'on';
else
    data.Panel.TextWin.Comp.Edit.Text.String = '';
end

data.Panel.TextBox.Comp.Text.Text.String = data.Panel.TextWin.Comp.Edit.Text.String;