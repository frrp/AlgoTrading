 % This function plots the Heads Up Display of a Stochastic Indicator.

function IndBol(s)

s1 = s; s2 = s; s3=s; pnl = 0;
stockname = inputname(1);
% We set the default variables.
per = 20; mul = 1;
ent = 20; ext1 = 80; ext2 = 60;

% Need to reverse the matrix.
    for (i = 1:length(s1))
       temp(length(s1)-i+1,:) = s(i,:); 
    end
    s1 = temp;

% close all;
figure;
sdisplay = subplot(9,10,[1:6 11:16 21:26 31:36 41:46 51:56 61:66 71:76 81:86]);
drawcand(s);
hold on;

% Import the whole Bollinger function here!

    int = 4;
    
    
    % Now calculate the 20-day mean.
    
    
    for (i = per:length(s1))
    % The loop to start the standard deviation matrix starts here.    
            
        % First get the mean.
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s1(j,4);
        end
        mean = tot / per;
    
        clear dev;
        % Now we get the deviation.
        for (j = i-per+1:i)
            dev(j) = s1(j,4) - mean;
        end
        
        % Square the deviation.
        dev2 = dev.^2;
        sdmat(i) = sqrt(sum(dev2) / per);
    
    end

    % For our Bollinger band, we want to calculate the matrix for SMA.
    
    for (i = per:length(s1))
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s1(j,int);
        end
        SMA(i) = ( tot / per );
        
    end
    
    UPPER1 = SMA + (sdmat * mul);
    UPPER2 = SMA + (sdmat * (mul+1));
    LOWER1 = SMA - (sdmat * mul);
    LOWER2 = SMA - (sdmat * (mul+1));
    xaxis = [1:length(SMA)];
    hold on;
    bolband1 = plot(xaxis,SMA,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1,'LineStyle','--');  
    bolband2 = plot(xaxis,UPPER1,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband3 = plot(xaxis,LOWER1,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband4 = plot(xaxis,UPPER2,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband5 = plot(xaxis,LOWER2,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    hold off;
    set(gca,'FontName','Monaco');    
    title([inputname(1) ' with indicator Bollinger band:' num2str(per) ',' num2str(mul)],'FontSize',10);
    set(gcf, 'Name', [inputname(1) ' with indicator Bollinger band:' num2str(per) ',' num2str(mul)]);
    set(gcf,'Position',[100 500 1100 700]);
    grid on;

% End of Bollinger function ---

hold off;

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
    'String',['Look back period:' num2str(per)],'FontName','Monaco','FontSize',10);

Fastslide = uicontrol(para,'Style', 'slider','Min',1,'Max',50,'Value',per,'SliderStep',[(1/49) (1/49)],...
    'Callback',@fastslid,'FontName','Monaco','Position',[0.55,0.6,0.4,0.1],'Units','normalized');

function fastslid(src,evt)
    
    slidvalue = get(Fastslide,'value');
    set(SMAFast,'String',['Look back period:' num2str(slidvalue)]);
    per = ceil(slidvalue);
    
    % We now redraw the graphs.
    % subplot(9,10,[1:6 11:16 21:26 31:36 41:46 51:56 61:66 71:76 81:86]);
    delete(bolband1);
    delete(bolband2);
    delete(bolband3);
    delete(bolband4);
    delete(bolband5);
    
    % cla(sdisplay);
    % drawcand(s1);
    hold on;
    
    int = 4;

    % Now calculate the 20-day mean.
    
    
    for (i = per:length(s1))
    % The loop to start the standard deviation matrix starts here.    
            
        % First get the mean.
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s1(j,4);
        end
        mean = tot / per;
    
        clear dev;
        % Now we get the deviation.
        for (j = i-per+1:i)
            dev(j) = s1(j,4) - mean;
        end
        
        % Square the deviation.
        dev2 = dev.^2;
        sdmat(i) = sqrt(sum(dev2) / per);
    
    end

    % For our Bollinger band, we want to calculate the matrix for SMA.
    
    for (i = per:length(s1))
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s1(j,int);
        end
        SMA(i) = ( tot / per );
        
    end
    
    UPPER1 = SMA + (sdmat * mul);
    UPPER2 = SMA + (sdmat * (mul+1));
    LOWER1 = SMA - (sdmat * mul);
    LOWER2 = SMA - (sdmat * (mul+1));
    xaxis = [1:length(SMA)];
    hold on;
    bolband1 = plot(xaxis,SMA,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1,'LineStyle','--');  
    bolband2 = plot(xaxis,UPPER1,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband3 = plot(xaxis,LOWER1,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband4 = plot(xaxis,UPPER2,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband5 = plot(xaxis,LOWER2,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    hold off;
    
    set(gca,'FontName','Monaco');    
    title([inputname(1) ' with indicator Bollinger band:' num2str(per) ',' num2str(mul)],'FontSize',10);
    set(gcf, 'Name', [inputname(1) ' with indicator Bollinger band:' num2str(per) ',' num2str(mul)]);
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
    
    hold off;

    title([inputname(1) ' with indicator SMA:' num2str(per) ' and EMA:' num2str(mul)],'FontSize',10);
    
    % subplot(9,10,[1:6 11:16 21:26 31:36]);
    % cla(sdisplay2);
    % drawcand(s1);
    % title(strcat('Stock Chart:',stockname),'FontSize',10);

end

SMAFull = uicontrol(para,'style','text','Position',[0.03 0.3 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['Mul (and +1):' num2str(mul)],'FontName','Monaco','FontSize',10);

Fullslide = uicontrol(para,'Style', 'slider','Min',1,'Max',5,'Value',mul,'SliderStep',[(1/80) (1/80)],...
    'Callback',@fullslid,'FontName','Monaco','Position',[0.55,0.4,0.4,0.1],'Units','normalized');

function fullslid(src,evt)
    slidvalue = get(Fullslide,'value');
    set(SMAFull,'String',['Mul (and +1):' num2str(slidvalue)]);
    mul = slidvalue;
    
    % We now redraw the graphs.
    % subplot(9,10,[1:6 11:16 21:26 31:36 41:46 51:56 61:66 71:76 81:86]);
    delete(bolband1);
    delete(bolband2);
    delete(bolband3);
    delete(bolband4);
    delete(bolband5);
    % cla(sdisplay);
    % drawcand(s1);
    hold on;
    
    int = 4;

    % Now calculate the 20-day mean.
    
    
    for (i = per:length(s1))
    % The loop to start the standard deviation matrix starts here.    
            
        % First get the mean.
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s1(j,4);
        end
        mean = tot / per;
    
        clear dev;
        % Now we get the deviation.
        for (j = i-per+1:i)
            dev(j) = s1(j,4) - mean;
        end
        
        % Square the deviation.
        dev2 = dev.^2;
        sdmat(i) = sqrt(sum(dev2) / per);
    
    end

    % For our Bollinger band, we want to calculate the matrix for SMA.
    
    for (i = per:length(s1))
        tot = 0;
        for (j = i-per+1:i)
            tot = tot + s1(j,int);
        end
        SMA(i) = ( tot / per );
        
    end

    UPPER1 = SMA + (sdmat * mul);
    UPPER2 = SMA + (sdmat * (mul+1));
    LOWER1 = SMA - (sdmat * mul);
    LOWER2 = SMA - (sdmat * (mul+1));
    xaxis = [1:length(SMA)];
    hold on;
    bolband1 = plot(xaxis,SMA,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1,'LineStyle','--');  
    bolband2 = plot(xaxis,UPPER1,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband3 = plot(xaxis,LOWER1,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband4 = plot(xaxis,UPPER2,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    bolband5 = plot(xaxis,LOWER2,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',1);
    hold off;
    set(gca,'FontName','Monaco');    
    title([inputname(1) ' with indicator Bollinger band:' num2str(per) ',' num2str(mul)],'FontSize',10);
    set(gcf, 'Name', [inputname(1) ' with indicator Bollinger band:' num2str(per) ',' num2str(mul)]);
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
    
    hold off;

    title([inputname(1) ' with indicator SMA:' num2str(per) ' and EMA:' num2str(mul)],'FontSize',10);
    
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
    


% Our private SMA and EMA function.
function expavg(s,period)

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
    plot(xaxis,MAVG,'LineWidth',2,'Color',[0.8 0.1 0.1]);
    set(gca,'FontName','Monaco');    
    title('Simple Moving average with parameter -');
    set(gcf, 'Name', 'Simple Moving average with parameter -');
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
    
end

% Our private Bollinger function.
function bol(s,per,mul)

    int = 4;
    
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
    bolband1 = plot(xaxis,SMA,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',2);  
    bolband2 = plot(xaxis,UPPER,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',2,'LineStyle','--');
    bolband3 = plot(xaxis,LOWER,'LineWidth',1,'Color',[0.5 0.1 0.6],'LineWidth',2,'LineStyle','--');
    hold off;
    set(gca,'FontName','Monaco');    
    title([inputname(1) ' with indicator Bollinger band:' num2str(x) ',' num2str(y)],'FontSize',10);
    set(gcf, 'Name', [inputname(1) ' with indicator Bollinger band:' num2str(x) ',' num2str(y)]);
    set(gcf,'Position',[100 500 1100 700]);
    grid on;
end


end