%% Copyright: Mohammad Imrul Jubair (https://imruljubair.github.io/)
% This program simulates a basic raytracing algorithm. This can be helpful
% for understanding how raytracing works.
% For the algorithm, I follow chapter-4 of this book: https://www.cs.cornell.edu/~srm/fcg4/
% All the parameters are kept similar to the book.
% 
%%
function [P1, P2]=ray(R,c,E,U,V,W,l,r,t,b,nx,ny,i,j)
%%
% This function recieves necessary inputs from the user via GUI and invokes
% relevant function to perform raytracing.
%%

u = raster2plane(i,r,l,nx);
v = raster2plane(j,t,b,ny);
w = 25;

e = E + u*U + v*V;
s = e + w*(-W);
d = s-e;


A = dot(d,d);
B = 2*dot(d, e-c);
C = dot(e-c, e-c)-R^2;

[P1, P2] = intersectPoint(e,s,A,B,C);

leni = (r-l)/nx;
lenj = (t-b)/ny;

visualize(R,c,E,U,V,l,r,t,b,nx,ny,leni,lenj,e,s,P1,P2);

end

function u = raster2plane(i,r,l,nx)
%% Raster to Image Plane conversion
%%
u = l + (r-l)*(i+0.5)/nx;
end

function [P1, P2] = intersectPoint(e,s,A,B,C)
%% Finding the intersection point
%%
disc = B^2-4*A*C;
P1=[NaN NaN NaN];
P2=[NaN NaN NaN];
if disc>0
    t1 = (-B+sqrt(disc))/(2*A);
    t2 = (-B-sqrt(disc))/(2*A);
    P1 = e + t1*(s-e);
    P2 = e + t2*(s-e);
end
end

function visualize(R,c,E,U,V,l,r,t,b,nx,ny,leni,lenj,e,s,P1,P2)
%% To visualize the raytracing simulation
%%
ul = computeGrid(E,l,t,U,V);
ll = computeGrid(E,l,b,U,V);
ur = computeGrid(E,r,t,U,V);
lr = computeGrid(E,r,b,U,V);

[x,y,z] = sphere;

g1 = [];
h1 = [];
dl = l;
for n = 1:nx
    dl = dl + leni;
    g1 = [g1 computeGrid(E,dl,t,U,V);];
    h1 = [h1 computeGrid(E,dl,b,U,V);];
end
g1 = g1';
h1 = h1';

g2 = [];
h2 = [];
dt = t;
for n = 1:ny
    dt = dt - lenj;
    g2 = [g2 computeGrid(E,l,dt,U,V);];
    h2 = [h2 computeGrid(E,r,dt,U,V);];
end
g2 = g2';
h2 = h2';


plot3([g1(:,1)'; h1(:,1)'], [g1(:,2)'; h1(:,2)'], [g1(:,3)'; h1(:,3)'], 'b-');
hold on;
plot3([g2(:,1)'; h2(:,1)'], [g2(:,2)'; h2(:,2)'], [g2(:,3)'; h2(:,3)'], 'b-');
hold on;
plot3([ul(1), ur(1), lr(1), ll(1), ul(1)], [ul(2), ur(2), lr(2), ll(2), ul(2)], [ul(3), ur(3), lr(3), ll(3), ul(3)], 'r-','LineWidth',2);
hold on;
plot3([e(1), s(1)], [e(2), s(2)], [e(3), s(3)], 'k-','LineWidth', 1);
hold on;
plot3(e(1), e(2), e(3), 'bs','MarkerFaceColor','b');
hold on;
surf(x*R+c(1),y*R+c(2),z*R+c(3), 'EdgeColor','none');
hold on;
plot3([P1(1), P2(1)],[P1(2), P2(2)],[P1(3), P2(3)], 'ko','MarkerFaceColor','k');
hold off;
grid on;
grid minor;
box on;
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
ax = gca;
ax.CameraPosition = [150, 200, 220];
ax.CameraUpVector = [0 1 0];

end

function m = computeGrid(E,p,q,U,V)
m = E + p*U + q*V;
end