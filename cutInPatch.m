function patches = cutInPatch(imArray, xSize, ySize)
s = size(imArray);
nbXpatch = floor(s(1)/xSize);
nbYpatch = floor(s(2)/ySize);
patches = zeros(nbXpatch*nbYpatch, xSize, ySize, 3);
count = 1;
for i=1:nbXpatch,
  for j=1:nbYpatch,
    patches(count, :,:,:)=imArray((i-1)*xSize+1:i*xSize,(j-1)*ySize+1:j*ySize,:);
    count = count + 1;
  end
end

end
