% This function plots the Heads Up Display of a Stochastic Indicator.

function IndMACD(s)

s1 = s; s2 = s; pnl = 0;
stockname = inputname(1);
% We set the default variables.
x = 12; y = 26; w = 9;
ent = 20; ext1 = 80; ext2 = 60;

close all;
figure;

sdisplay2 = subplot(9,10,[1:6 11:16 21:26 31:36]);
drawcand(s1);
title(strcat('Stock Chart:',inputname(1)),'FontSize',10);


sdisplay1 = subplot(9,10,[51:56 61:66 71:76 81:86]);
MACD(s2,x,y,w);
title(strcat(inputname(1),' with MACD Indicator(',...
        num2str(x),',',num2str(y),',',num2str(w),')'),'FontSize',10);
    

% Need to reverse the matrix.
for (i = 1:length(s))
    temp(length(s)-i+1,:) = s(i,:); 
end
s = temp;

namebox = uicontrol('style','text','Position',[0.65 0.7 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    thename = whatisname(inputname(1));
    set(namebox,'String',inputname(1));
    set(namebox,'Units','characters','FontName','Monaco','FontSize',20);
    set(namebox,'ForegroundColor',[0 0.4 0]);
    
pnltext = uicontrol('style','text','Position',[0.65 0.6 0.2 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    set(pnltext,'String',strcat('Profit($)/ stock:'));
    set(pnltext,'Units','characters','FontName','Monaco','FontSize',22);
    
pnlbox = uicontrol('style','text','Position',[0.65 0.6 0.2 0.1],'Units','normalized','BackgroundColor',[0.8 0.8 0.8]);
    set(pnlbox,'String',num2str(pnl));
    set(pnlbox,'Units','characters','FontName','Monaco','FontSize',26);
    
% We label our strategy.

% Code for the buttons.
%{
parastra = uibuttongroup('Parent',gcf,'Title','Parameters of Strategy',...
        'BackgroundColor',[0.85 0.85 0.85],'FontName','Monaco',... 
        'Position',[.63 .38 .35 .2]);

enter = uicontrol(parastra,'style','text','Position',[0.04 0.7 0.35 0.2],'Units','normalized',...
    'FontName','Monaco','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],...
    'String','Enter market at');

enterval = uicontrol(parastra,'style','text','Position',[0.40 0.7 0.1 0.2],'Units','normalized',...
    'FontName','Monaco','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],...
    'String',[num2str(ent) '%']);

entslide = uicontrol(parastra,'Style', 'slider','Min',1,'Max',100,'Value',ent,'SliderStep',[(1/99) (1/99)],...
    'Callback',@entfunc,'FontName','Monaco','Position',[0.55,0.8,0.4,0.1],'Units','normalized');

check = uicontrol(parastra,'style','text','Position',[0.04 0.5 0.35 0.2],'Units','normalized',...
    'FontName','Monaco','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],...
    'String','Check market at');

checkval = uicontrol(parastra,'style','text','Position',[0.40 0.5 0.1 0.2],'Units','normalized',...
    'FontName','Monaco','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],...
    'String',[num2str(ext1) '%']);

chkslide = uicontrol(parastra,'Style', 'slider','Min',1,'Max',100,'Value',ext1,'SliderStep',[(1/99) (1/99)],...
    'Callback',@chkfunc,'FontName','Monaco','Position',[0.55,0.6,0.4,0.1],'Units','normalized');

exit = uicontrol(parastra,'style','text','Position',[0.04 0.3 0.35 0.2],'Units','normalized',...
    'FontName','Monaco','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],...
    'String','Exit market at');

exitval = uicontrol(parastra,'style','text','Position',[0.40 0.3 0.1 0.2],'Units','normalized',...
    'FontName','Monaco','FontSize',10,'BackgroundColor',[0.85 0.85 0.85],...
    'String',[num2str(ext2) '%']);

extslide = uicontrol(parastra,'Style', 'slider','Min',1,'Max',100,'Value',ext2,'SliderStep',[(1/99) (1/99)],...
    'Callback',@extfunc,'FontName','Monaco','Position',[0.55,0.4,0.4,0.1],'Units','normalized');

%}
% All our callback functions.
function entfunc(src,evt)
    slidvalue = get(entslide,'value');
    set(enterval,'String',[num2str(slidvalue) '%']);
    ent = slidvalue;
    
    % We now redraw the graphs.
    % subplot(9,10,[51:56 61:66 71:76 81:86]);
    % cla(sdisplay1);
    % stoc(s2,look,x,y,ent,ext1,ext2);
    % title(strcat(stockname,' with Stochastic Indicator(',...
    %   num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
    
end

function chkfunc(src,evt)
    slidvalue = get(chkslide,'value');
    set(checkval,'String',[num2str(slidvalue) '%']);
    ext1 = slidvalue;
    
    % We now redraw the graphs.
    % subplot(9,10,[51:56 61:66 71:76 81:86]);
    % cla(sdisplay1);
    % stoc(s2,look,x,y,ent,ext1,ext2);
    % title(strcat(stockname,' with Stochastic Indicator(',...
    %   num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);

    
end

function extfunc(src,evt)
    slidvalue = get(extslide,'value');
    set(exitval,'String',[num2str(slidvalue) '%']);
    ext2 = slidvalue;
    
    % We now redraw the graphs.
    % subplot(9,10,[51:56 61:66 71:76 81:86]);
    % cla(sdisplay1);
    % stoc(s2,look,x,y,ent,ext1,ext2);
    % title(strcat(stockname,' with Stochastic Indicator(',...
    %    num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
end

% We label the parameters of our indicator and strategy.
para = uibuttongroup('Parent',gcf,'Title','Parameters of Indicator',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.63 .15 .35 .2]);
    
lookback = uicontrol(para,'style','text','Position',[0.06 0.7 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-day Short EMA:' num2str(x)],'FontName','Monaco','FontSize',10);

lookslide = uicontrol(para,'Style', 'slider','Min',1,'Max',40,'Value',x,'SliderStep',[(1/39) (1/39)],...
    'Callback',@slid,'FontName','Monaco','Position',[0.55,0.8,0.4,0.1],'Units','normalized');

function slid(src,evt)
    slidvalue = get(lookslide,'value');
    set(lookback,'String',['x-day Short EMA:' num2str(slidvalue)]);
    x = slidvalue;
    
    % We now redraw the graphs.
    % subplot(9,10,[51:56 61:66 71:76 81:86]);
    cla(sdisplay1);
    MACD(s2,x,y,w);
    title(strcat(stockname,' with MACD Indicator(',...
        num2str(x),',',num2str(y),',',num2str(w),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
end

SMAFast = uicontrol(para,'style','text','Position',[0.03 0.5 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-day Long EMA:' num2str(y)],'FontName','Monaco','FontSize',10);

Fastslide = uicontrol(para,'Style', 'slider','Min',1,'Max',40,'Value',y,'SliderStep',[(1/39) (1/39)],...
    'Callback',@fastslid,'FontName','Monaco','Position',[0.55,0.6,0.4,0.1],'Units','normalized');

function fastslid(src,evt)
    slidvalue = get(Fastslide,'value');
    set(SMAFast,'String',['x-day Long EMA:' num2str(slidvalue)]);
    y = slidvalue;

    % We now redraw the graphs.
    % subplot(9,10,[51:56 61:66 71:76 81:86]);
    cla(sdisplay1);
    MACD(s2,x,y,w);
    title(strcat(stockname,' with Stochastic Indicator(',...
        num2str(x),',',num2str(y),',',num2str(w),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
end

SMAFull = uicontrol(para,'style','text','Position',[0.03 0.3 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['Signal x-day EMA:' num2str(w)],'FontName','Monaco','FontSize',10);

Fullslide = uicontrol(para,'Style', 'slider','Min',1,'Max',20,'Value',w,'SliderStep',[(1/19) (1/19)],...
    'Callback',@fullslid,'FontName','Monaco','Position',[0.55,0.4,0.4,0.1],'Units','normalized');

function fullslid(src,evt)
    slidvalue = get(Fullslide,'value');
    set(SMAFull,'String',['Signal x-day EMA:' num2str(slidvalue)]);
    w = slidvalue;
    
    % We now redraw the graphs.
    % subplot(9,10,[51:56 61:66 71:76 81:86]);
    cla(sdisplay1);
    MACD(s2,x,y,w);
    title(strcat(stockname,' with MACD Indicator(',...
        num2str(x),',',num2str(y),',',num2str(w),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
    
end


% We need a close button.
closebutton = uicontrol(gcf,'Style', 'pushbutton','String','Close Now',...
    'Callback',@closenow,'FontName','Monaco','Position',[0.85,0.05,0.1,0.08],'Units','normalized');

    function closenow(src,evt)
       close all;
    end

animate = uicontrol(gcf,'Style', 'pushbutton','String','Animate the Lookback',...
    'Callback',@ani,'FontName','Monaco','Position',[0.65,0.05,0.17,0.08],'Units','normalized');

    function ani(src,evt)
       currentx = get(lookslide,'value');
       for (h = 1:40)
            subplot(9,10,[51:56 61:66 71:76 81:86]);
            cla(sdisplay1);
            MACD(s2,x,y,w);
       end
       
       subplot(9,10,[51:56 61:66 71:76 81:86]);
       cla(sdisplay1);
       MACD(s2,currentx,y,w);
           
    end
    


% Our private MACD function.
function MACD(s,x,y,w)

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
    axis([0 length(s) botbound topbound]);
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
    
end

end