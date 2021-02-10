function Callback_Edit_BHC(src, evnt)

global BHC tmrBH

BHC = str2double(src.String);
tmrBH.TasksToExecute = BHC;

% display(BHC)