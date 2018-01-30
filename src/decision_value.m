function [ value_t ] = decision_value( RP, RI )
%decision_value Input: the last column of the RP, IP matrix (overall performance)
%                      of different designs
%               Output: return a column vector for these design's decision value
%                       generally, higher value, better design
                        
[N,P] = size(RP);%N, rows, number of solutions; P, columns, number of objectives
value = size(N,1);
for i=1:N
    value(i) = RP(i,:)*RI;
end
value_t = value';
end

