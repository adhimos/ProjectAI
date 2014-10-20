function [LRcomp, DUcomp] = RGBcompatibility(patches)
sigmaSq = 0.2;
s=size(patches);
LRcomp = zeros(s(1),s(1));
DUcomp = zeros(s(1),s(1));
for i=1:s(1),
  for j=1:s(1),
   
     
      DUcomp(i,j) = sum(sum((patches(i,1,:,:) - patches(j,s(2),:,:)).^2./sigmaSq)); %compatibility of patch i to be at the left of patch j
      LRcomp(i,j) = sum(sum((patches(i,:,s(3),:) - patches(j,:,1,:)).^2./sigmaSq)); %compatibility of patch i to be at the down of patch j
    
  end
end

 
for i=1:s(1),
  LRcomp(:,i) = LRcomp(:,i)./ sum(LRcomp(:,i));
  DUcomp(:,i) = DUcomp(:,i)./ sum(DUcomp(:,i));
end

LRcomp=exp(-LRcomp);
DUcomp=exp(-DUcomp);
for i=1:s(1)
    LRcomp(i,i)=0;
    DUcomp(i,i)=0;
end
end