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