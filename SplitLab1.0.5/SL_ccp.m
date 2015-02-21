
global config ccp
Hccp=figure('NumberTitle','off',...
        'name','CCP Stacking',...
        'renderer','painters',...
        'ToolBar','none',...
        'Menubar','none',...
        'Tag','CCPFigure',...
        'color','w',...
        'Position',[200 200 800 600],...
        'Pointer','crosshair', ...
        'PaperType',       config.PaperType,...
        'PaperOrientation','landscape',...
        'PaperUnits','centimeters');

%%
    load icon.mat;
    SL_defaultccp;
    backcol=[234   233   237]/255;
ccppanel(1)=uipanel('Units','pixel','Title','1. Make Data to Depth',...
    'FontSize',12,'Position',[10 320 450 280], 'BackgroundColor', backcol);
% 
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[10 230 150 20],...
    'String', 'profile begining longitude:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[140 235 40 20],...
    'ToolTipString','begining longitude',...
    'String', ccp.long1,...
    'Callback', 'ccp.long1=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[190 230 150 20],...
    'String', 'latitude:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[235 235 40 20],...
    'ToolTipString','begining longitude',...
    'String', ccp.lat1,...
    'Callback', 'ccp.lat1=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[10 200 150 20],...
    'String', 'profile end longitude:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[140 205 40 20],...
    'ToolTipString','begining longitude',...
    'String', ccp.long2,...
    'Callback', 'ccp.long2=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[190 200 150 20],...
    'String', 'latitude:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[235 205 40 20],...
    'ToolTipString','begining longitude',...
    'String', ccp.lat2,...
    'Callback', 'ccp.lat2=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[10 170 150 20],...
    'String', 'Station list:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
h.sta(1)=uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[90 175 170 20],...
    'ToolTipString','Station list directory',...
    'String', [config.stapath config.stalst],...
    'Callback', 'config.stapath=get(gcbo,''String'');config.stalst=get(gcbo,''String'');');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[280 175 25 20],...
    'cdata', icon.folder,...
    'ToolTipString','Browse',...
    'Userdata',h.sta(1),...
    'Callback','[filename, pathname] = uigetfile(''*.dat'', ''open Station list'');config.stapath=pathname;config.stalst=filename;set(get(gcbo,''Userdata''), ''String'',[config.stapath config.stalst]);clear filename pathname');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[10 140 150 20],...
    'String', 'RF Data Path:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);

h.sta(2)=uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[90 145 170 20],...
    'ToolTipString','Output directory',...
    'String', ccp.RFdatapath,...
    'Callback', 'ccp.RFdatapath=get(gcbo,''String'');');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[280 145 25 20],...
    'cdata', icon.folder,...
    'ToolTipString','Browse',...
    'Userdata',h.sta(2),...
    'Callback','tmp2=uigetdir(ccp.RFdatapath);if isstr(tmp2), ccp.RFdatapath=tmp2;set(get(gcbo,''Userdata''), ''String'',ccp.RFdatapath);end,clear tmp*');


uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[10 110 150 20],...
    'String', 'Out Path:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
h.sta(3)=uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[90 115 170 20],...
    'ToolTipString','Output directory',...
    'String', ccp.makedatout,...
    'Callback', 'ccp.makedatout=get(gcbo,''String'');');
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[280 115 25 20],...
    'cdata', icon.folder,...
    'ToolTipString','Browse',...
    'Userdata',h.sta(3),...
    'Callback','tmp2=uigetdir(ccp.makedatout);if isstr(tmp2), ccp.makedatout=tmp2;set(get(gcbo,''Userdata''), ''String'',ccp.makedatout);end,clear tmp*');


uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[300 230 50 20],...
    'String', 'Sampling:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[360 235 40 20],...
    'ToolTipString','simpling',...
    'String', ccp.sampling,...
    'Callback', 'ccp.sampling=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[300 200 50 20],...
    'String', 'Time shift:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[360 205 40 20],...
    'ToolTipString','simpling',...
    'String', ccp.shift,...
    'Callback', 'ccp.shift=str2num(get(gcbo,''String''));');

ccppanel(2)=uipanel('Units','pixel','Title','Bandpass Butterworth filter',...
    'FontSize',10,'Position',[12 322 220 105], 'BackgroundColor', backcol);

uicontrol('Parent',ccppanel(2),'Units','pixel',...
    'Style','CheckBox',...
    'value',ccp.filter,...
    'Position',[10 70 200 18],...
    'String', 'Add filter or not',...
    'Callback','ccp.filter=get(gcbo,''value'');') ;

uicontrol('Parent',ccppanel(2),'Units','pixel',...
    'Style','text',...
    'Position',[110 40 50 20],...
    'String', 'filter order:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);

uicontrol('Parent',ccppanel(2),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[170 45 25 20],...
    'ToolTipString','order',...
    'String', ccp.order,...
    'Callback', 'ccp.order=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(2),'Units','pixel',...
    'Style','text',...
    'Position',[10 40 50 20],...
    'String', 'low f limit:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(2),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[65 45 35 20],...
    'ToolTipString','order',...
    'String', ccp.f1,...
    'Callback', 'ccp.f1=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(2),'Units','pixel',...
    'Style','text',...
    'Position',[10 10 50 20],...
    'String', 'high f limit:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(2),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[65 15 35 20],...
    'ToolTipString','order',...
    'String', ccp.f2,...
    'Callback', 'ccp.f2=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[230 70 150 20],...
    'String', 'Depth from:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[290 75 25 20],...
    'String', ccp.depthfrom,...
    'Callback', 'ccp.depthfrom=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[320 70 50 20],...
    'String', 'to:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[340 75 27 20],...
    'String', ccp.depthto,...
    'Callback', 'ccp.depthto=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[370 70 50 20],...
    'String', 'by:',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[390 75 27 20],...
    'String', ccp.depthby,...
    'Callback', 'ccp.depthby=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','text',...
    'Position',[230 40 150 20],...
    'String', 'Moho piercing point (km):',...
    'HorizontalAlignment','Left',...
    'BackgroundColor', backcol);
uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[360 45 27 20],...
    'String', ccp.piercingmoho,...
    'Callback', 'ccp.piercingmoho=str2num(get(gcbo,''String''));');

uicontrol('Parent',ccppanel(1),'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[325 115 80 80],...
    'String', 'Make data',...
    'Callback','Ps_makedata');

uicontrol('Parent',Hccp,'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[470 550 130 40],...
    'String', 'Save CCP config',...
    'Callback','[out_filename, out_pathname] = uiputfile(''*.mat'', ''Save CCP config'');save(strcat(out_pathname,out_filename),''ccp''); clear out_filename out_pathname');

uicontrol('Parent',Hccp,'Units','pixel',...
    'Style','Pushbutton',...
    'Position',[620 550 130 40],...
    'String', 'Load CCP config',...
    'Callback','[filename, pathname] = uigetfile(''*.mat'', ''Load CCP config'');load(strcat(pathname,filename)); clear filename pathname');




