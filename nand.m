function y = nand(b, c)
	% input:
	% output:
	if (b == false || c == false)
		printf true;
		printf(" %d %d\n", b, c);
	else
		printf false;
		printf(" %d %d\n", b, c);
	endif
	
endfunction

nand(true, true);
