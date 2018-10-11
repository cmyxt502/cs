function Astroid(x, num)
  step = x ./ num;
  disp(step)
  axis([-x, x, -x, x], "equal")
  hold on
  for i = 0:num-1
    x1 = [x - i * step, 0]; y1 = [0, i * step]
    x2 = [-x + i * step, 0]; y2 = [0, i * step]
    x3 = [x - i * step, 0]; y3 = [0, -i * step]
    x4 = [-x + i * step, 0]; y4 = [0, -i * step]

    plot(x1, y1)
    plot(x2, y2)
    plot(x3, y3)
    plot(x4, y4)
    
  endfor
  hold off
  
  
  print -djpg astroid.jpg
endfunction
