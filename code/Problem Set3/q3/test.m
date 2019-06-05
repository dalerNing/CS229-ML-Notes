[X, y, theta_true] = load_data;

lambda_array = [0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 5, 10];
n = size((lambda_array)');

for i = 1:n
    theta = l1ls(X, y, lambda_array(i));
    tmp = norm(theta - theta_true, 1);
    fprintf('%f\n', tmp);
end
