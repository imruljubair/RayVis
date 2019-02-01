function u = raster2plane(i,r,l,nx)
%% Raster to Image Plane conversion
%%
u = l + (r-l)*(i+0.5)/nx;
end