% heat_two_counter.m
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
a=NTUe/3;
b=NTUe*R/3;
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
k=[a-0.5, -a, a/2+0.5, -a/2;...
    b, -b-0.5, b/2, -b/2+0.5;...
    a/2-0.5, -a/2, a+0.5, -a;...
    b/2, -b/2-0.5, b, -b+0.5];
%
%Global Stiffness Matrix Assembly
%
for ii=1:N
KK(2*ii-1:2*(ii+1),2*ii-1:2*(ii+1))=...
    KK(2*ii-1:2*(ii+1),2*ii-1:2*(ii+1))+k;
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