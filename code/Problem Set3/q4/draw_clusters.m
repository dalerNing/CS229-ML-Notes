function draw_clusters(X, clusters, centroids)

clf;
hold on;


% need to actually handle all the different cases due to bug in octave
if (max(clusters) == 1)
  plot(X(clusters==1,1), X(clusters==1,2), 'b.');
elseif (max(clusters) == 2)
  plot(X(clusters==1,1), X(clusters==1,2), 'b.', ...
    X(clusters==2,1), X(clusters==2,2), 'g.');
elseif (max(clusters) == 3)
  plot(X(clusters==1,1), X(clusters==1,2), 'b.', ...
    X(clusters==2,1), X(clusters==2,2), 'g.', ...
    X(clusters==3,1), X(clusters==3,2), 'r.');
elseif (max(clusters) == 4)
  plot(X(clusters==1,1), X(clusters==1,2), 'bo', ...
    X(clusters==2,1), X(clusters==2,2), 'go', ...
    X(clusters==3,1), X(clusters==3,2), 'ro', ...
    X(clusters==4,1), X(clusters==4,2), 'co');
elseif (max(clusters) == 5)
  plot(X(clusters==1,1), X(clusters==1,2), 'bo', ...
    X(clusters==2,1), X(clusters==2,2), 'go', ...
    X(clusters==3,1), X(clusters==3,2), 'ro', ...
    X(clusters==4,1), X(clusters==4,2), 'co', ...
    X(clusters==5,1), X(clusters==5,2), 'mo');
else
  plot(X(clusters==1,1), X(clusters==1,2), 'bo', ...
    X(clusters==2,1), X(clusters==2,2), 'go', ...
    X(clusters==3,1), X(clusters==3,2), 'ro', ...
    X(clusters==4,1), X(clusters==4,2), 'co', ...
    X(clusters==5,1), X(clusters==5,2), 'mo', ...
    X(clusters==6,1), X(clusters==6,2), 'yo');
end

plot(centroids(:,1), centroids(:,2), 'kx');
  
