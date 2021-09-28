%
fprintf(fid, ' \n \n \n ******* PRINTING ANALYSIS RESULTS ************** \n \n \n');
%
% Print Displacement solution vector
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid,'Displacement solution vector: delta \n');
fprintf(fid,' %8.5f\n',O);
fprintf(fid,'\n');
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'Oho Temp deff of hot fluid out \n');
fprintf(fid,' %8.5f\n',Oho);
fprintf(fid,'\n');
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'Effectiveness \n');
fprintf(fid,' %8.5f\n',E);
fprintf(fid,'\n');
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'Analytical Value of Effectiveness \n');
fprintf(fid,' %8.5f\n',AE);
fprintf(fid,'\n');
fprintf(fid, '------------------------------------------------------ \n');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF RESULT PRINTING %%%%%%%%%%%%%%%%%%%%%%%