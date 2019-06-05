clear all;

X = load('X.dat');
k = 3;
[clusters, centroids] = k_means(X, k);
