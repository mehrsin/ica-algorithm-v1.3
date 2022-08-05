clc
clear
close all
format shortG

%% parameters setting

data=load('data.mat');
nvar=data.nvar;

lb=0*ones(1,nvar); % Lower Bound
ub=1*ones(1,nvar);    % Upper Bound       


ncountries=4;
nimp=2;              % number of imperialists
maxiter=10;

beta=2;
P_revolve=0.3;
zeta=0.02;


%% initial population algorithm
tic
create_initial_population


[value,index]=min([imp.fit]);
gimp=imp(index);

%% main loop algorithm

BEST=zeros(maxiter,1);


for iter=1:maxiter

    % Assimilation
    imp=assimilation(imp,nvar,beta,data);
    
    % Revolution
    imp=Revolution(imp,nvar,data,P_revolve);
    
    % Exchange
    imp=Exchange(imp);
    
    % Totla fitness
    imp=cal_total_fitness(imp,zeta);
    
    % imperialistic competition
    imp=imperialistic_competition(imp);
    
    
   [value,index]=min([imp.fit]);
   
   if value<gimp.fit
      gimp=imp(index); 
   end


  BEST(iter)=gimp.fit;


nimp=length(imp);

    NO=' Feasible';
    if gimp.SCH>0
        NO=' Infeasible';
    end
    
    
disp([ ' Iter  = ' num2str(iter)...
       ' BEST = '  num2str(BEST(iter))...
       ' NIMP = '  num2str(nimp) NO]);




if nimp==1
    break
end


end


%% results algorithm

disp([ ' Best Fitness = '  num2str(gimp.fit)]);
disp([ ' Time = '  num2str(toc)]);


figure(1)
plot(BEST,'r')
xlabel('Iteration')
ylabel('Fitness')
legend('BEST')
title('ICA')


RES(gimp,data)























