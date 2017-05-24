% Code by Geetank raipuria (geetankr@gmail.com)

clc
clear all
close all

addpath('/home/geetank/Desktop/ML/Assign/additionalcode')

imgs = read_imgs('/home/geetank/Desktop/ML/Assign/sival_apple_banana/apple', '.jpg');

width = 50;
lab = im_meanshift(imgs(1).data,width);
