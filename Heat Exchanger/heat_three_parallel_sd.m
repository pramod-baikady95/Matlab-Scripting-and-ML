% heat_three_parallel_sd.m
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
Rmin = min(1,(R1^-1 + R2^-1));%
NTUe =NTU/N;
n=6+(3*(N-1));% Number of variables
%%%%%%%%%%%%%%%%%%%%%%%% End of input %%%%%%%%%%%%%%%%%%%%%%
%
%Let the variales be
%
a=NTUe/2;
b=NTUe/2*R1;
c=NTUe/2*H;
d=NTUe/2*H*R2;
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
k=[1 0 0 0 0 0;...
   0 1 0 0 0 0;...
   0 0 1 0 0 0;...
   -1+a+c -a -c 1+a+c -a -c;...
   -b (-1+b) 0 -b (1+b) 0;...
   -d 0 (-1+d) -d 0 (1+d)];
k1=[-1 0 0 0 0 0;...
    0 -1 0 0 0 0;...
    0 0 -1 0 0 0;...
    0 0 0 0 0 0;...
    0 0 0 0 0 0;...
    0 0 0 0 0 0];
%
%Global Stiffness Matrix Assembly
%
for ii=1:N
KK(3*ii-2:3*(ii+1),3*ii-2:3*(ii+1))=...
    KK(3*ii-2:3*(ii+1),3*ii-2:3*(ii+1))+k+k1;
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
%Extracting the the Oho Temp. difference of Hot fluid Out
%
Oho=O((n-2),1);
Ohi=O(1,1);
Oc1i=O(2,1);
Oc2i=O(3,1);%
%Effectiveness
%
E= (Ohi-Oho) / (min(1,(R1^-1 + R2^-1))*( Ohi- min(Oc1i,Oc2i)));%
%Analytical Value of Effectiveness
%
AE=(1-exp(-NTU*(1+R1)))/((1+R1));
%
print_heat_model % Print model data
%
print_heat_results;
%
fclose(fid);
%
%%%%%%%%%%%%%% END OF HEAT EXCHANGER FINITE ELEMENT ANALYSIS %%%%%%%%%%%%