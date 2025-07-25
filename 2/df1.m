function ret = df1(x)
  x1 = x(1);
  x2 = x(2);
  imen = (1 + x1^2 + x2^2)^2;
  ret = [-2*x1 / imen; -2*x2 / imen];
end
