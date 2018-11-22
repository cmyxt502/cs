//x in RAM[0], operation code in RAM[1], y in RAM[2], '=' in RAM[3] and the result z in RAM[4]



//    z = 0
//  LOOP:
//    x = x - y
//    if y < 0 goto STOP
//    z = z + 1
//    goto LOOP
//  STOP:
//    if 2 * x + y < 0
//      goto F1
//    else
//      goto F2
//  F1:
//    R2 = z + 1
//  F2:
//    R2 = z 
//  END:
//    goto BEGIN

(BEGIN)

(GET_x)
@24576
D=M
@48
D=D-A
@GET_x
D;JLT
@0
M=D

(GET_operator)
@24576
D=M
@42
D=D-A
@GET_operator
D;JLT
@6
D=D-A
@GET_operator
D;JGE
@48
D=D+A
@1
M=D

(GET_y)
@24576
D=M
@48
D=D-A
@GET_y
D;JLT
@2
M=D

(GET_equal)
@24576
D=M
@61
D=D-A
@GET_equal
D;JNE
@5
D=A
@3
M=D

(PLUS)
@1
D=M
@43
D=D-A
@MINUS
D;JNE   //if R1 != 43 then continue
@1
M=1     //R1 = 1
@0
D=M
@2
D=D+M
@4
M=D     //R4(z) = R0(x) + R1(y)
@END
0;JMP

(MINUS)
@1
D=M
@45
D=D-A
@MULTIPLY
D;JNE   //if R1 != 45 then continue
@2
D=A
@1
M=D     //R1 = 2
@0
D=M
@2
D=D-M
@4
M=D     //R4(z) = R0(x) - R1(y)
@END
0;JMP

(MULTIPLY)
@z
M=0     //z = 0
@0
D=M
@x
M=D     //x = RAM[0]
@2
D=M
@y
M=D     //y = RAM[2]

@1
D=M
@42
D=D-A
@DEVIDE
D;JNE   //if R1 != 42 then continue
@3
D=A
@1
M=D     //R1 = 3

(MULTSUB)
@0
D=M-1
@ENDMULT
D;JLT

@0
M=M-1
@2
D=M
@z
M=M+D
@MULTSUB
0;JMP

(ENDMULT)
@x
D=M
@0
M=D
@z
D=M
@4
M=D
@END
0;JMP

(DEVIDE)
@z
M=0     //z = 0
@0
D=M
@x
M=D     //x = RAM[0]
@2
D=M
@y
M=D     //y = RAM[2]

@1
D=M
@4
D=A
@1
M=D     //R1 = 4

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
@x
D=M
D=D+M
@y
D=D+M
@F1
D;JLT
@F2
0;JMP

(F1)
@z
D=M
@4
M=D     //R4 = z
@END
0;JMP

(F2)
@z
M=M+1   //z = z + 1
D=M
@4
M=D     //R4 = z
@END
0;JMP

(END)
@BEGIN
0;JMP   //goto END