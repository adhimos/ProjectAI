function localEvidence = computeLocalEvidence(patches)
%We supose one patch corresponds to one pixel of the low resolution image
sigmaSq = 0.4;%maybe we should compute the variance (value of Cho's paper)
%sLowRes = size(lowResIm);
sPatch = size(patches,1); %returns nb of patches
pos = 1;
anchorpatches=zeros(sPatch);
anchorpatches(6)=6;
anchorpatches(7)=7;
localEvidence = zeros(sPatch, sPatch);
% for c=1:sPatch,
%   avg = squeeze(mean(mean(patches(c,:,:,:),3),2));
%   for pos=1:sPatch
%       [i,j]=getRowCol(pos,sLowRes(2));
%       s = (avg(1)-lowResIm(i,j,1))^2 + (avg(2)-lowResIm(i,j,2))^2 + (avg(3)-lowResIm(i,j,3))^2;
%       localEvidence(pos,c) =  exp(-5*s/sigmaSq);
%   end
% end
% 
% for pos=1:sPatch,
%     localEvidence(pos,:) = localEvidence(pos,:) / sum(localEvidence(pos,:));
% end
for c=1:sPatch
    if anchorpatches(c)~=0
        fixedpos=anchorpatches(c);
        for pos=1:sPatch
            if pos==fixedpos
                localEvidence(c,pos)=1;
            else
                localEvidence(c,pos)=0;
            end
        end
    else
        for pos=1:sPatch
            localEvidence(c,pos)=1;
        end
    end
end
end
