function [rmsvars lowndx rmstrain rmstest] = a2_00000000
% [RMSVARS LOWNDX RMSTRAIN RMSTEST]=A3 finds the RMS errors of
% linear regression of the data in the file "AIRQUALITY.CSV" by treating
% each column as a vector of dependent observations, using the other
% columns of the data as observations of independent varaibles. The
% individual RMS errors are returned in RMSVARS and the index of the
% smallest RMS error is returned in LOWNDX. For the variable that is
% best explained by the other variables, a 5-fold cross validation is
% computed. The RMS errors for the training of each fold are returned
% in RMSTEST and the RMS errors for the testing of each fold are
% returned in RMSTEST.
%
% INPUTS:
%         none
% OUTPUTS:
%         RMSVARS  - 1xN array of RMS errors of linear regression
%         LOWNDX   - integer scalar, index into RMSVALS
%         RMSTRAIN - 1x5 array of RMS errors for 5-fold training
%         RMSTEST  - 1x5 array of RMS errors for 5-fold testing

    filename = 'airquality.csv';
    [rmsvars lowndx] = a2q1(filename);
    [rmstrain rmstest] = a2q2(filename, lowndx)

end

function [rmsvars lowndx] = a2q1(filename)
% [RMSVARS LOWNDX]=A2Q1(FILENAME) finds the RMS errors of
% linear regression of the data in the file FILENAME by treating
% each column as a vector of dependent observations, using the other
% columns of the data as observations of independent varaibles. The
% individual RMS errors are returned in RMSVARS and the index of the
% smallest RMS error is returned in LOWNDX. 
%
% INPUTS:
%         FILENAME - character string, name of file to be processed;
%                    assume that the first row describes the data variables
% OUTPUTS:
%         RMSVARS  - 1xN array of RMS errors of linear regression
%         LOWNDX   - integer scalar, index into RMSVALS

    % Read the test data from a CSV file; find the size of the data
    % %
    % % STUDENT CODE GOES HERE: REMOVE THIS COMMENT
    % %


    % Compute the RMS errors for linear regression
    % %
    % % STUDENT CODE GOES HERE: REMOVE THE NEXT 2 LINES AND THIS COMMENT
    % %
    rmsvars = 0.1*(1:16);
    lowndx = 1;

    % Find the regression in unstandardized variables
    % %
    % % STUDENT CODE GOES HERE: REMOVE THIS COMMENT
    % %

    % Plot the results
    % %
    % % STUDENT CODE GOES HERE: REMOVE THIS COMMENT
    % %

end
function [rmstrain rmstest] = a2q2(filename,lowndx)
% [RMSTRAIN RMSTEST]=A3Q2(LOWNDX) finds the RMS errors of 5-fold
% cross-validation for the variable LOWNDX of the data in the file
% FILENAME. The RMS errors for the training of each fold are returned
% in RMSTEST and the RMS errors for the testing of each fold are
% returned in RMSTEST.
%
% INPUTS:
%         FILENAME - character string, name of file to be processed;
%                    assume that the first row describes the data variables
%         LOWNDX   - integer scalar, index into the data
% OUTPUTS:
%         RMSTRAIN - 1x5 array of RMS errors for 5-fold training
%         RMSTEST  - 1x5 array of RMS errors for 5-fold testing

    % Read the test data from a CSV file; find the size of the data
    % %
    % % STUDENT CODE GOES HERE: REMOVE THIS COMMENT
    % %

    % Create Xmat and yvec from the data and the input parameter,
    % accounting for no standardization of data
    % %
    % % STUDENT CODE GOES HERE: REMOVE THIS COMMENT
    % %

    % Compute the RMS errors of 5-fold cross-validation
    % %
    % % STUDENT CODE GOES HERE: REMOVE THE NEXT 2 LINES AND THIS COMMENT
    % %
    rmstrain = 0.5*ones(1,5);
    rmstest =  0.6*ones(1,5);

end

function [rmstrain,rmstest]=mykfold(Xmat, yvec, k_in)
% [RMSTRAIN,RMSTEST]=MYKFOLD(XMAT,yvec,K) performs a k-fold validation
% of the least-squares linear fit of yvec to XMAT. If K is omitted,
% the default is 5.
%
% INPUTS:
%         XMAT     - MxN data vector
%         yvec     - Mx1 data vector
%         K        - positive integer, number of folds to use
% OUTPUTS:
%         RMSTRAIN - 1xK vector of RMS error of the training fits
%         RMSTEST  - 1xK vector of RMS error of the testing fits

    % Problem size
    M = size(Xmat, 1);

    % Set the number of folds; must be 1<k<M
    if nargin >= 3 & ~isempty(k_in)
        k = max(min(round(k_in), M-1), 2);
    else
        k = 5;
    end

    % Initialize the return variables
    rmstrain = zeros(1, k);
    rmstest  = zeros(1, k);

    % Process each fold
    for ix=1:k
        % %
        % % STUDENT CODE GOES HERE: replace the next 5 lines with code to
        % % (1) set up the "train" and "test" indexing for "xmat" and "yvec"
        % % (2) use the indexing to set up the "train" and "test" data
        % % (3) compute "wvec" for the training data
        % %
        xmat_train  = [0 1];
        yvec_train  = 0;
        wvec = [0 0];
        xmat_test = [0 1];
        yvec_test = 0;

        rmstrain(ix) = rms(xmat_train*wvec - yvec_train);
        rmstest(ix)  = rms(xmat_test*wvec  - yvec_test);
    end

end
