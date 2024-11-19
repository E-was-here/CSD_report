Ti = 1.915;
Kp = 2;

Ts = 1/200;

PI_continous = tf([Kp*Ti Kp], [Ti 0]);

PI_discrete = c2d(PI_continous, Ts, 'Tustin');

