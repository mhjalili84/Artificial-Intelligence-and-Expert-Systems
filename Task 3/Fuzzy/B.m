function [out] = A(x)
out = zeros(size(x));
idx = (x>0) & (x<3);
out(idx) = exp(x(idx) - 3); 

idx = (x>=3) & (x<5);
out(idx) = 1; 

idx = (x>=5);
out(idx) = 1 - (x(idx) - 5)/5; 

end


    