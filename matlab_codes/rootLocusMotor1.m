motor1 = tf([30], [1.915 1]);

Ts = 1/200;

Ti = 1.915;

ZOH = tf([1], [Ts/2 1]);

motor1_sampled = ZOH * motor1;

PI_controller = tf([Ti 1], [Ti 0]);

openLoopSys = PI_controller * motor1_sampled;

figure;
rlocus(openLoopSys);
figure;
nyquist(openLoopSys);
figure;
bode(openLoopSys);
