// Dynare example based stochastic growth model in Lecture 4 

// (1) declare endogenous variables

var        c, k, z;                                                    

// (2) declare exogenous variables (shocks)

varexo     e;                               

// (3) declare parameters

parameters alpha, beta, delta, sigma, phi, sigmaeps;  

alpha    = 0.33;
beta     = 0.95;
delta    = 0.05;
phi      = 0.95;
sigma    = 1.00;
sigmaeps = 0.01;

// (4) declare the model equations

model;                                   

// resource constraint
exp(c) + exp(k) = exp(z)*(exp(k(-1))^alpha)+(1-delta)*exp(k(-1));
                  
// consumption Euler equation
exp(c)^(-sigma) = beta*(exp(c(+1))^(-sigma))*(alpha*exp(z(+1))*(exp(k)^(alpha-1))+1-delta);

// law of motion productivity
z = phi*z(-1) + e;

end;


// (5) solve the steady state 
initval;
c = 0.75;
k = 3;
z = 1;
e = 0;
end;

steady;

// specify variance of shocks

shocks;
var e = 100*sigmaeps^2;
end;

// (6) solve the dynamics
stoch_simul(order=2,irf=150);



 

