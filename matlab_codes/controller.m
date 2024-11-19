clc;
clear;
close all;

openinout;

%% sampling parameters & loop variable instantiation
Ts = 1/200;
time = 10;
sampleNbr = ceil(time/Ts);

u_0 = 2.15;

e = 0;
u = u_0;
u_ff = 0;
i = 1;

commandSent = zeros(sampleNbr, 1);
systemOutput = zeros(sampleNbr, 1);

%% controller parameters
Ti = 1.915;
Kp = 1.99;

% to reduce computation time
PI_e_0 = Kp + (Kp * Ts)/(2 * Ti);
PI_e_1 = - Kp + (Kp * Ts)/(2 * Ti);

A = 24.89;
tau = 1.915;

FF_r_0 = (1-2*tau)/(A*Ts);
FF_r_1 = 2*tau/(A*Ts);

%% command parameters


% asymptotic value
objective = 5;

% to reach a working point
t1 = 1;
    % time at full speed
t2 = 4;
    % time to stabilize

n1 = ceil(t1/Ts);
n2 = ceil(t2/Ts);

%r = [5*ones(n1, 1) ; 1.15*ones(n2, 1) ; 5*ones((sampleNbr - n1 - n2), 1)];
r = 5*ones(sampleNbr, 1);

%% loop

tic;

while (i < sampleNbr)
    y_vec = anain;
    y = y_vec(1);
        % system output
    u = u + PI_e_0 * (r(i) - y);
    %u_ff = u_ff + FF_r_0 * r(i);
        % command to send
    anaout(u, 0);

    % save data
    commandSent(i) = u;
    systemOutput(i) = y;

    % prepare for next iteration
    u = u + PI_e_1 * (r(i) - y);
    
    %u_ff = -u_ff + FF_r_1 * r(i) - u_0;
    
    if (toc > i*Ts)
        disp(' too long...');
    end

    while toc < i*Ts
    end

    i = i + 1;
end

% stop sending
anaout(0, 0);

%% Plotting

errorSig = r - systemOutput;

figure;
title('Test PI controller');
plot(r, 'g');
hold on;
plot(commandSent, 'b');
hold on;
plot(errorSig, 'r');
hold on;
plot(systemOutput);
legend('reference', 'command', 'error', 'output');


closeinout;
