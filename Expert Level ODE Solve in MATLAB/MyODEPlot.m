function status = MyODEPlot(~, y, flag)

    status = 0;
    persistent fig plt3

    switch flag
        case 'init'
            fig = figure('Name', 'Ode Plot', 'Units', 'normalized', 'OuterPosition', [0, 0, 1, 1]);
            plt3 = plot3(NaN, NaN, NaN, "LineWidth", 1.5);
            xlabel("x")
            ylabel("y")
            zlabel("z")
            
            grid on
        case ''
            figure(fig)
            plt3.XData = [plt3.XData, y(1, 1)];
            plt3.YData = [plt3.YData, y(2, 1)];
            plt3.ZData = [plt3.ZData, y(3, 1)];
        case 'done'
    end
end