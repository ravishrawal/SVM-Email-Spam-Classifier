function x = emailFeatures(word_indices)

  % Total number of words in the dictionary
  n = 1899;

  % Initalise parameter

  x = zeros(n, 1);

  %% Convert word indices into feature vector

  for i = 1:length(word_indices)
    x(word_indices(i), 1) = 1;
  end

end
