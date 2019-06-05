% load train data
[X_train, y_train] = load_data;

% lwlr
tau = 5;
res = 100;

% plot lwlr
plot_lwlr(X_train, y_train, tau, res);