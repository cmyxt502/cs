function Cardioid(rad, circles)
  theta = linspace(0, 2 * pi, 1000);
  rho = rad.*(theta./theta);
  polar(theta, rho);
  
  hold on
  
  for count = 1: circles
  
    theta = count * (2 * pi / circles);
    P = rad * cos(theta);
    Q = rad * sin(theta);
    radi = sqrt((rad - P) * (rad - P) + Q * Q);
  
    phi = linspace(0, 3 * pi, 100);
    x = P + radi .* cos(phi);
    y = Q + radi .* sin(phi);
    axis([-3*rad-1, 2*rad, -3*rad, 3*rad ] , "equal");
    plot(x, y);
  endfor
  
  print -djpg cardioid.jpg
  
  hold off
endfunction
