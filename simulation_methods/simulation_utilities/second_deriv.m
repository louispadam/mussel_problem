function return_data = second_deriv(f)

    n = length(f);
    row = zeros([1,n]);
    row(1) = -2;
    row(2) = 1;
    row(end) = 1;
    D = toeplitz(row);

    return_data = D;

end