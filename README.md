# Path-Planning-for-Autonomous-Race-Cars-Using-VWO
Mathworks Innovation (Project 208)
In this project, I have considered Path-Planning as an optimization problem.

1- I used the data of Mntreal race track[1], where x_m, y_m are the center line (x, y) coordinates, the track widths to the right (w_tr_right) and left (w_tr_left), you can plot the track by running Track.m, you can try any other trackes by changing [load montreal.mat Montreal ]line to the requried track.

2- I have extracted the upper (ub) and lower (lb) bounds from the track coordinates for path planning as an optimization problem. You can find ub, lb in Get_Functions_details_track 

3- I have tried two types of objective functions
* first one is based on the RMSE between control points,
* and the second one is based on the RMSE between the points of Bezier curve 
* You can find them in if statement in Get_Functions_details_track function.m function

4- for the second Objective Function , I used composite Penalized Function to avoid the overlapping  between the curves of track boundaries
however we can overcome this problem by adjusting the number of patch points (k in the  show_results.m code) and using the first objective function for better results

5- I used the Generalised Bezier curve method for smooth trajectory. mohamed_bezier.m function takes the control points coordinates and outputs the Bezier curve [2].

6-I proposed a patch concept to get a long Bezier curve without the problems of unwanted disturbance , as the mohamed_bezier.m can't get the curve for too much Control points, so curvey.m function cluster the n- control points for k-points to split the totoal curve to [(n/k)+1] patches and apply mohamed_bezier function to each patch control points.

7- I used our new metaheuristic Algorithm called Vehicle Waiting Optimization Algorithm (VWO),it is VWO_q1.m function, the VWO's paper is currently under review . so I didn't publish the final version of it , so some terms will be different from the original paper, It will be updated after Publishment, Insha-Allah!

8- The optimization solution is the x,y coordinates for the control points of the bezier curve.

9- initialization.m creats some initial solutions[3], and  VWO_q1.m takes the upper and lower bounds, dimensions of optimization problem and its objective function,  maximum iterations, number of soltions, and gives the optimal solution, and optimal objective function, Convergence curve.

10-run.m executes optimization process.

11- show_results.m plots the Bezier curves for the boundaries and centerline of the track annd the optimized path curve. 

12- You can find the codes in the attachments and you can test them by running main.m.

13- The VWO convergence curve , and Optimized trajectory can be found in the image below and vwo_convergence.fig, VWO_Optimized_Trajectory.fig, respectively. 

14- Big Achnowledge should be sent to Dr.Veer Alakshendra and Dr.Roberto Valenti for their support! 

Ref:

[1] https://github.com/TUMFTM/racetrack-database

[2] %https://www.mathworks.com/matlabcentral/fileexchange/33828-generalised-bezier-curve-matlab-code

[3] % https://www.sciencedirect.com/science/article/pii/S0020025520306241
![unnamed](https://user-images.githubusercontent.com/107483463/173599165-b15e3ee0-3d53-41d7-a0a8-bb7fed6cc667.png)
