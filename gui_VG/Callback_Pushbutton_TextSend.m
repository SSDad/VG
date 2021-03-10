function Callback_Pushbutton_TextSend(src, evnt)

global hFig
data = guidata(hFig);

data.Panel.TextBox.hPanel.Visible = 'on';
data.Panel.TextBox.Comp.Text.Text.String = data.Panel.TextWin.Comp.Edit.Text.String;