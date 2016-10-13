% This function plots the Heads Up Display of a Stochastic Indicator.

function MACDdisplay(s,x1,x2,x3)

s1 = s; s2 = s;

close all;
figure;
subplot(9,10,[51:56 61:66 71:76 81:86]);
STR = MACD(s1,x1,x2,x3);
title(strcat(inputname(1),' with MACD Indicator(',...
        num2str(x1),',',num2str(x2),',',num2str(x3),')'),'FontSize',10);
    
subplot(9,10,[1:6 11:16 21:26 31:36]);
drawcandMACD(s2,STR,x1,x2,x3);
title(strcat('Stock Chart:',inputname(1)),'FontSize',10);


% Need to reverse the matrix.
for (i = 1:length(s))
    temp(length(s)-i+1,:) = s(i,:); 
end
s = temp;

% We calculate the profit here.
current = 0;
pnl = 0;
for (i = 1:length(STR(:,1)))
    if ( STR(i,2) > 0 )
    current = s(STR(i,2),4) - s(STR(i,1),4);
    pnl = pnl + current;
    pnl;
    end
end

namebox = uicontrol('style','text','Position',[0.65 0.7 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    thename = whatisname(inputname(1));
    set(namebox,'String',inputname(1));
    set(namebox,'Units','characters','FontName','Monaco','FontSize',20);
    set(namebox,'ForegroundColor',[0 0.4 0]);
    
pnltext = uicontrol('style','text','Position',[0.65 0.6 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    set(pnltext,'String',strcat('Profit($)/ stock:'));
    set(pnltext,'Units','characters','FontName','Monaco','FontSize',22);
    
pnlbox = uicontrol('style','text','Position',[0.65 0.5 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    set(pnlbox,'String',num2str(pnl));
    set(pnlbox,'Units','characters','FontName','Monaco','FontSize',26);
    
% We label our strategy.
enter = uicontrol('style','text','Position',[0.63 0.5 0.32 0.1],'Units','normalized','HorizontalAlignment','left');
    set(enter,'String','We Enter the market when the MACD Histogram shifts from Negative to Positive.');
    set(enter,'Units','characters','FontName','Monaco');
    
exit = uicontrol('style','text','Position',[0.63 0.4 0.32 0.1],'Units','normalized','HorizontalAlignment','left');
    set(exit,'String','We Exit the market when the MACD Histogram shifts from Positive to Negative.');
    set(exit,'Units','characters','FontName','Monaco');
    
% We label the parameters of our indicator and strategy.
para = uibuttongroup('Parent',gcf,'Title','Parameters',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.63 .15 .35 .2]);
    
lookback = uicontrol(para,'style','text','Position',[0.05 0.7 0.4 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-day Short EMA:' num2str(x1)],'Units','Characters','FontName','Monaco','FontSize',10,'HorizontalAlignment','Right');

SMAFast = uicontrol(para,'style','text','Position',[0.05 0.5 0.4 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-day Long EMA:' num2str(x2)],'Units','Characters','FontName','Monaco','FontSize',10,'HorizontalAlignment','Right');

SMAFull = uicontrol(para,'style','text','Position',[0.05 0.3 0.4 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['Signal x-day EMA:' num2str(x3)],'Units','Characters','FontName','Monaco','FontSize',10,'HorizontalAlignment','Right');



end