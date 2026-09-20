c     Exercise 3: integer vs real arithmetic.
c     Predict the output BEFORE compiling, then check.
      Program IntDiv
      integer i, j
      real x, y
      i = 7
      j = 2
      x = 7.0
      y = 2.0
      write(6,*) 'i/j =', i/j
      write(6,*) 'x/y =', x/y
      write(6,*) 'i/y =', i/y
      stop
      end
