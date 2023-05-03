%number of iterations to achieve 0.05 C error
u = 12;
l= 0 ;

e0 = u-l;
es = 0.05;

%number of iterations can be defined as 
% log2 (rel error of 0th guess/desired error)

n = log2(e0/es);


