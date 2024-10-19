classdef ODE

    properties
        Sigma = 10;
        Rho = 28;
        Beta = 8/3;
    end

    methods
        function  obj = ODE()
        end

        function dX = Update(obj, ~, X)

            % Unpacking the States
            x = X(1);
            y = X(2);
            z = X(3);


            dX =  [ obj.Sigma * (-x + y)
                    -x * z + obj.Rho * x - y
                     x * y - obj.Beta * z];
        
        end
    end
end