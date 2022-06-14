%============================================================================%
%                                                 **        Vehicle Waiting Optimization Algorithm (VWO)    **                                                           %  
%                                                                                            version 1.0                                                                                                  %    
%                                                                                  -----------------------                                                                                             %     
%                                                                          Developed in MATLAB R2013a                                                                                  %       
%                                                                                  -----------------------                                                                                             %   
%                                                                           Authors and programmers:                                                                                        %       
%                              **             %%                      Mohamed Ibrahim Zineldin                      %%             **                                           %    
%                                                                        e-Mail: mozain361@gmail.com                                                                                    %     
%                                                                                              ++++                                                                                                         %        
%                              **             %%                                 Rizk M Rizk Allah                             %%             **                                          %                            
%                                                                        e-Mail: rizk_masoud@yahoo.com                                                                                %          
%                                                                                    -----------------------                                                                                            %             
%                                                                                    VWO original paper:                                                                                           %             
%                                                                              Zineldin MI, Rizk-Allah RM.                                                                                      %
%                                                            Vehicle Waiting Optimization Algorithm (VWO):                                                                    %               
%                                            A Novel algorithm for solving engineering optimization problems.                                                    %              
%                                           Faculty of Engineering, El-Menoufia University, Shebin El-Kom, Egyptl                                                %
%                                                                                          2022                                                                                                      %
%                                                                                                                                                                                                                   %
%=============================================================================%

function [Vehicle_Destination,Best_Waiting_Point,Curve_of_Convergence]=VWO_q1(N,Max_Waiting_time,lb,ub,dim,fobj)
% display('VWO is working on your problem')

X=initialization(N,dim,ub,lb);
Best_Waiting_Point=zeros(1,dim);
Vehicle_Destination=inf;

Curve_of_Convergence=zeros(1,Max_Waiting_time);
Objective_values = zeros(1,size(X,1));

X2=X;
for i=1:size(X,1)
    Objective_values(1,i)=fobj(X(i,:));
    if i==1
        Best_Waiting_Point=X(i,:);
        Vehicle_Destination=Objective_values(1,i);
    elseif Objective_values(1,i)<Vehicle_Destination
        Best_Waiting_Point=X(i,:);
        Vehicle_Destination=Objective_values(1,i);
    end
    
end

 


 Objective_values2=Objective_values;
 t=1;
  Curve_of_Convergence(t)=Vehicle_Destination;
%Main loop
t=2;
while t<=Max_Waiting_time

    r1=rand();
   
    
    % Update the position of solutions with respect to destination
    for i=1:size(X,1) % in i-th solution
        for j=1:size(X,2) % in j-th dimension
             r2= randi([0 1]);
            R1=sqrt(abs(Best_Waiting_Point(j)-X(i,j))); 
            individual_best=X(1,:);    

            if r2==1
                % Eq. 
                X(i,j)=r1*R1;
            else              
                % Eq.
                  X(i,j)=- r1*R1;
            end
            aaa=2*rand().*(-log(rand())).^.5;

            c=[2/7777 , .67  .767 ]; 
            r = randperm(size(c,2),1); % Get a 1 or 2 randomly.
            cc = c(r);
            %------------------------
            c1=[.496 , .486  .47958 .479587 .4948]; 
            rr = randperm(size(c1,2),1); % Get a 1 or 2 randomly.
            cc1 = c1(rr);
            %------------------------
            rrr=randperm(3,1);
            cccc=[cc1 cos(cc1) sin(cc1)];
            cccc1=cccc(rrr);
             %------------------------

              X2(i,j)=cccc1* X2(i,j)+ (Best_Waiting_Point(j)-X2(i,j))*aaa+cc*(individual_best(j)-X2(i,j));
        end
        
    end 
    for i=1:size(X,1)
            % Check if solutions go outside the search spaceand bring them back
        Flag4ub=X(i,:)>ub;
        Flag4lb=X(i,:)<lb;
        X(i,:)=(X(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
%        
       
        Flag4ub=X2(i,:)>ub;
        Flag4lb=X2(i,:)<lb;
        X2(i,:)=(X2(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
     
        % Calculate the objective values
        Objective_values(1,i)=fobj(X(i,:));
        Objective_values2(1,i)=fobj(X2(i,:));
        % Update the destination if there is a better solution
        if Objective_values(1,i)<Vehicle_Destination
            Best_Waiting_Point=X(i,:);
            Vehicle_Destination=Objective_values(1,i);
        end
        
        if Objective_values2(1,i)<Vehicle_Destination
            Best_Waiting_Point=X2(i,:);
            Vehicle_Destination=Objective_values2(1,i);
        end

    end
    
    Curve_of_Convergence(t)=Vehicle_Destination;
    
   
    t=t+1;

end
% figure;plot(Curve_of_Convergence)