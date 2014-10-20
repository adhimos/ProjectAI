function [ newMess ] = oneIterBPbis(message, nbXp, nbYp, localEvidence, LRcomp, DUcomp, exclusion, msgToNode)
%ONEITERBPBIS Summary of this function goes here
%   Detailed explanation goes here
UP = 0;
DOWN = 1;
LEFT = 2;
RIGHT = 3;

RLcomp = LRcomp';
UDcomp = DUcomp';

nbP = nbXp*nbYp;
newMess = zeros(nbP, nbP, nbP);
for iIdx=1:nbP
    neighI = neighbours(iIdx, nbXp, nbYp);
    for jIdx = 1:size(neighI,1)
        for xi=1:nbP
            sum = 0;
            for xj=1:nbP
%                 if (iIdx==12) && (neighI(jIdx)==11)
%                  0
%                 end
                prodMess = 1;
                neighJ = neighbours(neighI(jIdx), nbXp, nbYp);
                for l=1:size(neighJ,1)
                    if neighJ(l) ~= iIdx
                        prodMess = prodMess * message(neighJ(l),neighI(jIdx),xj);
                    end
                end
                if exclusion
                    prodMess = prodMess * msgToNode(neighI(jIdx), xj);
                end
                dir = relativePosition(iIdx, neighI(jIdx), nbYp);
                if dir == UP
                    sum = sum + UDcomp(xi,xj)*localEvidence(neighI(jIdx),xj)*prodMess;
                elseif dir == DOWN
                    sum = sum + DUcomp(xi,xj)*localEvidence(neighI(jIdx),xj)*prodMess;
                elseif dir == LEFT
                    sum = sum + LRcomp(xi,xj)*localEvidence(neighI(jIdx),xj)*prodMess;
                elseif dir == RIGHT
                    sum = sum + RLcomp(xi,xj)*localEvidence(neighI(jIdx),xj)*prodMess;
                elseif dir == -1 
                    'Error : the nodes are not neighbours'
                end
            end
            newMess(neighI(jIdx),iIdx,xi) = sum;
        end
        norm = 0;
        for x=newMess(neighI(jIdx),iIdx,:)
            norm = norm + x;
        end
        newMess(neighI(jIdx),iIdx,:) = newMess(neighI(jIdx),iIdx,:) ./ norm;
    end
end
end

