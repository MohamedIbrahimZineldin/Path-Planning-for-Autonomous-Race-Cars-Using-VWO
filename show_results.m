
TotalContrl_points_right=[x_right; y_right]'; % Contrl_points for right Bezier curve
TotalContrl_points_left=[x_left; y_left]';% Contrl_points for leftt Bezier curve
TotalContrl_points_center=[x_center y_center];% Contrl_points for center Bezier curve
k=20; %No. of points in the curve segments 
TotalContrl_points_optimized=[x_optimized; y_optimized]'; % Contrl_points for Bezier curve of the Optimized Trajectory

right_Track= curvey(TotalContrl_points_right,k);%right Bezier curve coordinates

left_Track= curvey(TotalContrl_points_left,k);%left Bezier curve coordinates

center_Track= curvey(TotalContrl_points_center,k);%center Bezier curve coordinates

Optimized_Track= curvey(TotalContrl_points_optimized,k);%Optimized Trajectory Bezier curve coordinates


%% plot the  Bezier curves
figure;
        plot(center_Track(:,1),center_Track(:,2)) ; 
        hold on ;plot(right_Track(:,1),right_Track(:,2));
        hold on ;plot(left_Track(:,1),left_Track(:,2));
        hold on;plot(Optimized_Track(:,1),Optimized_Track(:,2), "-.*", 'markerfacecolor','g','LineWidth',.2,'MarkerSize',1);   %Curve Only
legend({'centerline', 'right', 'left','optimized Trajectory'});
        grid
        