function [ NRP ] = column_normalize( RP )
%Nomalize_RP This function column normalized a gievn RP matrix and return
%with an extra colume as overall preference
[M,N] = size(RP); % M, number of rows; N, number of columns
NRP = zeros(M,N+1);

for j = 1:N %column
    column_sum = 0;
    for i = 1:M %row
        column_sum = column_sum + RP(i,j);
    end
    NRP(:,j) = RP(:,j)/column_sum;
end

for p = 1:M
    row_sum = 0;
    for k = 1:N %column
        row_sum = row_sum + NRP(p,k);
    end
    NRP(p,N+1) = row_sum/N;
end
end
