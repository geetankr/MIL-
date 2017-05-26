function [feat] =  extractinstances(img, mask)

feat = [];

no_of_seg = max(max(mask));
assert(no_of_seg == 3,'Number of segment is more than 3')

for seg_count = 1 : 3
   
    seg_mask = uint8(mask == seg_count);
    seg = img.*seg_mask;
    feat(1, seg_count) = sum(sum(seg(:,:,1))) / sum(sum(seg_mask)); % R
    feat(2, seg_count) = sum(sum(seg(:,:,2))) / sum(sum(seg_mask)); % G
    feat(3, seg_count) = sum(sum(seg(:,:,3))) / sum(sum(seg_mask)); % B
 
end

%feat = reshape(feat, 1, (no_of_seg*3));