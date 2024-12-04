\subsection*{MATLAB Implementation}
Below is MATLAB code to compute \( K \):
\begin{verbatim}
% System Matrices
A_Ts = [0.9491, 0; 
         0, 0.9429];
B_Ts = [1.2662; 
         1.1149];
C = [1, 1];

% LQR Weight Matrices
Q = [10, 0; 
      0, 1]; % State weighting matrix
R = 1;     % Control weighting scalar

% Solve Discrete-Time LQR
[K, P, eigenvalues] = dlqr(A_Ts, B_Ts, Q, R);

% Display Results
disp('LQR Gain K:');
disp(K);
disp('Riccati Solution P:');
disp(P);
disp('Closed-Loop Eigenvalues:');
disp(eigenvalues);
\end{verbatim}