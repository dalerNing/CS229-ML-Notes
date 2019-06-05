function y = lwlr(X_train, y_train, x, tau)

    %%% YOUR CODE HERE
    m = size(X_train, 1);
    n = size(X_train, 2);

    theta = zeros(n, 1);

    % x 是列向量
    % repmat() 将 x 转换成 X_train
    % 将新生成的矩阵各个元素平方，然后进行行累和
    w = exp(-sum((X_train - repmat(x', m, 1)).^2, 2) / (2 * tau));

    lambda = 1e-4;
    % 牛顿方法
    g = ones(n, 1); % 代价函数的导数

    while (norm(g) > 1e-6)
        h = 1 ./ (1 + exp(-X_train * theta));
        g = X_train' * (w .* (y_train - h)) - lambda * theta;
        H = X_train' * diag(-w .* h .* (1 - h)) * X_train - lambda * eye(n);
        theta = theta - H \ g; %inv(H)*g
    end

    % return predicted y
    y = double(x' * theta > 0);
