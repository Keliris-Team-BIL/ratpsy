function MC = gk_ratpsy_Michelson(C1,C2)
% Usage: MC = gk_ratpsy_Michelson(C1,C2)
%
% INPUT:
%
% C1,C2    : the pulse with modulations as a string or float (i.e. 70, 73,...)
%
% OUTPUT:
% 
% MC        : the Michelson contrast of the stimulus (I2-I1)/(I1+I2)
%
% AUTHOR: GAK, March 2020

if isstr(C1)
    c1=100-str2num(C1);
else
    c1=100-C1;
end

if isstr(C2)
    c2=100-str2num(C2);
else
    c2=100-C2;
end

MC=(c2-c1)./(c1+c2);