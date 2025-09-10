function [return_time, return_data] = rk45(initial,params)
    
    alpha_0 = initial(1,:,:);
    mu_0 = initial(2,:,:);

    % I'm pretty sure this won't work, and I don't like how it's designed
    [t,y] = ode45(@(a,m,p) reshape(flow_field(a,m,p),2*numel(alpha_0)), ...
                  [0,t_final], ...
                  reshape(initial,[1,2*numel(alpha_0)]));

    % probably should be returning some interpolated solution
    return_time = t;
    return_data = y;
    
end