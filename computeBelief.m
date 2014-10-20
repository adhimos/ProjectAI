function [ belief ] = computeBelief(message,localEvidence,exclusion,msgToNode,nbXp,nbYp)
nbP = nbXp*nbYp;
belief = zeros(nbP,nbP);
% message(:,12,10)
% message(:,12,12)
for i=1:nbP
    neighI = neighbours(i,nbXp, nbYp);
    for xi=1:nbP
        prod = 1;
        for nj=1:size(neighI)
            j = neighI(nj);
            prod = prod * message(j,i,xi);
            if prod==0
                'prod nulle'
            end
        end
        if exclusion
            prod=prod*msgToNode(i,xi);
        end
        belief(i,xi) = prod * localEvidence(i,xi);
    end
    belief(i,:) = belief(i,:) ./ sum(belief(i,:));
end
end