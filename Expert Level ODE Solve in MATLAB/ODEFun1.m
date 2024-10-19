function dX = ODEFun1(~, X, Cfg)

    Sigma = Cfg.Sigma;
    Beta  = Cfg.Beta;
    Rho   = Cfg.Rho;

    dX =  [ Sigma * (-X(1) + X(2))
            -X(1) * X(3) + Rho * X(1) - X(2)
             X(1) * X(2) - Beta * X(3)];
end