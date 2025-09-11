function return_data = frame(fig_nums,data,x)

    data_s = size(data);
    alpha = reshape(data(1,:,:),[data_s(2),data_s(3)]);
    mu = reshape(data(2,:,:),[data_s(2),data_s(3)]);

    figure(fig_nums(1))
    clf
    hold on
    imagesc(x,x,alpha)
    xlim([x(1) x(end)])
    ylim([x(1) x(end)])
    colormap(jet)
    colorbar

    figure(fig_nums(2))
    clf
    hold on
    imagesc(x,x,mu)
    xlim([x(1) x(end)])
    ylim([x(1) x(end)])
    colormap(jet)
    colorbar

    return_data = 1;

end