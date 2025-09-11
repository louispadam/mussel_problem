function [return_time, return_data] = forward_euler(initial,params)
    
    s_a = size(initial);
    alpha_0 = reshape(initial(1,:,:),[s_a(2),s_a(3)]);
    mu_0 = reshape(initial(2,:,:),[s_a(2),s_a(3)]);

    % Define Temporal parameters
    dt = params.dt;
    t_final = params.tfin;
    sys_L = params.sys_L;
    save_f = params.save_f;

    % Set up iteration
    steps = round(t_final/dt + 1);
    keep = floor(steps/save_f);
    time = zeros([1,save_f]);
    data = zeros([2,save_f,s_a(2),s_a(3)]);
    %time = zeros([1,steps]);
    %data = zeros([2,steps,size(alpha_0)]);
    data(1,1,:,:) = alpha_0;
    data(2,1,:,:) = mu_0;

    alpha = alpha_0;
    mu = mu_0;
    t = 0;

    % Iterate!
    for step = 2:steps

        t = t + dt;
        %time(step) = time(step-1) + dt;

        [dt_alpha, dt_mu] = flow_field(alpha,mu,params);
        alpha = alpha + dt*dt_alpha;
        mu = mu + dt*dt_mu;
        %alpha = data(1,step-1,:,:) + dt*flow_field(1);
        %mu = data(2,step-1,:,:) + dt*flow_field(2);

        %data(1,step,:,:) = mod(alpha,sys_L);
        %data(2,step,:,:) = mod(mu,sys_L);

        if mod(step,keep) == 0
            time(step/keep+1) = t;
            data(1,step/keep+1,:,:) = mod(alpha,sys_L);
            data(2,step/keep+1,:,:) = mod(mu,sys_L);

            fprintf('Done %d out of %d\n', step/keep, save_f);
        end

    end

    return_time = time;
    return_data = data;

end