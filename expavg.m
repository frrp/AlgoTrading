% It plots the exponential moving average of a stock.
% For the input argument int, use
% 1 - open, 2 - high, 3 - low, 4 - close.
% day - how many days back do you want to calculate the moving average
% from.

function EAVGorig = expavg(s,period)

    int = 4;
    
    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    s = temp;
    
    % Calculate the SMA for the first point.
    tot = 0;
    for (i = 1:period)
        tot = tot + s(i);
        EAVG(period) = (tot / period );
    end
    
    % Calculate the multiplier.
    mul = (2 / (period + 1) );
   
    % Form the Exponential moving average matrix.
    for (i = period+1:length(s))
       EAVG(i) = ( s(i,4) - EAVG(i-1) ) * mul + EAVG(i-1);         
    end

    xaxis = [period:length(EAVG)];
    EAVGorig = EAVG;
    EAVG(1:period - 1) = [];
    plot(xaxis,EAVG);
    set(gca,'FontName','Monaco');    
    title('Exponential Moving average with parameter -');
    set(gcf, 'Name', 'Exponential Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
end