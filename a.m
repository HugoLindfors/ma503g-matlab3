function [d, proj, r] = a(P, u, v)
OP = P(:);
proj = OP - (dot(OP, cross(u, v)) / norm(cross(u, v)) ^ 2) * cross(u, v);
r = proj - OP;
d = norm(r);
end