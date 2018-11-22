        .data
float1: .float 0.5
float2: .float 0.000001
        .text
        .globl main
main:   li $v0, 6
        syscall                 #read n, f0 = x0 = n
        mov.s $f11, $f0         #f11 = n
        la $t0, float1
        lwc1 $f10, 0($t0)       #f10 = 0.5
        mul.s $f1, $f0, $f10    #f1 = x1 = 0.5 * x0
        la $t0, float2
        lwc1 $f2, 0($t0)        #f2 = 0.000001
loop:   sub.s $f3, $f0, $f1
        abs.s $f3, $f3          #f3 = abs(x0 - x1)
        
        c.le.s $f3, $f2
        bc1t print              #if abs(x0 - x1) < 0.000001 then print x1
        
        mov.s $f0, $f1
        div.s $f1, $f11, $f0
        add.s $f1, $f0, $f1
        mul.s $f1, $f10, $f1    #x1 = 0.5 * (x0 + n / x0)
        
        j loop
print:  mov.s $f12, $f1
        li $v0, 2
        syscall                 #print x1
        li $v0, 10
        syscall
