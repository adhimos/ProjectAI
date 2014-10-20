function [ neigh ] = neighbours( i, nbXp, nbYp )
%NEIGHBOURS Summary of this function goes here
%   Detailed explanation goes here
neigh = [];
[rowNum, colNum] = getRowCol(i, nbYp);

if rowNum > 1
    neigh = [neigh; getIndex(rowNum-1, colNum, nbYp)];
end
if rowNum < nbXp
    neigh = [neigh; getIndex(rowNum+1, colNum, nbYp)];
end
if colNum > 1
    neigh = [neigh; getIndex(rowNum, colNum-1, nbYp)];
end
if colNum < nbYp
    neigh = [neigh; getIndex(rowNum, colNum+1, nbYp)];
end
end

