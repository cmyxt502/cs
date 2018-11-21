//Computes RAM[0] / RAM[1] and places the round down result in RAM[2]
//x in RAM[0], y in RAM[1] and store the result z in RAM[2]

//  z = 0
//LOOP:
//  x = x - y
//  if y < 0 goto STOP
//  z = z + 1
//  goto LOOP
//STOP:
//  R2 = z
//END:
//  goto END

@z
M=0     //z = 0
@0
D=M
@x
M=D     //x = RAM[0]
@1
D=M
@y
M=D     //y = RAM[1]

(LOOP)
@y
D=M
@x
M=M-D   //x = x - y
D=M
@STOP
D;JLT   //if y < 0 goto STOP
@z
M=M+1   //z = z + 1
@LOOP
0;JMP   //goto LOOP

(STOP)
@z
D=M
@2
M=D     //R2 = z

(END)
@END
0;JMP   //goto END