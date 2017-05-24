% function  [images] = read_imgs(image_folder, extn)
% Read multiple images from a directory with specified extention
%
% INPUT:
%  - image_folder = folder in which the images are stored
%  - extn = entention of the image files eg
%
% OUTPUT
% - Structure with image data
function  [images] = read_imgs(image_folder,extn)

extn = strcat('*',extn);

% read all images from the folder
filenames = dir(fullfile(image_folder, extn));
total_images = numel(filenames);

images = struct;
for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);     
    images(n).data = imresize(imread(full_name),0.5);            

end