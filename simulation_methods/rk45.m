function [return_time, return_data] = rk45(inputArg1,inputArg2)
    
    [t,y] = ode45();

    return_time = t;
    return_data = y;
    
end