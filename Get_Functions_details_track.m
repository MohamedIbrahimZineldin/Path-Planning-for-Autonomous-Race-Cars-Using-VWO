%_________________________________________________________________________________
%% Path Planning Problem  
%% MathWorks Excellence in Innovation Project: Path Planning for Autonomous Race Cars (Project 208)‏‏
%% MOHAMED IBRAHIM ZINELDIN 
%% Under supervision of Dr.Veer Alakshendra, Dr.Roberto G. Valenti, @Mathworks
%____________________________________________________________________________________
% lb is the lower bound: lb=[lb_1,lb_2,...,lb_d]
% up is the uppper bound: ub=[ub_1,ub_2,...,ub_d]
% dim is the number of variables (dimension of the problem)

function [lb,ub,dim,fobj] = Get_Functions_details_track(F)
% Ref: https://github.com/TUMFTM/racetrack-database/tree/master/tracks
% centerlines: [x_m, y_m]
% - tracks (centerline + track widths): [x_m, y_m, w_tr_right_m, w_tr_left_m]
% - racelines: [x_m, y_m]

switch F
    case 'F1' % case1: Montreal 
        fobj = @F1;  
         load track_data.mat x_right y_right x_left y_left

         ub=[max(x_right,x_left) max(y_right,y_left) ]-.2;
         lb=[min(x_right,x_left) min(y_right,y_left)]+.2;
          n_final=size(lb,2);
        n=n_final/2;
        dim=n_final;  
        k=50;
        TotalContrl_points_right=[x_right; y_right]';
        TotalContrl_points_left=[x_left; y_left]';
        right_Track= curvey(TotalContrl_points_right,k);
        left_Track= curvey(TotalContrl_points_left,k);
end
%-------------------------------------------------------------------------------------------------------------------------
function o = F1(x) 
    x_candidate =x(1:n);
    y_candidate=x(n+1:n_final);
    
    
    first_obj=1; %choose between control points based function (1), and curve coordinates based composite function (any other number)
    if first_obj==1
    Dx=[];
    Dy=[];
    for i=1 :n-1
        dx=x_candidate(i)-x_candidate(i+1);
        dy=y_candidate(i)-y_candidate(i+1);
        Dx=[dx ; dx];
        Dy=[dy ; dy];
    end
    RMSE=sqrt(sum(Dx.^2+Dy.^2)/2); 
    o=RMSE;
    else
          TotalContrl_points=[x_candidate; y_candidate]';
          Optimized_Track= curvey(TotalContrl_points,k);
         Dx=diff(Optimized_Track(:,1));
         Dy=diff(Optimized_Track(:,2));
         g1=900*(Optimized_Track(:,1)>max(right_Track(:,1),left_Track(:,1))); %1st Penalized Function
         g2=900*(Optimized_Track(:,2)>max(right_Track(:,2),left_Track(:,2)));%2nd Penalized Function
         g3=900*(Optimized_Track(:,2)<min(right_Track(:,1),left_Track(:,1)));%3rd Penalized Function
         g4=900*(Optimized_Track(:,2)<min(right_Track(:,2),left_Track(:,2)));%4th Penalized Function
             RMSE=sqrt(sum(Dx.^2+Dy.^2)/2); %Root Mean Square Error
             o=RMSE+sum(g1)+sum(g2)+sum(g3)+sum(g4);  %Composite Objective Function

    end

%     f=sqrt(Dx.^2+Dy.^2);   %Ref :https://www.youtube.com/watch?v=_iTp5LF-8KE&t=22s
%     o =sum(f); 
end

end