clearvars

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 18);
% insdati = menu('Can you please help me?','Yes','No');

prompt = {'\fontsize{16} Enter suffix:'};
dlgtitle = 'Analysis Suffix';
dims = [1 50];
definput = {''};
opts.Interpreter = 'tex';
suffix = inputdlg(prompt, dlgtitle, dims, definput, opts);

set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);