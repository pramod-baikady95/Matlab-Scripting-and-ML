% heat_three_parallel.m
%
clc % Clear screen
clear % Clear all variables in memory
close all
%
% ALTER THE NEXT LINES TO CHOOSE AN OUTPUT FILE FOR THE RESULTS
% Open file for output of results
%
fid = fopen('heat_1_results.txt','w'); 
disp('Results printed in file : heat_1_results.txt ');
%
%%%%%%%%%%%%%% Beginning of data input %%%%%%%%%%%%%%%%%%%%%
N =input('Number of elements N=');%enter the number of elements
NTU = 1; %
R1 = 1;% 
R2 = 1;%
H=1;
NTUe =NTU/N;
n=6+(3*(N-1));% Number of variables
%%%%%%%%%%%%%%%%%%%%%%%% End of input %%%%%%%%%%%%%%%%%%%%%%
%
%Let the variales be
%
a=NTUe/3;
b=NTUe/3*R1;
c=NTUe/3*H;
d=NTUe/3*H*R2;
%
KK =zeros(n) ; % Initialize global stiffness matrix to zero
F=zeros(n,1); % Initialize global force vector to zero
%
%Loading
%
F(1,1)=1;%BC of 1st node is given 1
%
%Elemental stiffness matrix
%
k=[-b,-0.5+b,0,-b/2,0.5+b/2,0;...
   -b/2,-0.5+b/2,0,-b,0.5+b,0;...
   -0.5+a+c,-a,-c,0.5+a/2+c/2,-a/2,-c/2;...
   -0.5+a/2+c/2,-a/2,-c/2,0.5+a+c,-a,-c;...
   -d,0,-0.5+d,-d/2,0,0.5+d/2;...
   -d/2,0,-0.5+d/2,-d,0,0.5+d];
%
%Global Stiffness Matrix Assembly
%
for ii=1:N
KK(3*ii-2:3*(ii+1),3*ii-2:3*(ii+1))=...
    KK(3*ii-2:3*(ii+1),3*ii-2:3*(ii+1))+k;
end
%
%Imposing Boundary Condition
KK(1,: )=0;
KK(1,1)=1;
KK(2,: )=0;
KK(2,2)=1;
KK(3,: )=0;
KK(3,3)=1;
%
%%%%%%%%%%%%% End of Assembly Of Matices %%%%%%%%%%%%%%%%%
%
%Solution for the unknown O(Temp. difference) values
%
O=KK\F;
%
%Etracting the the Oho Temp. difference of Hot fluid Out
%
Oho=O((n-1),1);
%
%Effectiveness
%
E=1-Oho;
%
%Analytical Value of Effectiveness
%
AE=(1-exp(-NTU*(1+R1)))/(1+R1);
%
print_heat_model % Print model data
%
print_heat_results;
%
fclose(fid);
%
%%%%%%%%%%%%%% END OF HEAT EXCHANGER FINITE ELEMENT ANALYSIS %%%%%%%%%%%%