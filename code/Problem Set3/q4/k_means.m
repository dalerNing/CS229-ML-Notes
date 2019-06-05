function [clusters, centroids] = k_means(X, k)

    %%% YOUR CODE HERE
    m = size(X, 1);
    n = size(X, 2);

    clusters = zeros(m, 1);
    old_centroids = zeros(k, n);
    centroids = X(ceil(rand(k, 1) * m), :);

    while (norm(old_centroids - centroids) > 1e-5)
        old_centroids = centroids;

        for i = 1:m,
            dists = sum((repmat(X(i, :), k, 1) - centroids).^2, 2);
            [min_dist, clusters(i, 1)] = min(dists);
        end

        draw_clusters(X, clusters, centroids);
        pause(0.1);

        for i = 1:k,
            centroids(i, :) = mean(X(clusters == i, :));
        end

    end
