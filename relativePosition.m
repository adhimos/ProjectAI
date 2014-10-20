function [ dir ] = relativePosition( i, j, nbYp )
%RELATIVEPOSITION Summary of this function goes here
%   Detailed explanation goes here
UP = 0;
DOWN = 1;
LEFT = 2;
RIGHT = 3;
NOT_NEIGH = -1;

[rowNumI, colNumI] = getRowCol(i, nbYp);
[rowNumJ, colNumJ] = getRowCol(j, nbYp);

if rowNumI == rowNumJ && colNumI == colNumJ - 1
    dir = LEFT;
elseif rowNumI == rowNumJ && colNumI == colNumJ + 1
    dir = RIGHT;
elseif rowNumI == rowNumJ - 1 && colNumI == colNumJ
    dir = UP;
elseif rowNumI == rowNumJ + 1  && colNumI == colNumJ
    dir = DOWN;
else 
    dir = NOT_NEIGH;
end
end

