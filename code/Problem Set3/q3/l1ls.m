function theta = l1l2(X, y, lambda)

    %%% YOUR CODE HERE
    m = size(X, 1);
    n = size(X, 2);

    theta = zeros(n, 1);
    old_theta = ones(n, 1);

    while (norm(theta - old_theta) > 1e-5)
        old_theta = theta;

        for i = 1:n
            theta(i) = 0;
            theta_i(1) = max((-X(:, i)' * (X * theta - y) - lambda) / (X(:, i)' * X(:, i)), 0);
            theta_i(2) = min((-X(:, i)' * (X * theta - y) + lambda) / (X(:, i)' * X(:, i)), 0);

            theta(i) = theta_i(1);
            obj_theta(1) = 0.5 * norm(X * theta - y)^2 + lambda * norm(theta, 1);
            theta(i) = theta_i(2);
            obj_theta(2) = 0.5 * norm(X * theta - y)^2 + lambda * norm(theta, 1);

            [min_obj, min_ind] = min(obj_theta);
            theta(i) = theta_i(min_ind);
        end

    end
