Expected output (gfortran):

    i/j =           3      <- integer division truncates 7/2 = 3.5 to 3
    x/y =   3.50000000
    i/y =   3.50000000     <- mixed expression: i is converted to real

Discussion: in Fortran the type of the operands decides the type of the operation.
