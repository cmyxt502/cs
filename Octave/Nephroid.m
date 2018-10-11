function Nephroid(rad, circles)
  theta = linspace(0, 2 * pi, 1000);
  rho = rad.*(theta./theta);
  axis([-3*rad-1, 2*rad, -3*rad, 3*rad ] , "equal");
  polar(theta, rho);
  
  hold on
  
  plot([0, 0], [0, rad])
  plot([0, 0], [0, -rad])
  
  for count = 1: circles
  
    radi = count * (rad / circles);

  
    phi = linspace(0, 3 * pi, 100);
    x = -radi + radi .* cos(phi);
    y = -rad + radi + radi .* sin(phi);

    plot(x, y);
  endfor
  
  print -djpg nephroid.jpg
  
  hold off
endfunction
