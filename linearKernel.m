function sim = linearKernel(x1, x2)

  % Transform x1 and x2 to column vectors
  x1 = x1(:); x2 = x2(:);
  
  sim = x1' * x2;

end
