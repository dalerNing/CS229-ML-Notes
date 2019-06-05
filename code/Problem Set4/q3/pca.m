function U = pca(X)

%%% YOUR CODE HERE
[U, S, V] = svd(X*X');

