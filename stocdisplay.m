% This function plots the Heads Up Display of a Stochastic Indicator.

function stocdisplay(s,look,x,y,ent,ext1,ext2)

s1 = s; s2 = s;

% close all;
figure;
subplot(9,10,[51:56 61:66 71:76 81:86]);
STR = stoc(s2,look,x,y,ent,ext1,ext2);
title(strcat(inputname(1),' with Stochastic Indicator(',...
        num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10);
    
subplot(9,10,[1:6 11:16 21:26 31:36]);
drawcandstoc(s1,STR);
title(strcat('Stock Chart:',inputname(1)),'FontSize',10);


current = 0;
pnl = 0;
% Need to reverse the matrix.
for (i = 1:length(s))
    temp(length(s)-i+1,:) = s(i,:); 
end
s = temp;

% We calculate the profit here.
for (i = 1:length(STR(:,1)))
    if ( STR(i,2) > 0 )
    current = s(STR(i,2),4) - s(STR(i,1),4);
    pnl = pnl + current;
    pnl;
    end
end

namebox = uicontrol('style','text','Position',[0.65 0.7 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    thename = whatisname(inputname(1));
    set(namebox,'String',thename);
    set(namebox,'Units','characters','FontName','Monaco','FontSize',20);
    set(namebox,'ForegroundColor',[0 0.4 0]);
    
pnltext = uicontrol('style','text','Position',[0.65 0.6 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    set(pnltext,'String',strcat('Profit($)/ stock:'));
    set(pnltext,'Units','characters','FontName','Monaco','FontSize',22);
    
pnlbox = uicontrol('style','text','Position',[0.65 0.5 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    set(pnlbox,'String',num2str(pnl));
    set(pnlbox,'Units','characters','FontName','Monaco','FontSize',26);
    
% We label our strategy.
enter = uicontrol('style','text','Position',[0.63 0.5 0.35 0.1],'Units','normalized');
    set(enter,'String',strcat('Stochastic - Enter Strategy: Stochastic Indicator intercept:',num2str(ent),'% from below.'));
    set(enter,'Units','characters','FontName','Monaco');
    
exit = uicontrol('style','text','Position',[0.63 0.4 0.35 0.1],'Units','normalized');
    set(exit,'String',strcat('Stochastic - Exit Strategy: Stochastic Indicator crosses:',num2str(ext1),'% and then intercepts:',num2str(ext2),'% from above.'));
    set(exit,'Units','characters','FontName','Monaco');
    
% We label the parameters of our indicator and strategy.
para = uibuttongroup('Parent',gcf,'Title','Parameters',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.63 .15 .35 .2]);
    
lookback = uicontrol(para,'style','text','Position',[0.23 0.7 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['Look back period:' num2str(look)],'Units','Characters','FontName','Monaco','FontSize',10);

SMAFast = uicontrol(para,'style','text','Position',[0.05 0.5 0.7 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-period SMA of Fast %K:' num2str(x)],'Units','Characters','FontName','Monaco','FontSize',10);

SMAFull = uicontrol(para,'style','text','Position',[0.05 0.3 0.7 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-period SMA of Full %K:' num2str(y)],'Units','Characters','FontName','Monaco','FontSize',10);



end