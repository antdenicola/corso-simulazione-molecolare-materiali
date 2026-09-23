       Program Urto

       real mass
       real vxx, vyy, vzz

!### Variable Definition

       tstep = 0.1
       mass = 1.0
       alpha = 30.0
       g = 9.81
       nstep = 50000
       v0 = 120.0

!### Conversion degree to rad.
       alpha = alpha * 0.01745

!### Initial Position Assignment
      rx0 = 0.0
      ry0 = 0.0
      rz0 = 8.0
      rx = rx0
      ry = ry0
      rz = rz0

!### Initial velocities Assignment
      vx0 = 0.0
      vy0 = v0 * cos(alpha)
      vz0 = v0 * sin(alpha)

      vxx = vx0
      vyy = vy0
      vzz = vz0

!### Main loop
      do i = 1, nstep
      !### Computation of the force components at (t)
        fxx = 0.0
        fyy = 0.0
        fzz = -mass * g
      !### Integration Eqs. of motions (positions at t+dt)
        xx = rx + tstep * vxx + 0.5 * tstep**2 * (fxx/mass)
        yy = ry + tstep * vyy + 0.5 * tstep**2 * (fyy/mass)
        zz = rz + tstep * vzz + 0.5 * tstep**2 * (fzz/mass)

!### Computation of the force components at (t+dt)
        fxn = 0.0
        fyn = 0.0
        fzn = -mass * g

!### Propagation of the velocity (v)
        vxx = vxx + 0.5 * tstep * (fxx + fxn) / mass
        vyy = vyy + 0.5 * tstep * (fyy + fyn) / mass
        vzz = vzz + 0.5 * tstep * (fzz + fzn) / mass

!### Update to current position
        rx = xx
        ry = yy
        rz = zz

!### INSERT IF BLOCK HERE
      
        if(rz.lt.0)then
          vzz = -2.0*rand()*vzz
          vyy = vyy
        endif

!### Trajectory Writing
        write(6,*) yy, zz
      enddo

      stop
      end
