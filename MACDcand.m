% This function will draw a candlestick.
% It will take the following parameters:
% o - open.
% h - high.
% l - low.
% c - close.
% t - time. (Usually in days)

% The input arguments are single values.
function MACDcand(val,t,col)

hold on;

    fill([t-1 t t t-1],[0 0 val val],col)
    
hold off;

end