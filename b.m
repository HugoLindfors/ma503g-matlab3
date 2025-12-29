function [d, proj, r] = b(P, u, v)
OP = P(:);
M = [u v];
proj = M * ((M' * M) \ (M' * OP));
r = OP - proj;
d = norm(r);
end