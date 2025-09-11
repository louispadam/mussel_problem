function return_data = gradient_y(f,params)

    sys_L = params.sys_L;

    step = sys_L/length(f);
    
    % for periodic boundary conditions
    s = size(f);
    f2 = zeros([s(1)+2,s(2)]);
    f2(2:end-1,:) = f;
    f2(1,:) = f(end,:);
    f2(end,:) = f(1,:);

    grad = [-1, 1];

    c = conv2(f2,grad.',"full");
    c = c(3:end-1,:);

    return_data = step*c;

end