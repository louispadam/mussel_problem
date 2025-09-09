function [return_time, return_data] = forward_euler(inputArg1,inputArg2)

    flow_field(alpha,mu,params);

    alpha = alpha + dt*flow_field(1);
    mu = mu + dt*flow_field(2);

end