% This is a function which uses the candlestick function and draw the ohlc
% of a certain stock whose data is captured in the argument matrix.

function drawcandMACD(s,bsmat,x,y,w)

    % close;
    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    s = temp;

    % close
    green = [0.4 0 0.3];
    red = [0.1 0.35 0.8];
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
    
    axis([x+y+w length(s) bottom top])
    set(gca,'FontName','Monaco');    
    title(['Stock:' inputname(1)]);
    ylabel('Price ($)')
    set(gcf, 'Name', ['Stock:' inputname(1)]);
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
    
    % Draw the enter and exit signals.
    hold on;
    for (i = 1:length(bsmat(:,1)))
        plot(bsmat(i,1),s(bsmat(i,1),4),'r^','MarkerSize',8,'MarkerFaceColor','r');     % Mark intersection with red arrow.
        text(bsmat(i,1),s(bsmat(i,1),4),[' Pr: ',num2str(s(bsmat(i,1),4))],...
                'VerticalAlignment','bottom',...
                'HorizontalAlignment','left',...
                'FontSize',10,'FontName','Monaco')
        if (bsmat(i,2) > 0)
        plot(bsmat(i,2),s(bsmat(i,2),4),'bv','MarkerSize',8,'MarkerFaceColor','b');     % Mark intersection with blue arrow.
        text(bsmat(i,2),s(bsmat(i,2),4),[' Pr: ',num2str(s(bsmat(i,2),4))],...
                'VerticalAlignment','bottom',...
                'HorizontalAlignment','left',...
                'FontSize',10,'FontName','Monaco')
        end
    end
    hold off;
end
