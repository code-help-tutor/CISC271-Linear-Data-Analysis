function a3_00000000
% Function for CISC271, Winter 2021, Assignment #3

    % %
    % % STUDENT CODE GOES HERE: REMOVE THIS COMMENT
    % % Read the test data from a CSV file
    % % Extract the data matrix and the Y cluster identifiers
    % % Compute the pair of columns of Xmat with the lowest DB index
    % % Compute the PCA's of the data using the SVD; score the clusterings
    % % Display the cluster scores and the indexes; plot the data
    % %

end
function score = dbindex(Xmat, lvec)
% SCORE=DBINDEX(XMAT,LVEC) computes the Davies-Bouldin index
% for a design matrix XMAT by using the values in LVEC as labels.
% The calculation implements a formula in their journal article.
%
% INPUTS:
%        XMAT  - MxN design matrix, each row is an observation and
%                each column is a variable
%        LVEC  - Mx1 label vector, each entry is an observation label
% OUTPUT:
%        SCORE - non-negative scalar, smaller is "better" separation

    % Anonymous function for Euclidean norm of observations
    rownorm = @(xmat) sqrt(sum(xmat.^2, 2));

    % Problem: unique labels and how many there are
    kset = unique(lvec);
    k = length(kset);

    % Loop over all indexes and accumulate the DB score of each cluster
    % gi is the cluster centroid
    % mi is the mean distance from the centroid
    % Di contains the distance ratios between IX and each other cluster
    D = [];
    for ix = 1:k
        Xi = Xmat(lvec==kset(ix), :);
        gi = mean(Xi);
        mi = mean(rownorm(Xi - gi));
        Di = [];
        for jx = 1:k
            if jx~=ix
                Xj = Xmat(lvec==kset(jx), :);
                gj = mean(Xj);
                mj = mean(rownorm(Xj - gj));
                Di(end+1) = (mi + mj)/norm(gi - gj);
            end
        end
        D(end+1) = max(Di);
    end

    % DB score is the mean of the scores of the clusters
    score = mean(D);
end
