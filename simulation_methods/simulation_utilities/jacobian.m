function return_data = jacobian(f,params)

    sys_L = params.sys_L;

    step = sys_L/length(f);

    lap = [0,  1, 0;
           1, -4, 1;
           0,  1, 0];

    % for periodic boundary conditions
    arr2 = zeros(length(f)+2);
    arr2(2:end-1,2:end-1) = f;
    arr2(1,2:end-1) = f(end,:);
    arr2(end,2:end-1) = f(1,:);
    arr2(2:end-1,1) = f(:,end);
    arr2(2:end-1,end) = f(:,1);

    a = conv2(arr2,lap,"full");
    a = a(3:end-2,3:end-2);

    return_data = step*step*a;

end