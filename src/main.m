%test 1
% A = [1 5 7;1/5 1 4; 1/7 1/4 1];
% R = column_normalize(A);

filename = 'AHP.xlsx';

%RI matrix for P=7 objectives
RI = [1	10/9	5	10/3	2	2	2;
0.9	1	5	10/3	2	2	2;
0.2	0.2	1	0.5	0.5	0.5	0.5;
0.3	0.3	2	1	2	0.5	0.5;
0.5	0.5	2	0.5	1	5/4	5/4;
0.5	0.5	2	2	0.8	1	1;
0.5	0.5	2	2	0.8	1	1];
RI_normal = column_normalize(RI);
xlswrite(filename,RI_normal,1,'A1:H7');

% RP matrix for N=2 overall design
% LO4
RP_4 = [1	0.3;
3.333	1];
NRP_4 = column_normalize(RP_4);
xlswrite(filename,NRP_4,1,'A10:C11');

RP_5 = [1	0.5;
2	1];
NRP_5 = column_normalize(RP_5);
xlswrite(filename,NRP_5,1,'A13:C14');

RP_6 = [1	0.9;
1.111	1];
NRP_6 = column_normalize(RP_5);
xlswrite(filename,NRP_6,1,'A16:C17');

RP_7 = [1	2;
0.5	1];
NRP_7 = column_normalize(RP_5);
xlswrite(filename,NRP_7,1,'A19:C20');

RP_8 = [1	0.7;
1.429	1];
NRP_8 = column_normalize(RP_8);
xlswrite(filename,NRP_8,1,'A22:C23');

RP = zeros(2,7);

%get the general IP matrix for decision values
RP(:,1) = NRP_4(:,3);
RP(:,2) = NRP_5(:,3);
RP(:,3) = NRP_6(:,3);
RP(:,4) = NRP_7(:,3);
RP(:,5) = NRP_8(:,3);
RP(:,5) = NRP_8(:,3);%use the same value for LO9,LO10 from LO8
RP(:,5) = NRP_8(:,3);
RI_de = RI_normal(:,8);

de_val = decision_value(RP,RI_de);
xlswrite(filename,de_val,1,'A25:A26');

% consistency check
C1 = consistency(RI,7);
C2 = consistency(RP_4,2);
C3 = consistency(RP_5,2);
C4 = consistency(RP_6,2);
C5 = consistency(RP_7,2);
C6 = consistency(RP_8,2);

