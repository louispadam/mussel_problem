function [return_time, return_data] = forward_euler(initial,params)

    alpha_0 = initial(1,:,:);
    mu_0 = initial(2,:,:);

    % Define Temporal parameters
    dt = params.dt;
    t_final = params.tfin;

    % Set up iteration
    steps = round(t_final/dt + 1);
    time = zeros([1,steps]);
    data = zeros([2,steps,size(alpha_0)]);
    data(1,1,:,:) = alpha_0;
    data(2,1,:,:) = mu_0;

    % Iterate!
    for step = 2:steps

        time(step) = time(step-1) + dt;

        flow_field(alpha,mu,params);
        alpha = data(1,step-1,:,:) + dt*flow_field(1);
        mu = data(2,step-1,:,:) + dt*flow_field(2);

        data(1,step,:,:) = mod(alpha,sys_L);
        data(2,step,:,:) = mod(mu,sys_L);

    end

    return_time = time;
    return_data = data;

end