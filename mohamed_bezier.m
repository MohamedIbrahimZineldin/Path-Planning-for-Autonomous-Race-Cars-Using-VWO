% Modified Bezier Curve based on:
%https://www.mathworks.com/matlabcentral/fileexchange/33828-generalised-bezier-curve-matlab-code
% books for reference on the subject of cad/cam author Roger Adams  ,
% Ibrahim Zeid 
%Prepared by Mechanical engg. student NIT Allahabad , India
% for any questions feel free to mail me at slnarasimhan89@gmail.com
% edited by  MOHAMED IBRAHIM ZINELDIN 
function [ Curve, Contrl_points]=mohamed_bezier(Contrl_points,Show)
n=size(Contrl_points,1);
n1=n-1;
sigma=zeros();
for    i=0:1:n1
sigma(i+1)=factorial(n1)/(factorial(i)*factorial(n1-i));  % for calculating (x!/(y!(x-y)!)) values 
end
l=[];
UB=zeros();
for u=0:0.002:1
for d=1:n
UB(d)=sigma(d)*((1-u)^(n-d))*(u^(d-1));
end
l=cat(1,l,UB);                                      %catenation 
end
Curve=l*Contrl_points;
%% PLOT CURVES WITH CONTROL POINTS
if Show==1
figure
plot(Curve(:,1),Curve(:,2), "-.*", 'markerfacecolor','g','LineWidth',.02,'MarkerSize',3);   %Curve Only
hold on
plot(Contrl_points(:,1),Contrl_points(:,2), "*", 'markerfacecolor','r','MarkerSize',3);     %Control Points
end
end

