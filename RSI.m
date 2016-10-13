% This m.file is a function that plots the candlestick diagram and the RSI
% indicator.

function RSI(stock)

per = 14;
s1 = stock; s2 = stock;

sdisplay(1) = subplot(2,1,1);
drawcand(s1);
sdisplay(2) = subplot(2,1,2);

% Get vector of gain / loss.
for (i = 2:length(s2(:,4)))
   gl(i) =  s2(i,4) - s2(i-1,4);
end

% We first calculate the first average gain and loss.
firstgain = 0; firstloss = 0;
for (i = 1:per)
   
    if ( gl(i) >= 0 )
        firstgain = firstgain + gl(i);
    else
        firstloss = firstloss +
    
end


firstgain =




end