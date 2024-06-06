pkg load control;  % Load the control package

% Define system matrices
A = [-1 0; 0 1];
B = [-0.5; 0.5];
C = [1 1];
D = 0;

% Create state-space system
sys = ss(A, B, C, D);

% Initial conditions
x0 = [-1/2; 3/2];

% Define time vector
t = 1:1e-3:2;  % Simulation from t = 0 to t = 2 seconds

% Define input vector u(t)
u = ones(size(t));  % u(t) = 1 for t >= 1

% Simulate the system response
[y, t, x] = lsim(sys, u, t, x0);

% Plot the results
figure;
subplot(3,1,1);
plot(t, x(:,1));
title('State x_1');
xlabel('Time (s)');
ylabel('x_1');
grid on;

subplot(3,1,2);
plot(t, x(:,2));
title('State x_2');
xlabel('Time (s)');
ylabel('x_2');
grid on;

subplot(3,1,3);
plot(t, y);
title('Output y');
xlabel('Time (s)');
ylabel('y');
grid on;

% Display the value of y and its derivative at t = 2
y_t2 = y(end);
dy_dt_t2 = (y(end) - y(end-1)) / (t(end) - t(end-1));  % Approximate derivative

disp(['y(2) = ', num2str(y_t2)]);
disp(['dy/dt at t=2 = ', num2str(dy_dt_t2)]);
