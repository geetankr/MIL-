function [maj_lab] = combineinstlabels(lab_vote)

lab_1 = sum(lab_vote==1);
lab_2 = sum(lab_vote==2);

if lab_1 > lab_2
    maj_lab = 1;
else
    maj_lab = 2;
end