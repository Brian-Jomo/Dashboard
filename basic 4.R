library(deSolve)
#define the SIR function+differential equation+Return the results as
sir_model<-function(time,state,parameters){
  dS<--beta*S*I/N
  dI<--beta*S*I/N-gamma*I
  dR<-gamma*I
  return(list(c(dS,dI,dR)))}
# set parameters
parameters<-c(beta=0.2,
              gamma=0.1)
# intial number of individuals
initial_state<-c(S=990,
                 I=10,
                 R=0)
# total piopulation size
N<-sum(initial_state)
library(ggplot2)
# solve the differential equations
Out<-ode(y=intial_state,times=times,func=sir model,parms=parameters)
# plot the results
plot(out,xlab="time",ylab="population",main="sir model",
     type="1",col=c("blue","red","green"))
legend("topright",legend=c("susceptible","infected","recovered"),
       col=c("blue","red","green"),Ity=1)