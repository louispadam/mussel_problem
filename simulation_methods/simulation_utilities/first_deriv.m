function return_data = first_deriv(f)
    
    n = length(f);
    row = zeros([1,n]);
    col = zeros([1,n]);
    col(1) = 1;
    col(2) = -1;

    D = toeplitz(col,row);
    D(1,end) = -1;

    return_data = D;

end