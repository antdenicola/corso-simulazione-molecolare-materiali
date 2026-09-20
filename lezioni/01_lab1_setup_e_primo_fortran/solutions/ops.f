      Program Ops
      write(6,*) 'enter a'
      read(5,*) a
      write(6,*) 'enter b'
      read(5,*) b
      write(6,*) 'sum        =', a + b
      write(6,*) 'difference =', a - b
      write(6,*) 'product    =', a * b
      if (b .ne. 0.0) then
         write(6,*) 'a / b      =', a / b
      else
         write(6,*) 'a / b      : division by zero!'
      endif
      if (a .ge. 0.0) then
         write(6,*) 'sqrt(a)    =', sqrt(a)
      else
         write(6,*) 'sqrt(a)    : a is negative!'
      endif
      write(6,*) 'a**2       =', a**2
      write(6,*) 'sin(a)     =', sin(a)
      write(6,*) 'cos(a)     =', cos(a)
      if (a .gt. 0.0) then
         write(6,*) 'log(a)     =', log(a)
      else
         write(6,*) 'log(a)     : a must be positive!'
      endif
      stop
      end
