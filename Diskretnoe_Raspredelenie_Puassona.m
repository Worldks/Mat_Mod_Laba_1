clc;
clear all;
close all;

M = 9750;
K = 18;
LAMBDA = 12;
MU = LAMBDA;
SIGMA = sqrt(LAMBDA);
Y = poissrnd(LAMBDA,1,9750);
disp('Pervie 18 znachenii');
disp(Y(1:K));
disp([ 'Max of Y = ' num2str(max(Y)) ' Min of Y = ' num2str(min(Y)) ]);
disp([ 'Theoretic MU of Y = ' num2str(MU) ' Experimental MU of Y =  ' num2str(mean(Y)) ]);
disp([ 'Theoretic SIGMA of Y = ' num2str(SIGMA) ' Experimental SIGMA of Y =  ' num2str(std(Y))]); 

figure; 
hist_y = 1:max(Y); 
hist(Y, hist_y);
title('Histograme of Poisson distribution');
ylabel('Frequence');
xlabel('Values of quantities');

% figure;
% x = 0:max(Y);
% H = zeros(1, max(Y)+1);
% for i = 1:length(Y)
% H(Y(i)+1) = H(Y(i)+1) + 1; %zdes podschitivaem chastotu vstrchi znachenia
% end
% bar(x, H)
% y = poisspdf(x, LAMBDA);
% hold on;
% plot(x, y*M,'r');
% hold off