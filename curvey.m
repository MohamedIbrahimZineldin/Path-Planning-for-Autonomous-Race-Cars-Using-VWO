%% This function calculates Bezier curve coordinates for any n-degree of freedom using patch concept
%% Path Planning Problem  
%% MathWorks Excellence in Innovation Project: Path Planning for Autonomous Race Cars (Project 208)‏‏
%% MOHAMED IBRAHIM ZINELDIN 
%% Under supervision of Dr.Veer Alakshendra, Dr.Roberto G. Valenti, @Mathworks
function Optimized_Track1= curvey(TotalContrl_points,k)
total_num=length(TotalContrl_points); %Any No. of Control_points
% k=4;                                    %Max_Patch_Ctrl_points
No_groups=idivide( int32(total_num),k); % Number of patches
% Remain_points=rem(total_num,k);      %No. of remain points
final_group_indx=No_groups*k;
Show=0; %enable plotting results=1 , disable =any other number
Optimized_Track=[];
for i=1:No_groups
    
    if i==1
       index=1;
       final_index=k;
    elseif i==No_groups
        index=final_group_indx;
        final_index=total_num;
    else 
       index=(i-1)*k;
       final_index=(i)*k;
    end
       
    Contrl_points= TotalContrl_points(index:final_index,:); %Control point for each patch
    [ Curve, ~]=mohamed_bezier(Contrl_points,Show); %the Bezier curve coordinates for each patch
    Optimized_Track=[Optimized_Track;Curve]; % the total Bezier curve for all Ctrl Points
end
Optimized_Track1=Optimized_Track;
end