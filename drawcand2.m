% This is a function which uses the candlestick function and draw the ohlc
% of a certain stock whose data is captured in the argument matrix.

function drawcand2(s)

    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    s = temp;

    % close
    green = [0.05 0.1 0.1];
    red = [0.7 0.2 0.1];
    top = max(s(:,2));
    bottom = min(s(:,3));
    
    % Plot the first candlestick. Default is green color.
    cand(s(1,1),s(1,2),s(1,3),s(1,4),1,green)
    
    for ( i = 2:length(s))
        
        if (s(i,4) > s(i-1,4))
        cand(s(i,1),s(i,2),s(i,3),s(i,4),i,green)
        else
           cand(s(i,1),s(i,2),s(i,3),s(i,4),i,red)
        end
        
    end
    
    axis([0 length(s) bottom top])
    set(gca,'FontName','Monaco');
    ylabel('Price ($)');
    grid on;
end
