% It plots the moving average of a stock.
% For the input argument int, use
% 1 - open, 2 - high, 3 - low, 4 - close.
% day - how many days back do you want to calculate the moving average
% from.

function STR = MACD(s,x,y,w)

    % close all;
    int = 4;
    upcol = [0.4 0 0.3];
    downcol = [0.3 0.55 1];
    
    XEMA = expavg(s,x);
    YEMA = expavg(s,y);
    MACDmat = XEMA - YEMA;
    % Create 9-day EMA of MACD.
    
    % Calculate the SMA for the first point.
    tot = 0;
    for (i = 1:w)
        tot = tot + MACDmat(i);
        SIG(w) = (tot / w );
    end
    
    % Calculate the multiplier.
    mul = (2 / (w + 1) );
   
    % Form the Exponential moving average matrix.
    for (i = w+1:length(MACDmat))
       SIG(i) = ( MACDmat(i) - SIG(i-1) ) * mul + SIG(i-1);         
    end
   
    xaxis = [1:length(MACDmat)];
    hold on;
    plot(xaxis,MACDmat,'Color',[0.8 0 0.3],'LineWidth',1.5);
    plot(xaxis,SIG,'Color',[0.3 0.1 0.8],'LineWidth',1.5);
    
    % Plot the Histogram.
    HIST = MACDmat - SIG;
    for (i = x+y+w:length(HIST))
       
        if (HIST(i) > HIST(i-1))
            fill([i-1 i i i-1],[0 0 HIST(i) HIST(i)],upcol)
        else
            fill([i-1 i i i-1],[0 0 HIST(i) HIST(i)],downcol)
        end
        
    end
    
    topbound = max([max(MACDmat(x+y+w:length(MACDmat))) max(SIG(x+y+w:length(MACDmat))) ...
                    max(HIST(x+y+w:length(MACDmat)))]);
    botbound = min([min(MACDmat(x+y+w:length(MACDmat))) min(SIG(x+y+w:length(MACDmat))) ...
                    min(HIST(x+y+w:length(MACDmat)))]);
    
    hold off;
    axis([x+y+w length(MACDmat) botbound topbound]);
    set(gca,'FontName','Monaco');
    title(['MACD with parameter (' num2str(x) ',' num2str(y) ',' num2str(w) ')']);
    ylabel('MACD indicator ($)');
    xlabel('Time (1 day)');
    set(gcf, 'Name', ['MACD with parameter (' num2str(x) ',' num2str(y) ',' num2str(w) ')']);
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
    alpha(0.8);
    % We write the code here to calculate the Buy and Sell matrix. We label
    % it as STR matrix.
    
    % We will start our analysis from the time x+y+w.
    
    clear STR;
    ct = 1;
    start = x+y+w;
    flag = 0; % 0 is currently negative, 1 is currently positive.
    % We first find the time when the HIST gives a negative value.
    for (i = start:length(HIST))
        if (HIST(i) < 0)
            start = i;
            break;
        end
    end
    
    for (i = start+1:length(HIST))
       if (flag == 0)
            if (HIST(i) > 0)
                STR(ct,1) = i;
                flag = 1;
            end
       else
            if (HIST(i) < 0)
                STR(ct,2) = i;
                ct = ct + 1;
                flag = 0;
            end
       end
    end
    
    hold on;
    for (i = 1:length(STR(:,1)))
        plot(STR(i,1),SIG(STR(i,1)),'r^','MarkerSize',8,'MarkerFaceColor','r');     % Mark intersection with red arrow.
        text(STR(i,1),SIG(STR(i,1)),[' Buy at ',num2str(STR(i,1))],...
                'VerticalAlignment','top',...
                'HorizontalAlignment','left',...
                'FontSize',12,'FontName','Monaco')
        text(STR(i,1),SIG(STR(i,1)),[' Pr: ',num2str(s(STR(i,1),4))],...
                'VerticalAlignment','bottom',...
                'HorizontalAlignment','left',...
                'FontSize',14,'FontName','Monaco')
        if (STR(i,2) > 0)
        plot(STR(i,2),SIG(STR(i,2)),'bv','MarkerSize',8,'MarkerFaceColor','b');     % Mark intersection with blue arrow.
        text(STR(i,2),SIG(STR(i,2)),[' Sell at ',num2str(STR(i,2))],...
                'VerticalAlignment','top',...
                'HorizontalAlignment','left',...
                'FontSize',12,'FontName','Monaco')
        text(STR(i,2),SIG(STR(i,2)),[' Pr: ',num2str(s(STR(i,2),4))],...
                'VerticalAlignment','bottom',...
                'HorizontalAlignment','left',...
                'FontSize',14,'FontName','Monaco')
        end
    end
    hold off;
    
    % Now run through the STR matrix to draw the buy and sell arrows.
    
    
end