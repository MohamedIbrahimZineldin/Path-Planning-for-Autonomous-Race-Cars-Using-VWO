
Track %GET TRACK BOUNDS

nP=5;          % Number of Population
Func_name='F1'; % Name of the test function, F1
MaxIt=10;      % Maximum number of iterations

[lb,ub,dim,fobj]=Get_Functions_details_track(Func_name); % Path Planning

[Best_fitness1,BestPositions1,Convergence_curve1] = VWO_q1(nP,MaxIt,lb,ub,dim,fobj);


n_final=size(lb,2);
n=n_final/2;
      
x_optimized=BestPositions1(1:n);
y_optimized=BestPositions1(n+1:n_final);

%% show Convergence_curve
figure
hold on
semilogy(Convergence_curve1,'Color','r','LineWidth',3);
title('Convergence curve')
xlabel('Iteration');
ylabel('Best fitness obtained so far');
axis tight
grid off
box on
legend('VWO')




