 % This function plots the Heads Up Display of a Stochastic Indicator.

function IndMA(s)

s1 = s; s2 = s; s3=s; pnl = 0;
stockname = inputname(1);
% We set the default variables.
x = 9; y = 9;
ent = 20; ext1 = 80; ext2 = 60;

    % Need to reverse the matrix.
    for (i = 1:length(s1))
       temp(length(s1)-i+1,:) = s1(i,:); 
    end
    s1 = temp;


close all;
figure;
sdisplay = subplot(9,10,[1:6 11:16 21:26 31:36 41:46 51:56 61:66 71:76 81:86]);
drawcand(s2);
hold on;
%movavg1(s2,x);
%expavg1(s3,y);

% Export the whole SMA function here.


int = 4;

    % Form a new matrix.
    for (i = x:length(s1))
        tot = 0;
        for (j = i-x+1:i)
            tot = tot + s1(j,int);
        end
        
        MAVG(i) = ( tot / x );
        
    end

    xaxis = [x:length(MAVG)];
    MAVG(1:x-1) = [];
    curplot = plot(xaxis,MAVG,'LineWidth',2,'Color',[0.8 0.1 0.1]);
    set(gca,'FontName','Monaco');    
    set(gcf, 'Name', 'Simple Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;

% Export the whole EMA function here.

    int = 4;    
    % Calculate the SMA for the first point.
    tot = 0;
    for (i = 1:y)
        tot = tot + s1(i);
        EAVG(y) = (tot / y );
    end
    
    % Calculate the multiplier.
    mul = (2 / (y + 1) );
   
    % Form the Exponential moving average matrix.
    for (i = y+1:length(s1))
       EAVG(i) = ( s1(i,4) - EAVG(i-1) ) * mul + EAVG(i-1);         
    end

    xaxis = [y:length(EAVG)];
    EAVGorig = EAVG;
    EAVG(1:y - 1) = [];
    curplot2 = plot(xaxis,EAVG,'LineWidth',2,'Color',[0.3 0.1 0.8]);
    set(gca,'FontName','Monaco');    
    title('Exponential Moving average with parameter -');
    set(gcf, 'Name', 'Exponential Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;

hold off;

title([inputname(1) ' with indicator SMA:' num2str(x) ' and EMA:' num2str(y)],'FontSize',10);

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
    %     num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    % 
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
    %     num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
end

% We label the parameters of our indicator and strategy.
para = uibuttongroup('Parent',gcf,'Title','Parameters of Indicator',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.63 .15 .35 .2]);
    
%{    
lookback = uicontrol(para,'style','text','Position',[0.06 0.7 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['Look back period:' num2str(look)],'FontName','Monaco','FontSize',10);

lookslide = uicontrol(para,'Style', 'slider','Min',1,'Max',30,'Value',look,'SliderStep',[(1/29) (1/29)],...
    'Callback',@slid,'FontName','Monaco','Position',[0.55,0.8,0.4,0.1],'Units','normalized');

function slid(src,evt)
    slidvalue = get(lookslide,'value');
    set(lookback,'String',['Look back period:' num2str(slidvalue)]);
    look = slidvalue;
    
    % We now redraw the graphs.
    subplot(9,10,[51:56 61:66 71:76 81:86]);
    cla(sdisplay1);
    stoc(s2,look,x,y,ent,ext1,ext2);
    title(strcat(stockname,' with Stochastic Indicator(',...
        num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
end
%}
        
SMAFast = uicontrol(para,'style','text','Position',[0.03 0.5 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['Look back for SMA:' num2str(x)],'FontName','Monaco','FontSize',10);

Fastslide = uicontrol(para,'Style', 'slider','Min',1,'Max',50,'Value',x,'SliderStep',[(1/49) (1/49)],...
    'Callback',@fastslid,'FontName','Monaco','Position',[0.55,0.6,0.4,0.1],'Units','normalized');

function fastslid(src,evt)
    
    slidvalue = get(Fastslide,'value');
    set(SMAFast,'String',['Look back for SMA:' num2str(slidvalue)]);
    x = ceil(slidvalue);
    
    % We now redraw the graphs.
    % subplot(9,10,[1:6 11:16 21:26 31:36 41:46 51:56 61:66 71:76 81:86]);

    hold on;
    
    delete(curplot);
    clear MAVG;
    int = 4;

    
    % Form a new matrix.
    for (i = x:length(s1))
        tot = 0;
        for (j = i-x+1:i)
            tot = tot + s1(j,int);
        end
        
        MAVG(i) = ( tot / x );
        
    end

    xaxis = [x:length(MAVG)];
    MAVG(1:x-1) = [];
    curplot = plot(xaxis,MAVG,'LineWidth',2,'Color',[0.8 0.1 0.1]);
    set(gca,'FontName','Monaco');    
    set(gcf, 'Name', 'Simple Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;

    hold off;

    title([inputname(1) ' with indicator SMA:' num2str(x) ' and EMA:' num2str(y)],'FontSize',10);
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);
    
end

SMAFull = uicontrol(para,'style','text','Position',[0.03 0.3 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['Look back for EMA:' num2str(y)],'FontName','Monaco','FontSize',10);

Fullslide = uicontrol(para,'Style', 'slider','Min',1,'Max',50,'Value',y,'SliderStep',[(1/49) (1/49)],...
    'Callback',@fullslid,'FontName','Monaco','Position',[0.55,0.4,0.4,0.1],'Units','normalized');

function fullslid(src,evt)
    slidvalue = get(Fullslide,'value');
    set(SMAFull,'String',['Look back for EMA:' num2str(slidvalue)]);
    y = ceil(slidvalue);
    
    % subplot(9,10,[1:6 11:16 21:26 31:36 41:46 51:56 61:66 71:76 81:86]);

    hold on;
    
    delete(curplot2);
    clear EAVG;
    clear EVGorig;
    
    int = 4;    
    % Calculate the SMA for the first point.
    tot = 0;
    for (i = 1:y)
        tot = tot + s1(i);
        EAVG(y) = (tot / y );
    end
    
    % Calculate the multiplier.
    mul = (2 / (y + 1) );
   
    % Form the Exponential moving average matrix.
    for (i = y+1:length(s1))
       EAVG(i) = ( s1(i,4) - EAVG(i-1) ) * mul + EAVG(i-1);         
    end

    xaxis = [y:length(EAVG)];
    EAVGorig = EAVG;
    EAVG(1:y - 1) = [];
    curplot2 = plot(xaxis,EAVG,'LineWidth',2,'Color',[0.3 0.1 0.8]);
    set(gca,'FontName','Monaco');    
    title('Exponential Moving average with parameter -');
    set(gcf, 'Name', 'Exponential Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
    
    

    hold off;

    title([inputname(1) ' with indicator SMA:' num2str(x) ' and EMA:' num2str(y)],'FontSize',10);
    
end


% We need a close button.
closebutton = uicontrol(gcf,'Style', 'pushbutton','String','Close Now',...
    'Callback',@closenow,'FontName','Monaco','Position',[0.85,0.05,0.1,0.08],'Units','normalized');

    function closenow(src,evt)
       close all;
    end
%{
animate = uicontrol(gcf,'Style', 'pushbutton','String','Animate the Lookback',...
    'Callback',@ani,'FontName','Monaco','Position',[0.65,0.05,0.17,0.08],'Units','normalized');

    function ani(src,evt)
       currentlook = get(lookslide,'value');
       for (h = 3:25)
            subplot(9,10,[51:56 61:66 71:76 81:86]);
            cla(sdisplay1);
            stoc(s2,h,3,3,ent,ext1,ext2);
            pause(0.05)
       end
       
       subplot(9,10,[51:56 61:66 71:76 81:86]);
       cla(sdisplay1);
       stoc(s2,currentlook,3,3,ent,ext1,ext2);
           
    end
%}    


% Our private SMA and EMA function.
function expavg1(s,period)

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
    plot(xaxis,EAVG,'LineWidth',2,'Color',[0.3 0.1 0.8]);
    set(gca,'FontName','Monaco');    
    title('Exponential Moving average with parameter -');
    set(gcf, 'Name', 'Exponential Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
end

function movavg1(s,day)

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
    curplot = plot(xaxis,MAVG,'LineWidth',2,'Color',[0.8 0.1 0.1]);
    set(gca,'FontName','Monaco');    
    title(['Simple Moving average with parameter' inputname(2) ]);
    set(gcf, 'Name', 'Simple Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
    
end



end