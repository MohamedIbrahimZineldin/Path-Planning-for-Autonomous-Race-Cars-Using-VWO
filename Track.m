% faster code
load montreal.mat Montreal  

x_center = Montreal.X_m;

y_center = Montreal.y_m;


w_right = Montreal.w_tr_right_m;

w_left = Montreal.w_tr_left_m;


dxc = [x_center(1); diff(x_center)];

dyc = [y_center(1); diff(y_center)];

alpha = atan2(dyc,dxc);

x_right = x_center + w_right.*sin(alpha);

y_right = y_center - w_right.*cos(alpha);

x_left = x_center - w_left.*sin(alpha);

y_left = y_center + w_left.*cos(alpha);
i=0;
if i ==1
figure; 
        plot(x_center,y_center) ; 
        hold on ;plot(x_right,y_right);
        hold on ;plot(x_left,y_left);
        legend({'centerline', 'right', 'left'});
        grid
        
end
% load montreal.mat Montreal   
% x_center = Montreal.X_m;
% y_center = Montreal.y_m;
% 
% alpha = atan2(y_center,x_center);%Turn Angel % - atan2(y_center(1),x_center(1));
% 
% w_right = Montreal.w_tr_right_m; %whright width
% w_left = Montreal.w_tr_left_m; %left width
% 
% dxc = [x_center(1); diff(x_center)];
% dyc = [y_center(1); diff(y_center)];
% for i = 1:length(x_center)
%     if i == 1
%         alpha(i) = atan2(y_center(i),x_center(i));
%         x_right(i) = x_center(i) + w_right(i)*sin(alpha(i));
%         y_right(i) = y_center(i) - w_right(i).*cos(alpha(i));
%         x_left(i) = x_center(i) - w_left(i).*sin(alpha(i));
%         y_left(i) = y_center(i) + w_left(i).*cos(alpha(i));
%         
%     else
%         
%         alpha(i) = atan2(dyc(i),dxc(i)); 
%         x_right(i) = x_center(i) + w_right(i).*sin(alpha(i));
%         y_right(i) = y_center(i) - w_right(i)*cos(alpha(i));
%         
%         x_left(i) = x_center(i) - w_left(i)*sin(alpha(i));
%         y_left(i) = y_center(i) + w_left(i)*cos(alpha(i));
%     end
% end
% 
% %  figure; 
% %         plot(x_center,y_center) ; 
% %         hold on ;plot(x_right,y_right);
% %         hold on ;plot(x_left,y_left);
% %         legend({'centerline', 'right', 'left'});
% %         grid
%         
        