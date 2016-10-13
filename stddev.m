% It plots the standard deviation of a stock.
% For the input argument int, use
% 1 - open, 2 - high, 3 - low, 4 - close.
% period - what is the period of the standard deviation.
% For clarity, the name of our matrices are
% Close - s(:,4), 20-day - mean, deviation = dev, deviationsq = dev2.

function stddev(s)

    int = 4;
    per = 20;
    mul = 1;
    
    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    s = temp;
    
    % Now calculate the 20-day mean.
    
    
    for (i = per:length(s))
    % The loop to start the standard deviation matrix starts here.    
            
        % First get the mean.
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s(j,4);
        end
        mean = tot / per;
    
        clear dev;
        % Now we get the deviation.
        for (j = i-per+1:i)
            dev(j) = s(j,4) - mean;
        end
        
        % Square the deviation.
        dev2 = dev.^2;
        sdmat(i) = sqrt(sum(dev2) / per);
    
    end

    % For our Bollinger band, we want to calculate the matrix for SMA.
    
    for (i = per:length(s))
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s(j,int);
        end
        SMA(i) = ( tot / per );
        
    end
    
    UPPER = SMA + (sdmat * mul);
    LOWER = SMA - (sdmat * mul);
    xaxis = [1:length(SMA)];
    hold on;
    plot(xaxis,SMA,'LineWidth',1,'Color',[0.5 0.1 0.6]);  
    plot(xaxis,UPPER,'LineWidth',1,'Color',[0.5 0.1 0.6]);
    plot(xaxis,LOWER,'LineWidth',1,'Color',[0.5 0.1 0.6]);
    hold off;
    hold on;
    
    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    s = temp;
    drawcand(s);
    hold off;
    set(gca,'FontName','Monaco');    
    title('Bollinger band with parameter -');
    set(gcf, 'Name', 'Bollinger band with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
end