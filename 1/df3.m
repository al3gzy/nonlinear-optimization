function ret = df3(x)
  x1 = x(1);
  x2 = x(2);
  imen = (1 + x1^2 + x2^2)^2;
  ret = [ x2 * (-x1^2 + x2^2 + 1) / imen; x1 * (x1^2 - x2^2 + 1) / imen ];
end
