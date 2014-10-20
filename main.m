close all;
clear all;

imArray = im2double(imread('./imData/1.png')); %import image
imSize = size(imArray);

patchWidth = 150;
patchHeight = 150;
nbXpatches = floor(imSize(1)/patchHeight);
nbYpatches = floor(imSize(2)/patchWidth);
nbPatches = nbXpatches*nbYpatches;
nbIter = 5; % nb of iterations

%resize image
imArray = imArray(1:(patchHeight*nbXpatches),1:(patchWidth*nbYpatches),:);
imSize = size(imArray);

patches = cutInPatch(imArray,patchWidth,patchHeight);
%lowResIm = lowResolution(imArray,patchWidth,patchHeight);

image(imArray) %display image
%figure
%image(lowResIm) %display low resolution image

%compute Left-Right and Down-Up compatibility, and local evidence
[LRcomp,DUcomp] = RGBcompatibility(patches);
%localEvidence = computeLocalEvidence(patches,lowResIm);
localEvidence = computeLocalEvidence2(patches);

%belief propagation by message passing without exclusion term
message = ones(nbPatches, nbPatches, nbPatches);
messToNode = ones(nbPatches, nbPatches);

for i=1:nbIter
  message = oneIterBPbis(message, nbXpatches, nbYpatches, localEvidence, LRcomp, DUcomp, 1, messToNode);
  messageToFactor = computeBelief(message, localEvidence,1,messToNode, nbXpatches, nbYpatches);
  messToNode = messFactorToNode(messageToFactor, nbXpatches, nbYpatches);
end
%figure
% sizeXp = size(patches,2);
% sizeYp = size(patches,3);
% newImArray2 = zeros(sizeXp,sizeYp,3);
% newImArray2(1:sizeXp,1:sizeYp,:)=patches(2,:,:,:);
% image(newImArray2);
%reconstruct image
belief = computeBelief(message, localEvidence,1,messToNode, nbXpatches, nbYpatches);
newImArray = reconstructIm(patches, belief, nbXpatches, nbYpatches);
figure
image(newImArray,'CDataMapping', 'scaled') %display image

