function [dataset] =  gendatmilsival()

% imgs_apple = read_imgs('/home/geetank/Desktop/ML/Assign/sival_apple_banana/apple', '.jpg');
% imgs_banana = read_imgs('/home/geetank/Desktop/ML/Assign/sival_apple_banana/banana', '.jpg');
% imgs = [imgs_banana, imgs_apple]
% 
% width = 50;
% baglab = [ ones(60,1), 2* ones(60,1)];
% 
% bags = cell(120,1);
% 
% parfor i =  1 : length(imgs)
% 
%     seg_lab = im_meanshift(imgs(2).data,width); 
%     [feat] =  extractinstances(imgs(2).data, seg_lab);
%     bags{i} = feat;
%     
% end

% banana--> 1 apple-->2
load('dataset3.mat');
baglab = [ ones(60,1); 2* ones(60,1)];

dataset = bags2dataset(bags,baglab);
size(dataset)