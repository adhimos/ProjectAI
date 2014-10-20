function [ row, col ] = getRowCol( i, nbYp )
%GETROWCOL Summary of this function goes here
%   Detailed explanation goes here
row = floor(i/nbYp);
col = mod(i,nbYp);

row = row +1;

if col == 0
  col = nbYp;
  row = row - 1;
end

end

