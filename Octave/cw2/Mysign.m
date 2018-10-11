function y = Mysign(year)
  n = mod(year, 12);
  switch n
    case 0
      y = 'Monkey';
    case 1
      y = 'Rooster';
    case 2
      y = 'Dog';
    case 3
      y = 'Pig';
    case 4
      y = 'Rat';
    case 5
      y = 'Ox';
    case 6
      y = 'Tiger';
    case 7
      y = 'Rabbit';
    case 8
      y = 'Dragon';
    case 9
      y = 'Snake';
    case 10
      y = 'Horse';
    case 11
      y = 'Sheep';
  end
endfunction