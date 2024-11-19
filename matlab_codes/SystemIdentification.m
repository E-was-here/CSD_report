u=DataCommands(1800:end).'-1.1;
y=Data(1800:end,1).'-2.355;
timePrime = time(1800:end)-9;



plot(timePrime,y,'.');
hold on;

sys2 = tf([19.52], [1.7 1]);

lsim(sys2,u,timePrime);