function y = Mynumber(m, n)
  frequency = 0;
  printf("The composite magic numbers in the range are:\n");
  print_comma = false;%this variable decides whether print a comma with a space or not.
  for i = m:n
    if and(check_magic(i) == 1, check_composite(i))
      %if it is the first number, print itself, else print a comma and a space before it.
      if !print_comma
        printf("%d", i);
        print_comma = true;
      else
        printf(", %d", i);
      endif
      frequency++;%calculate the frequency.
    endif
  endfor
  printf("\nFrequency of composite magic numbers in the range is: %d\n", frequency);
endfunction

function y = check_composite(x)
  %1, 2, 3 are all not composite number.
  if x <= 3
    y = false;
    return;
  endif
  
  %check if there's any factor except 1 and x itself.
  for i = 2:x-1
    if mod(x, i) == 0
      y = true;
      return;
    endif
  endfor
  
  %integer x only have two factories (1 and x), x is not a composite number.
  y = false;
endfunction

function y = check_magic(x)
  n = 0;
  %add every digitals of x togather.
  while x != 0
    n = n + mod(x, 10);
    x = fix(x / 10);
  endwhile
  
  %if the sum of every digitals bigger than 9, then add again.
  while fix(n / 10) != 0
    n = check_magic(n);
  endwhile
  
  y = n;
endfunction
