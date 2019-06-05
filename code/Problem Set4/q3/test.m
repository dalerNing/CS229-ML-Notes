clear all;
tic;
[X_ica, X_pca] = load_images;

%%% PCA
U = pca(X_pca);
plot_pca_filters(U);

%%% ICA

W = ica(X_ica);
plot_ica_filters(W);
toc;