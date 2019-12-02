function sim = gaussianKernel(x1, x2, sigma)

  x1 = x1(:); x2 = x2(:);

  % Initalise parameters
  sim = 0;

  %%Return gaussianKernel
  norm = sum( (x1 - x2).^2 );
  sim = exp( -( norm / (2 * sigma^2) ) );

end
