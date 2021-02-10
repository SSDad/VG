function fun_tmrBHStop(src, evnt)

global hBH hBHC BHC

    hBHC.String = num2str(BHC, '%0.0f');

    hBH.String = 'Start';
    hBH.ForegroundColor = 'g';
    hBH.BackgroundColor = [1 1 1]*0.25;
