function y = Mymatrix(A)
  disp("A="); disp(A);%Print the original matrix.
  
  %Print the order of the matrix.
  order = length(A);
  printf("The order of the matrix is: %d.\n", order);
  
  max1 = A(1, 1); max2 = A(1, 1);%max1 is the largest element, max2 is the second largest element.
  x1 = 1; y1 = 1; x2 = 1; y2 = 1;%x1, y1 are the row and column position of the largest element; x2, y2 are the row and column position of the second largest element.
  for i = 1:order
    for j = 1:order
      if A(i, j) >= max1%if there's one element bigger than max1, update max1, max2 and there position.
        max2 = max1; max1 = A(i, j);
        x2 = x1; y2 = y1; x1 = i; y1 = j;
      elseif A(i, j) >= max2%if this element isn't bigger than max1, check whether update max2 or not.
        max2 = A(i, j);
        x2 = i; y2 = j;
      endif
    endfor
  endfor
  printf("The largest element %d is in row %d and column %d.\n", max1, x1, y1);
  printf("The second largest element %d is in row %d and column %d.\n", max2, x2, y2);
  
  B = [];%create a new matrix B.
  for i = 1:order
    B(i, :) = sort(A(i, :), "ascend");%sort each row of A and add each sorted row to the new matrix B.
  endfor
  disp("Sorted matrix");
  disp("B="); disp(B);
endfunction
