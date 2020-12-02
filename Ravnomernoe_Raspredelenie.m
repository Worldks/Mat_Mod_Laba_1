clc;
clear all;
close all;

M = 9750;
K = 18;
MU = 0.5;
SIGMA = sqrt(1/12);
L = [32, 316, 1000, 3162, M];

X = unifrnd(0,1,1,M);

disp('Pervie 18 znachenii');
disp(X (1:K));
disp([ 'Max of X = ' num2str(max(X)) ' Min of X = ' num2str(min(X)) ]);
disp([ 'Theoretic MU of X = ' num2str(MU) ' Experimental MU of X =  ' num2str(mean(X)) ]);
disp([ 'Theoretic SIGMA of X = ' num2str(SIGMA) ' Experimental SIGMA of X =  ' num2str(std(X)) ]);

y = [mean(X(1:32)), mean(X(1:316)), mean(X(1:1000)), mean(X(1:3162)), mean(X(1:M))];

plot(log10(L),y,'r*--');
grid on;
hold on;
% yline(0.5,'r-'); 
hold off;
title('Graph of Theoretic MU of soem L');
ylabel('mean(L)');
xlabel('log10(L)');

figure
a=floor(min(X)); 
b=ceil(max(X)); 
x_step = (b-a)/20; 
x_hist = a+x_step/2:x_step:b-x_step/2; 
hist(X, x_hist);
title('Histograme of Uniform distribution');
ylabel('Frequence');
xlabel('Values of quantities');

figure;
hist_estim = hist(X, x_hist); 
hist_estim_norm = hist_estim/(length(X) * x_step) ; % normirovka delete /length(X)
pdf_theory = unifpdf(x_hist,0,1); 
bar(x_hist,hist_estim_norm);
% f_exp = hist_estim / M / x_step;  %experemental pdf
hold on;
plot(x_hist, pdf_theory, 'r'); 
% plot(x_hist, f_exp, 'g'); 
hold off;
title('PDF for uniform discrete distribution');
xlabel('value');
ylabel('PDF');
grid on;

% H = zeros(1, 20); % bins ? ????? ????????
% for i=1:M
% bin_index = ceil(X(i)/x_step); %h ? ?????? ???????
% if bin_index <= 20
% H(bin_index) = H(bin_index) + 1;
% end
% end
% bar(X, H);

figure;
hist_cum = cumsum(hist_estim_norm)* x_step; % t.k. neprerivnoe raspredelenie
cdf_theory = unifcdf(x_hist,0,1);  % 
hold on
stairs(x_hist, hist_cum, 'r');
plot(x_hist, cdf_theory, 'b');
hold off;
title('CDF for unifirm discrete distribution');
xlabel('value');
ylabel('CDF');
grid on;