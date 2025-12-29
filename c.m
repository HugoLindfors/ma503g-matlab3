function [A, t, d0, lsqe, r, v0, x] = c(d, dt)
t = (0:dt:2)';
A = [ 0.5 * t .^ 2, t, ones( size(t) ) ];

disp( rref( [A d] ) );

x = (A' * A) \ (A' * d);
g = x(1);
v0 = x(2);
d0 = x(3);
r = d - A * x;
lsqe = norm(r);

fprintf('Gravity on Mars: %.4f m/s^2\n', g);
fprintf('Least squares error (norm of r): %.4f\n', norm(r) );

T = linspace(0, 2, 100)';
D = 0.5 * g * T .^ 2 + v0 * T + d0;

figure; plot(t, d, 'ro'); hold('on'); plot(T, D, 'b-');
xlabel('Time (s)'); ylabel('Distance (m)');
title('Least Squares Fit - Mars Gravity');
legend('Measured Data', 'Fitted Model'); grid('on');
end