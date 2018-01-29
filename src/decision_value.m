function [ value ] = decision_value( RP, IP )
%decision_value Input: the last column of the RP, IP matrix (overall performance)
%                      of a certain design decision
%               Output: return a value for this design (higher, better)
t_IP = IP';
value = t_IP*RP;
end

