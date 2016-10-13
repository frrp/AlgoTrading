% It plots the moving average of a stock.
% For the input argument int, use
% 1 - open, 2 - high, 3 - low, 4 - close.
% day - how many days back do you want to calculate the moving average
% from.

function movavg(s,day)

    int = 4;
    
    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    s = temp;
    
    % Form a new matrix.
    for (i = day:length(s))
        tot = 0;
        for (j = i-day+1:i)
            tot = tot + s(j,int);
        end
        MAVG(i) = ( tot / day );
        
    end

    xaxis = [day:length(MAVG)];
    MAVG(1:day-1) = [];
    plot(xaxis,MAVG);
    set(gca,'FontName','Monaco');    
    title('Simple Moving average with parameter -');
    set(gcf, 'Name', 'Simple Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
end