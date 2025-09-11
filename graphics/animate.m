function return_data = animate(x,t,y)

    for c = 1:length(t)
        frame([1,2],squeeze(y(:,c,:,:)),x);
        pause(0.1);
    end

    return_data = 1;

end