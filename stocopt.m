% This function will use the stochastic indicator and find the variables
% that optimizes the trading strategy.

function stocopt(stock)

    stoc_look = 3; stoc_x = 3; stoc_y = 3;
    ent = 20; ext1 = 80; ext2 = 60;
    
    sdisplay(1) = subplot(3,5,[1:4 6:9],'position',[0.05 0.4 0.6 0.55],'xticklabel',[],'Box','on');
    
    sdisplay(2) = subplot(3,5,[11:14],'position',[0.05 0.1 0.6 0.3]);
    
    set(gcf,'Position',[200 100 1100 700])
    
    % We draw the boxes here.
    
    name_lab = uicontrol(gcf,'style','text','String','String: Stock',...
        'FontName','Monaco','FontSize',16,'Units','normalized',... 
        'Position',[.7 .7 .25 .05]);
    
    progbar = uibuttongroup('Parent',gcf,'Title','Progress Bar',...
        'BackgroundColor',[0.8 0.78 0.78],'FontName','Monaco','FontSize',8,... 
        'Position',[.68 .78 .3 .17]);
    
    indparabar = uibuttongroup('Parent',gcf,'Title','Parameters for Indicator',...
        'BackgroundColor',[0.7 0.7 0.7],'FontName','Monaco','FontSize',8,... 
        'Position',[.68 .3 .14 .37]);
    
    strparabar = uibuttongroup('Parent',gcf,'Title','Parameters for Strategy',...
        'BackgroundColor',[0.7 0.7 0.7],'FontName','Monaco','FontSize',8,... 
        'Position',[.84 .3 .14 .37]);
    
    
    
    % We start the algorithm here.
    
    clear profit1;
    % Remember that we can get profit from STR.
    for (i = stoc_look:100)
        clear STR; 
        STR = stoc(stock,i,stoc_x,stoc_y,ent,ext1,ext2);
        cla(sdisplay(1));
        cla(sdisplay(2));
        % Remember to calculate the profit.
        current = 0; pnl = 0;
        for (j = 1:length(STR(:,1)))
            if ( STR(j,2) > 0 )
            current = stock(STR(j,2),4) - stock(STR(j,1),4);
            pnl = pnl + current;
            pnl;
            end
        end
        
        profit1(i) = pnl;
    end
    
    profit1

end