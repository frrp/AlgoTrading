% This program opens up the main page of our "Stochastic Indicator"
% Program.
% The user is prompted is set the parameters of the stochastic indicator,
% And the values of the enter and exit strategy.

function StocGUI(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12)

close all;
figure;

title = uicontrol('style','text','Position',[0.1 0.8 0.8 0.15],'Units','normalized');
    set(title,'String','Stochastic Indicator Analyzer v. 1.0');
    set(title,'FontName','Monaco','FontSize',24);

% We set the default values to be output to StockChart.

look = 14; x = 3; y = 3; ent = 20; ext1 = 80; ext2 = 60;
TICK = [1 1 1 1; 1 1 1 1; 1 1 1 1];
    
    
% Code for the Stochastic Indicator.    
    
paraone = uibuttongroup('Parent',gcf,'Title','Parameters of Stochastic Indicator',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.1 .62 .8 .15]);
    
lookslide = uicontrol(paraone,'Style', 'slider','Min',1,'Max',25,'Value',14,'SliderStep',[(1/24) (1/24)],...
    'Callback',@slid,'FontName','Monaco','Position',[10,45,150,20]);

lookone = uicontrol(paraone,'Style','text','String','Lookback period:','Units','normalized',...
                'Position',[0.45 0.55 0.4 0.2],'FontName','Monaco');

lookone2 = uicontrol(paraone,'Style','text','String','14','Units','normalized',...
                'Position',[0.85 0.55 0.1 0.2],'FontName','Monaco'); 
    
function slid(src,evt)
    slidvalue = get(lookslide,'value');
    set(lookone2,'String',num2str(slidvalue));
    look = slidvalue;
end

xslide = uicontrol(paraone,'Style', 'slider','Min',1,'Max',10,'Value',3,'SliderStep',[(1/9) (1/9)],...
    'Callback',@xslid,'FontName','Monaco','Position',[10,25,150,20]);

xslidetxt = uicontrol(paraone,'Style','text','String','SMA of Fast %K:','Units','normalized',...
                'Position',[0.45 0.3 0.4 0.2],'FontName','Monaco');

xslidetxt2 = uicontrol(paraone,'Style','text','String','3','Units','normalized',...
                'Position',[0.85 0.3 0.1 0.2],'FontName','Monaco');              
            
function xslid(src,evt)
    xslidvalue = get(xslide,'value');
    set(xslidetxt2,'String',num2str(xslidvalue))
    x = xslidvalue;
end

yslide = uicontrol(paraone,'Style', 'slider','Min',1,'Max',10,'Value',3,'SliderStep',[(1/9) (1/9)],...
    'Callback',@yslid,'FontName','Monaco','Position',[10,5,150,20]);

yslidetxt = uicontrol(paraone,'Style','text','String','SMA of Full %K:','Units','normalized',...
                'Position',[0.45 0.1 0.4 0.2],'FontName','Monaco');

yslidetxt2 = uicontrol(paraone,'Style','text','String','3','Units','normalized',...
                'Position',[0.85 0.1 0.1 0.2],'FontName','Monaco');           
            
function yslid(src,evt)
    yslidvalue = get(yslide,'value');
    set(yslidetxt2,'String',num2str(yslidvalue)); 
    y = yslidvalue;
end


% Code for the trading strategy.

paratwo = uibuttongroup('Parent',gcf,'Title','Parameters of trading strategy',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.1 .4 .8 .2]);
    
entslide = uicontrol(paratwo,'Style', 'slider','Min',1,'Max',100,'Value',20,'SliderStep',[(1/99) (1/99)],...
    'Callback',@callent,'FontName','Monaco','Position',[0.02,0.7,0.4,0.1],'Units','normalized');

enttxt = uicontrol(paratwo,'Style','text','String','When the indicator hits this value, enter market','Units','normalized',...
                'Position',[0.45 0.6 0.4 0.3],'FontName','Monaco','FontSize',8);

enttxt2 = uicontrol(paratwo,'Style','text','String','20%','Units','normalized',...
                'Position',[0.85 0.6 0.1 0.2],'FontName','Monaco');           
            
function callent(src,evt)
    entvalue = get(entslide,'value');
    set(enttxt2,'String',strcat(num2str(entvalue),'%'));
    ent = entvalue;
end    

extslide = uicontrol(paratwo,'Style', 'slider','Min',1,'Max',100,'Value',80,'SliderStep',[(1/99) (1/99)],...
    'Callback',@callext,'FontName','Monaco','Position',[0.02,0.4,0.4,0.1],'Units','normalized');

exttxt = uicontrol(paratwo,'Style','text','String','When the indicator hits this value, check market','Units','normalized',...
                'Position',[0.45 0.3 0.4 0.3],'FontName','Monaco','FontSize',8);

exttxt2 = uicontrol(paratwo,'Style','text','String','80%','Units','normalized',...
                'Position',[0.85 0.3 0.1 0.2],'FontName','Monaco');           
            
function callext(src,evt)
    extvalue = get(extslide,'value');
    set(exttxt2,'String',strcat(num2str(extvalue),'%'));
    ext1 = extvalue;
end

exttwoslide = uicontrol(paratwo,'Style', 'slider','Min',1,'Max',100,'Value',60,'SliderStep',[(1/99) (1/99)],...
    'Callback',@callexttwo,'FontName','Monaco','Position',[0.02,0.1,0.4,0.1],'Units','normalized');

exttwotxt = uicontrol(paratwo,'Style','text','String','When the indicator hits this value, exit market','Units','normalized',...
                'Position',[0.45 0 0.4 0.3],'FontName','Monaco','FontSize',8);

exttwotxt2 = uicontrol(paratwo,'Style','text','String','60%','Units','normalized',...
                'Position',[0.85 0 0.1 0.2],'FontName','Monaco');           
            
function callexttwo(src,evt)
    exttwovalue = get(exttwoslide,'value');
    set(exttwotxt2,'String',strcat(num2str(exttwovalue),'%')); 
    ext2 = exttwovalue;
end

% Code for the selection of stocks.    
    
sselect = uibuttongroup('Parent',gcf,'Title','Selection of Stock for analysis',...
        'BackgroundColor',[0.8 0.8 0.8],'FontName','Monaco',... 
        'Position',[.1 .18 .8 .2]);      
    
UOL = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','UOL',...
                'Position',[0.13 0.7 0.4 0.15],'FontName','Monaco');
OSIM = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','OSIM',...
                'Position',[0.13 0.5 0.4 0.15],'FontName','Monaco'); 
WILMAR = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','WILMAR',...
                'Position',[0.13 0.3 0.4 0.15],'FontName','Monaco');
            
CREATIVE = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','CREATIVE',...
                'Position',[0.33 0.7 0.4 0.15],'FontName','Monaco');
KIMENG = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','KIMENG',...
                'Position',[0.33 0.5 0.4 0.15],'FontName','Monaco'); 
UOB = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','UOB',...
                'Position',[0.33 0.3 0.4 0.15],'FontName','Monaco');
           
SIA = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','SIA',...
                'Position',[0.53 0.7 0.4 0.15],'FontName','Monaco');
FandN = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','FandN',...
                'Position',[0.53 0.5 0.4 0.15],'FontName','Monaco'); 
KEPCORP = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','KEPCORP',...
                'Position',[0.53 0.3 0.4 0.15],'FontName','Monaco');     

STARHUB = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','STARHUB',...
                'Position',[0.73 0.7 0.4 0.15],'FontName','Monaco');
DBS = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','DBS',...
                'Position',[0.73 0.5 0.4 0.15],'FontName','Monaco'); 
SPH = uicontrol(sselect,'Style','checkbox','Callback',@callback,...
                'Value',1,'Units','normalized','String','SPH',...
                'Position',[0.73 0.3 0.4 0.15],'FontName','Monaco');     

StocLabel = uicontrol(sselect,'Style','text',...
                'Units','normalized','String','Less calculations of stock may improve running time.',...
                'Position',[0.1 0.1 0.9 0.15],'FontName','Monaco','FontSize',8); 
            
graph = uicontrol('Style', 'pushbutton', 'String','Execute',...
    'Callback',@execute,'FontName','Monaco',...
    'Position', [80 60 100 50]);

function execute(src,evt)

    StocChart(look,x,y,ent,ext1,ext2,TICK,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,...
        x11,x12)
% We will open our other .m file StocChart.    
    
end
            
set(gcf,'Position',[100 500 500 700],'Name','Analysis of various stocks using Stochastic Indicator');

% Best way is that we use a Case statement.
function callback(hObject, eventdata, handles)
    thislabel = get(hObject,'String');
    thistick = get(hObject,'Value');  
    
    switch thislabel
        case {'UOL'}
            TICK(1,1) = thistick;
        case {'OSIM'}
            TICK(2,1) = thistick;    
        case {'WILMAR'}
            TICK(3,1) = thistick;
        case {'CREATIVE'}
            TICK(1,2) = thistick;
        case {'KIMENG'}
            TICK(2,2) = thistick;
        case {'UOB'}
            TICK(3,2) = thistick;
        case {'SIA'}
            TICK(1,3) = thistick;
        case {'FandN'}
            TICK(2,3) = thistick;
        case {'KEPCORP'}
            TICK(3,3) = thistick;
        case {'STARHUB'}
            TICK(1,4) = thistick;
        case {'DBS'}
            TICK(2,4) = thistick;
        case {'SPH'}
            TICK(3,4) = thistick;   
    
    end
    
end


end