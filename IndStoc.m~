% This function plots the Heads Up Display of a Stochastic Indicator.

function IndStoc(s)

s1 = s; s2 = s; pnl = 0;
stockname = inputname(1);
% We set the default variables.
look = 14; x = 3; y = 3;
ent = 20; ext1 = 80; ext2 = 60;

close all;
figure;
sdisplay1 = subplot(9,10,[51:56 61:66 71:76 81:86]);
stoc(s2,look,x,y,ent,ext1,ext2);
title(strcat(inputname(1),' with Stochastic Indicator(',...
        num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10);
    
sdisplay2 = subplot(9,10,[1:6 11:16 21:26 31:36]);
drawcand(s1);
title(strcat('Stock Chart:',inputname(1)),'FontSize',10);


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

checkval = uicontrol(parastra,'style','text','',[0.40 0.5 0.1 0.2],'Units','normalized',...
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
    subplot(9,10,[51:56 61:66 71:76 81:86]);
    cla(sdisplay1);
    stoc(s2,look,x,y,ent,ext1,ext2);
    title(strcat(stockname,' with Stochastic Indicator(',...
        num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    subplot(9,10,[1:6 11:16 21:26 31:36]);
    cla(sdisplay2);
    drawcand(s1);
    title(strcat('Stock Chart:',stockname),'FontSize',10);
    
    
end

function chkfunc(src,evt)
    slidvalue = get(chkslide,'value');
    set(checkval,'String',[num2str(slidvalue) '%']);
    ext1 = slidvalue;
    
    % We now redraw the graphs.
    subplot(9,10,[51:56 61:66 71:76 81:86]);
    cla(sdisplay1);
    stoc(s2,look,x,y,ent,ext1,ext2);
    title(strcat(stockname,' with Stochastic Indicator(',...
        num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    subplot(9,10,[1:6 11:16 21:26 31:36]);
    cla(sdisplay2);
    drawcand(s1);
    title(strcat('Stock Chart:',stockname),'FontSize',10);

    
end

function extfunc(src,evt)
    slidvalue = get(extslide,'value');
    set(exitval,'String',[num2str(slidvalue) '%']);
    ext2 = slidvalue;
    
    % We now redraw the graphs.
    subplot(9,10,[51:56 61:66 71:76 81:86]);
    cla(sdisplay1);
    stoc(s2,look,x,y,ent,ext1,ext2);
    title(strcat(stockname,' with Stochastic Indicator(',...
        num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10)
    
    subplot(9,10,[1:6 11:16 21:26 31:36]);
    cla(sdisplay2);
    drawcand(s1);
    title(strcat('Stock Chart:',stockname),'FontSize',10);
    
end

% We label the parameters of our indicator and strategy.
para = uibuttongroup('Parent',gcf,'Title','Parameters of Indicator',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.63 .15 .35 .2]);
    
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

SMAFast = uicontrol(para,'style','text','Position',[0.03 0.5 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-T SMA of Fast %K:' num2str(x)],'FontName','Monaco','FontSize',10);

Fastslide = uicontrol(para,'Style', 'slider','Min',1,'Max',10,'Value',x,'SliderStep',[(1/9) (1/9)],...
    'Callback',@fastslid,'FontName','Monaco','Position',[0.55,0.6,0.4,0.1],'Units','normalized');

function fastslid(src,evt)
    slidvalue = get(Fastslide,'value');
    set(SMAFast,'String',['x-T SMA of Fast %K:' num2str(slidvalue)]);
    x = slidvalue;

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

SMAFull = uicontrol(para,'style','text','Position',[0.03 0.3 0.5 0.2],'Units','normalized','BackgroundColor',[0.8 0.8 0.8],...
    'String',['x-T SMA of Full %K:' num2str(y)],'FontName','Monaco','FontSize',10);

Fullslide = uicontrol(para,'Style', 'slider','Min',1,'Max',10,'Value',x,'SliderStep',[(1/9) (1/9)],...
    'Callback',@fullslid,'FontName','Monaco','Position',[0.55,0.4,0.4,0.1],'Units','normalized');

function fullslid(src,evt)
    slidvalue = get(Fullslide,'value');
    set(SMAFull,'String',['x-T SMA of Full %K:' num2str(slidvalue)]);
    y = slidvalue;
    
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
    


% Our private Stochastic function.
function stoc(s,look,x,y,ent,ext1,ext2)

    % close;
    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    
    s = temp;
    upbound = ext1; 
    lowbound = ent;
    topmid = ext2;
    boundcol = [0.3 0.3 0.3];
    midcol = [0.4 0 0.4];
    % Form a new matrix.
    for (i = look:length(s))
        
        low = min(s(i-look+1:i,3));
        high = max(s(i-look+1:i,2));
        % First get the Fast %K.
        FastK(i) = ( ( s(i,4) - low ) / ( high - low) ) * 100;
        
    end
    
    % Now get the Full %K.
    
    for (i = look : length(s))
        tot = 0;
        for (j = i-x+1:i)
            tot = tot + FastK(j);
        end
        FullK(i) = ( tot / x );
        
    end
    
    % Now get the Full %D.
    
    for (i = look : length(s))
        tot = 0;
        for (j = i-y+1:i)
            tot = tot + FullK(j);
        end
        FullD(i) = ( tot / y );
        
    end
    
    xaxis = [1:length(FullK)];    
    len = length(xaxis);

    %figure;
    hold on;
    plot(xaxis(look:len),FullK(look:len),'Color',[0.87 0 0.3]);
    plot(xaxis(look:len),FullD(look:len),'Color',[0.2 0 0.4]);
    hold off;
    set(gca,'FontName','Monaco');
    axis([0 length(s) 0 100])
    grid on;

end



end