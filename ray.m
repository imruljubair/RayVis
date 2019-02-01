%% Copyright: Mohammad Imrul Jubair (https://imruljubair.github.io/)
% This program simulates a basic raytracing algorithm. This can be helpful
% for understanding how raytracing works.
% For the algorithm, I follow chapter-4 of this book: https://www.cs.cornell.edu/~srm/fcg4/
% All the parameters are kept similar to the book.
% 
%%
function [P1, P2, e, s, leni, lenj]=ray(R,c,E,U,V,W,l,r,t,b,nx,ny,i,j)
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

% visualizeRay(R,c,E,U,V,l,r,t,b,nx,ny,leni,lenj,e,s,P1,P2);


end

