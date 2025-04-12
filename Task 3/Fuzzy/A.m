function [out] = A(x)
out = zeros(size(x));
idx = (x>0) & (x<1);
out(idx) = 0; 

idx = (x>=1) & (x<2);
out(idx) = x(idx) -1; 

idx = (x>=2) & (x<3);
out(idx) = 1; 

idx = (x>=3) & (x<4);
out(idx) = 4 - x(idx); 

idx = (x>=4);
out(idx) = 0; 
end


    