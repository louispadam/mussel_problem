function return_data = flow_field(alpha,mu,params)

    gamma = params.gamma;
    eta = params.eta;
    delta = params.delta;
    big_D = params.big_D;

    jac_alpha = jacobian(alpha);

    alpha_replenishment = gamma*(1-alpha);
    alpha_interaction = -alpha.*mu;
    alpha_diffusion = big_D*jac_alpha;

    dt_alpha = alpha_replenishment + alpha_interaction + alpha_diffusion;

    mu_interaction = eta*alpha.*mu;
    mu_mortality = -delta*mu./(1+mu);
    mu_diffusion = jac_mu;

    dt_mu = mu_interaction + mu_mortality + mu_diffusion;

    return_data = [dt_alpha, dt_mu];

end