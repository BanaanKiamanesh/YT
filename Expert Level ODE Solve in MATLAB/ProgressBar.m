function status = ProgressBar(t, ~, flag, tSpan)

    status = 0;
    persistent wb

    switch flag
        case 'init'
            wb = waitbar(0, "Initiating the ODE Solve");
        case ''
            % Calc Percent
            Percent = t(1) / tSpan(end);

            % Set to the Wb
            waitbar(Percent, wb, "ODE Solve in Progress.");

        case 'done'
            waitbar(1, wb, "ODE Solve Terminated!");

            pause(1)
            close(wb)
    end
end