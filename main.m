clc
clear all
close all

M = csvread('AMEX_daily_prices_A2.csv');

% for ii=1:50
% Stockdata(ii).id=ii;
% % Stockdata(ii).date=M(ii,1);
% Stockdata(ii).stock_price_open=M(ii,2);
% Stockdata(ii).stock_price_high=M(ii,3);
% Stockdata(ii).stock_price_low=M(ii,4);
% Stockdata(ii).stock_price_close=M(ii,5);
% % Stockdata(ii).stock_volume=M(ii,6);
% % Stockdata(ii).stock_price_adj_close=M(ii,7);
% end



for ii=1:100
data_to_train(ii,1)=M(ii,2);
data_to_train(ii,2)=M(ii,3);
data_to_train(ii,3)=M(ii,4);
data_to_train(ii,4)=M(ii,5);
end


b=data_to_train(1:100,1:3);
Input=b';
Output=data_to_train(1:100,4)';

for ii=1:1:3
    val= minmax(Input(ii,1:100));
    RS(ii,1)=val(1,1);
    RS(ii,2)=val(1,2);
end

S=[3 10 1];
net = newff(RS,S,{'tansig','tansig','purelin'});

net.trainParam.epochs = 500;
[net,tr,Y,E,Pf,Af]=train(net,Input,Output);

mean_error=tr.perf;
No_of_epoch=tr.epoch;

figure;
for ii=2:5:50
epoch(ii)=No_of_epoch(ii);
MSE(ii)=mean_error(ii);
end
plot(epoch,MSE,'-r*')




for ii=1:100
test_data(ii,1)=M(ii+100,2);
test_data(ii,2)=M(ii+100,3);
test_data(ii,3)=M(ii+100,4);
test_data(ii,4)=M(ii+100,5);
end

b=test_data(1:100,1:3);
Input_testdata=b';
expected_Output=test_data(1:100,4)';

for ii=1:100
Predicted_Output(ii)=sim(net,Input_testdata(1:3,ii));
end


mse_error1=calc_mse(expected_Output,Predicted_Output);

figure;
plot(expected_Output,'-k.');
hold on;
plot(Predicted_Output,'-r*');
hold on;
legend('Expected prise','Predicted value')



