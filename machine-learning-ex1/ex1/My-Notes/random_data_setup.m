function [train_data, cv_data, test_data] = random_data_setup(data)

    X = data(:, 1); y = data(:, 2);
    m = length(y); % number of training examples
    mtrain = fix(0.60 * m);
    mcv = fix(0.20*m);
    mtest = fix(0.20* m);
    if ((mtest+mtrain+mcv) != m)
        mtrain = mtrain + 1;
    endif

    jumbled_indices = randperm(m);
    start_index=1;
    end_index=start_index + mtrain - 1;
    train_data = data(jumbled_indices(start_index:end_index),:);

    start_index=end_index + 1;
    end_index=start_index + mcv - 1;
    cv_data = data (jumbled_indices(start_index:end_index),:);

    start_index=end_index + 1;
    end_index = start_index + mtest - 1;
    test_data = data(jumbled_indices(start_index:end_index),:);

    % csvwrite ("train_data.csv", train_data);
    % csvwrite ("cv_data.csv", cv_data);
    % csvwrite ("test_data.csv", test_data);

end
