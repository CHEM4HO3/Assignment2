function [T, P, R2] = eigen_pca(X, num_components)
    % Center and scale data
    X = (X - mean(X)) ./ std(X);
    
    % Compute covariance matrix and eigenvalue decomposition
    [eigenvecs, eigenvals] = eig(X.'*X);
    
    % Sort eigenvalues in descending order and select top num_components eigenvectors
    [sorted_eigenvals, sorted_indices] = sort(diag(eigenvals), 'descend');
    top_eigenvecs = eigenvecs(:, sorted_indices(1:num_components));
    
    % Compute scores and loadings
    T = X * top_eigenvecs;
    P = top_eigenvecs;
    
    % Compute R2 values
    total_var = sum(sorted_eigenvals);
    R2 = cumsum(sorted_eigenvals(1:num_components) / total_var)';

end