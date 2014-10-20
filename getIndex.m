function [ index ] = getIndex( row, col, nbYp )
%GETINDEX Summary of this function goes here
%   Detailed explanation goes here
index = (row-1)*nbYp + col;
end

