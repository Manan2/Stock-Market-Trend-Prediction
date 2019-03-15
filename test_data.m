function varargout = test_data(varargin)
% TEST_DATA M-file for test_data.fig
%      TEST_DATA, by itself, creates a new TEST_DATA or raises the existing
%      singleton*.
%
%      H = TEST_DATA returns the handle to a new TEST_DATA or the handle to
%      the existing singleton*.
%
%      TEST_DATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_DATA.M with the given input arguments.
%
%      TEST_DATA('Property','Value',...) creates a new TEST_DATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_data_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_data_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_data

% Last Modified by GUIDE v2.5 27-Feb-2015 15:54:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_data_OpeningFcn, ...
                   'gui_OutputFcn',  @test_data_OutputFcn, ...
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


% --- Executes just before test_data is made visible.
function test_data_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_data (see VARARGIN)

% Choose default command line output for test_data
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test_data wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_data_OutputFcn(hObject, eventdata, handles) 
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

simulate_network
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% load net
% load epochs
% 



M = csvread('AMEX_daily_prices_A2.csv');
for ii=1:100
data_to_train(ii,1)=M(ii,2);
data_to_train(ii,2)=M(ii,3);
data_to_train(ii,3)=M(ii,4);
data_to_train(ii,4)=M(ii,5);
end


b=data_to_train(1:100,1:3);
Input=b';
Output=data_to_train(1:100,4)';

for ii=1:1:3
    val= minmax(Input(ii,1:100));
    RS(ii,1)=val(1,1);
    RS(ii,2)=val(1,2);
end

S=[3 10 1];
% load net
load epochs

% net.trainParam.epochs = 500;
% [net,tr,Y,E,Pf,Af]=train(net,Input,Output);

% mean_error=tr.perf;
% No_of_epoch=tr.epoch;
% 
% figure;
% for ii=2:5:50
% epoch(ii)=No_of_epoch(ii);
% MSE(ii)=mean_error(ii);
% end
% plot(epoch,MSE,'-r*')




for ii=1:100
test_data(ii,1)=M(ii+100,2);
test_data(ii,2)=M(ii+100,3);
test_data(ii,3)=M(ii+100,4);
test_data(ii,4)=M(ii+100,5);
end

b=test_data(1:100,1:3);
Input_testdata=b';
expected_Output=test_data(1:100,4)';
load net1;

for ii=1:100
Predicted_Output(ii)=sim(net,Input_testdata(1:3,ii));
end


mse_error1=calc_mse(expected_Output,Predicted_Output);
h=findobj('Type','axes','Tag','axes3');
axes(h)

% figure;
% axes(handles.axes1)
plot(expected_Output,'-k.');
hold on;
plot(Predicted_Output,'-r*');
hold on;
legend('Expected price','Predicted price')
xlabel('No. of Epochs')
ylabel('Price')




