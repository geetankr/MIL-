% Code by Geetank raipuria (geetankr@gmail.com)

clc
clear all
close all

addpath('/home/geetank/Desktop/ML/Assign/additionalcode')
addpath('/home/geetank/Desktop/ML/prtools/prtools')
addpath('/home/geetank/Desktop/ML/prtools')
%
[data_feat] =  gendatmilsival();
bagid = getident(data_feat,'milbag');
true_lab = [ ones(60,1); 2* ones(60,1)];


%% Naive 

% banana--> 1 apple-->2

W = fisherc(data_feat);

new_lab = ones(length(data_feat)/3,1);

for i = 1 : 3 : length(data_feat)
    
    dummy1 = labeld(data_feat(i,:),W);
    dummy2 = labeld(data_feat(i+1,:),W);
    dummy3 = labeld(data_feat(i+2,:),W);
    
    new_lab(ceil(i/3)) = combineinstlabels([dummy1 , dummy2, dummy3]);

end

true_banana = sum((true_lab == 1) .* (new_lab == 1));
true_apple = sum((true_lab == 2) .* (new_lab == 2));

acc = sum(sum(true_lab == new_lab))/120;

%% Miles
bag_data = data_feat.data;

rowsqr = 25*25;

for i = 1 : 120 

    bag_of_inst = bag_data(i:i+2, :);
    
    dis(:,1) = exp(- sum((repmat( bag_of_inst(1,:) , size(bag_data,1) , 1 ) - bag_data).^2,2)/rowsqr ) ;
    dis(:,2) = exp(- sum((repmat( bag_of_inst(2,:) , size(bag_data,1) , 1 ) - bag_data).^2,2)/rowsqr ) ;
    dis(:,3) = exp(- sum((repmat( bag_of_inst(3,:) , size(bag_data,1) , 1 )  - bag_data).^2,2)/rowsqr );
    
    dis_feat(:,i) = max(dis,[],2);
end

prdata = prdataset(dis_feat', true_lab); 
W = liknonc(prdata)

new_lab = labeld(prdata, W);
acc = sum(sum(true_lab == new_lab))/120;

[E,C ] = testc(prdata, W,'crisp')

