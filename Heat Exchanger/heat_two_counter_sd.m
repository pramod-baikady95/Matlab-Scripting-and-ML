% heat_two_counter_sd.m
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
R = 0.5; % 
NTUe =NTU/N;
n=4+(2*(N-1));% Number of variables
%%%%%%%%%%%%%%%%%%%%%%%% End of input %%%%%%%%%%%%%%%%%%%%%%
%
%Let the variales be
%
a=NTUe/2;
b=NTUe*R/2;
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
k=[1 0 0 0;...
    0 0 0 1;...
    a-1 -a a+1 -a;...
    b -b-1 b -b+1];
k1=[-1 0 0 0;...
    0 0 0 -1;...
    0 0 0 0;...
    0 0 0 0];
%
%Global Stiffness Matrix Assembly
%
for ii=1:N
KK(2*ii-1:2*(ii+1),2*ii-1:2*(ii+1))=...
    KK(2*ii-1:2*(ii+1),2*ii-1:2*(ii+1))+k+k1;
end
%
%Imposing Boundary Condition
KK(1,: )=0;
KK(1,1)=1;
KK(2,: )=0;
KK(2,n)=1;
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
AE=(1-exp(-NTU*(1-R)))/(1-R*exp(-NTU*(1-R)));
%
print_heat_model % Print model data
%
print_heat_results;
%
fclose(fid);
%
%%%%%%%%%%%%%% END OF HEAT EXCHANGER FINITE ELEMENT ANALYSIS %%%%%%%%%%%%