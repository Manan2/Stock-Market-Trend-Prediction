function varargout = simulate_network(varargin)
% SIMULATE_NETWORK M-file for simulate_network.fig
%      SIMULATE_NETWORK, by itself, creates a new SIMULATE_NETWORK or raises the existing
%      singleton*.
%
%      H = SIMULATE_NETWORK returns the handle to a new SIMULATE_NETWORK or the handle to
%      the existing singleton*.
%
%      SIMULATE_NETWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULATE_NETWORK.M with the given input arguments.
%
%      SIMULATE_NETWORK('Property','Value',...) creates a new SIMULATE_NETWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simulate_network_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simulate_network_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simulate_network

% Last Modified by GUIDE v2.5 04-Apr-2015 09:27:47

% Begin initialization code - DO NOT EDIT

global current_price high_price low_price stack_name



gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simulate_network_OpeningFcn, ...
                   'gui_OutputFcn',  @simulate_network_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before simulate_network is made visible.
function simulate_network_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simulate_network (see VARARGIN)

% Choose default command line output for simulate_network
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simulate_network wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simulate_network_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all;
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

maingui
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global current_price high_price low_price stack_name
load net
TRAINING_DATA=[current_price;high_price;low_price];



M = xlsread('stock_data.xlsx');

% AIP
% AHY
% ALN
% AGX
% ATX
% AE
% AZK
% AAU
% AXK
% ATA
% 6Z
cnt=1;
if strcmp(stack_name,'AIP')
    for ii=1:length(M)
        if M(ii,1)==1
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end
if strcmp(stack_name,'AHY')
    for ii=1:length(M)
        if M(ii,1)==2
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'ALN')
    for ii=1:length(M)
        if M(ii,1)==3
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'AGX')
    for ii=1:length(M)
        if M(ii,1)==4
     data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'ATX')
    for ii=1:length(M)
        if M(ii,1)==5
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'AE')
    for ii=1:length(M)
        if M(ii,1)==6
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'AZK')
    for ii=1:length(M)
        if M(ii,1)==7
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'AAU')
    for ii=1:length(M)
        if M(ii,1)==8
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'AXK')
    for ii=1:length(M)
        if M(ii,1)==9
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'ATA')
    for ii=1:length(M)
        if M(ii,1)==10
       data(cnt,1:10)=M(ii,1:5);
       cnt=cnt+1;
        end
    end
    
end

if strcmp(stack_name,'SIXZ')
    for ii=1:length(M)
        if M(ii,1)==11
       data(cnt,1:10)=M(ii,1:10);
       cnt=cnt+1;
        end
    end
end    

for ii=1:length(data)
    data_to_train(ii,1)=data(ii,2);
    data_to_train(ii,2)=data(ii,3);
    data_to_train(ii,3)=data(ii,4);
    data_to_train(ii,4)=data(ii,10);
    
end


b=data_to_train(1:length(data),1:3);
Input=b';
Output=data_to_train(1:length(data),4)';

for ii=1:1:3
    val= minmax(Input(ii,1:length(data)));
    RS(ii,1)=val(1,1);
    RS(ii,2)=val(1,2);
end

  S=[3 10 1];
  net = newff(RS,S,{'tansig','tansig','purelin'});
  
  net.trainParam.epochs = epochs;
  [net,tr,Y,E,Pf,Af]=train(net,Input,Output);


 
O1=sim(net,TRAINING_DATA);
out=sim(net,Input(1:3,1:100))

if O1 >= 1.5
    Result=2;
elseif O1 > 0.5 && O1 < 1.5
    Result=1;
else
    Result=0;
end



if Result==1
    S = {'Sell Shares !!!!'};
    set(findobj('Tag','text8'),'String',S)
% set(handles.text8, 'String', S);
% 
% set(handles.pushbutton5, 'String', S);
elseif Result==0
    S = {'Buy Shares !!!'};
    set(findobj('Tag','text8'),'String',S)
%     set(handles.text8, 'String', S);
%     set(handles.pushbutton5, 'String', S);
else
    S = {'Neutral!!!'};
    set(findobj('Tag','text8'),'String',S)
end


    
 

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


global current_price
% current_price=get(handles.edit1_Callback,'Value')   ;

val=get(handles.edit1,'String')   ;
current_price = str2double(val);
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

global high_price
% high_price=get(handles.edit2_Callback,'Value')   ;
val=get(handles.edit2,'String')   ;
high_price = str2double(val);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global low_price
% low_price=get(handles.edit3_Callback,'Value')   ;
val=get(handles.edit3,'String')   ;
low_price = str2double(val);



% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function text6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


global stack_name

% AIP
% AHY
% ALN
% AGX
% ATX
% AE
% AZK
% AAU
% AXK
% ATA
% 6Z
% 
val=get(handles.popupmenu1,'Value')   ;
if val==1
    stack_name='AIP';
elseif val==2
    stack_name='AHY';
elseif val==3
    stack_name='ALN';
elseif val==4
    stack_name='AGX';
elseif val==5
    stack_name='ATX';
elseif val==6
    stack_name='AE';
elseif val==7
    stack_name='AZK';
elseif val==8
    stack_name='AAU';
elseif val==9
    stack_name='AXK';
elseif val==10
    stack_name='ATA';
else
    stack_name='SIXZ';
end



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


