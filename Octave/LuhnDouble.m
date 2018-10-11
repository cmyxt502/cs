function Luhn(x)
  sum = 0;
  d = rem(x, 10); x = fix (x / 10);
  c = rem(x, 10); x = fix (x / 10);
  b = rem(x, 10); x = fix (x / 10);
  a = rem(x, 10); x = fix (x / 10);
  
  printf("%d %d %d %d\n", a, b, c, d);
  
  aa = LuhnDouble(a);
  cc = LuhnDouble(c);
  
  sum = aa + b + cc + d;
  if rem(sum, 10) == 0
    disp("Valid")
  else
    disp("Invalid")
  endif
endfunction

function f = LuhnDouble(x)
  if x * 2 >= 9
    f = x * 2 - 9;
  else
    f = x * 2;
  endif
endfunction
