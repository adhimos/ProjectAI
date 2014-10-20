function newImArray = reconstructIm(patches, belief, nbXp, nbYp)
sizeXp = size(patches,2);
sizeYp = size(patches,3);
nbP = nbXp*nbYp;
newImArray = zeros(nbXp*sizeXp,nbYp*sizeYp,3);
for i=1:nbP
    [~,I]=max(belief(i,:));
    [rowNum, colNum] = getRowCol(i, nbYp);
    newImArray((rowNum-1)*sizeXp+1:rowNum*sizeXp,(colNum-1)*sizeYp+1:colNum*sizeYp,:)=patches(I,:,:,:);
end
end
