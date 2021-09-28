%
fprintf(fid, ' ******* PRINTING MODEL DATA **************\n\n\n');
% Printing elemental properties
%
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'Number of elements: %g \n', N );
fprintf(fid, '------------------------------------------------------ \n');
fprintf(fid, 'NTU: %g \n', NTU );
fprintf(fid, 'R1: %g \n', R1 );
fprintf(fid, 'R2: %g \n', R2 );
fprintf(fid, 'NTUe: %g \n', NTUe);
fprintf(fid, 'Number of variables: %g \n \n \n',n);
fprintf(fid, '------------------------------------------------------ \n');
%
fprintf(fid,'\n');
%
%%%%%%%%%%%%%% END OF PRINTING MODEL DATA  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%