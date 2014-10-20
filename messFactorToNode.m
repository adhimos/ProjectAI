function [ messageToNode ] = messFactorToNode( messageToFactor, nbXp, nbYp )
%MESSFACTORTONODE Summary of this function goes here
%   Detailed explanation goes here
nbP = nbXp*nbYp;
messageToNode = ones(nbP, nbP);

for i=1:nbP
    for x=1:nbP
        prod = 1;
        for t=1:nbP            
            if t~=i                
                prod = prod .* (1 - messageToFactor(t,x));
            end
        end
    messageToNode(i,x) = prod;
    end
    messageToNode(i,:) = messageToNode(i,:) / sum(messageToNode(i,:));
end
end

