function im = lowResolution(imArray, avgSizeX, avgSizeY)
%avgSizeX is the number of pixels which will represent 1 pixel on the abscissa in the low resolution image
%avgSizey is the number of pixels which will represent 1 pixel on the ordinate 
s = size(imArray);
nbXpixel = floor(s(1)/avgSizeX); %width of the low resolution image
nbYpixel = floor(s(2)/avgSizeY); %height of the low resolution image
pixelSize = avgSizeX * avgSizeY;
im = zeros(nbXpixel, nbYpixel, 3);
for i=1:nbXpixel,
  for j=1:nbYpixel,
    im(i,j,:)=sum(sum(imArray((i-1)*avgSizeX+1:i*avgSizeX,(j-1)*avgSizeY+1:j*avgSizeY,:),1),2)/(pixelSize);
  end
end
end
