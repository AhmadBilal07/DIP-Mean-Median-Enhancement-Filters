function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 07-Oct-2017 01:17:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
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
 [File_Name, Path_Name] = uigetfile('*.*','File Selector');
 axes(handles.axes1)
 %imshow([Path_Name,File_Name]);
 
 A =imread([Path_Name,File_Name]); 
 %n= imnoise(A,'salt & pepper', 0.02);
 imshow(A,[]);
 %Convolution function
setappdata(0,'A',A);
%M=[0.11111111111  0.11111111111 0.11111111111;0.11111111111 0.11111111111 0.11111111111;0.11111111111 0.11111111111 0.11111111111];  
M=[1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25;1/25 1/25 1/25 1/25 1/25]
%D1=A(:,:,1);
%D2=A(:,:,2);
%D3=A(:,:,3);

%D1=im2double(D1);
%D2=im2double(D2);
%D3=im2double(D3);



%D=cat(3,funct(D1, M),funct(D2, M),funct(D3, M));
%disp(D);
 D=funct(A, M);
 

  axes(handles.axes2);
  imshow(D,[]);
 
  
 m= imnoise(A,'salt & pepper', 0.02);
 C=mymedian(m);
 axes(handles.axes3);
 imshow(C,[]);
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
A=getappdata(0,'A');





M1=[0 -1 0;-1 5 -1;0 -1 0]; 
 E=funct(A, M1);
 axes(handles.axes4);
 imshow(E,[]);

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton3,'Value',0);
A=getappdata(0,'A');

M1=[-1 -1 -1;-1 9 -1;-1 -1 -1]; 
E=funct(A, M1);
axes(handles.axes4);
imshow(E,[]);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


set(handles.radiobutton2,'Value',0);
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton4,'Value',0);

A=getappdata(0,'A');

  
M1=[-2 1 -2;1 5 1;-2 1 -2]; 
 E=funct(A, M1);
 axes(handles.axes4);
 imshow(E,[]);


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
data=get(hObject,'data');
setappdata(0,'data',data);
if(get(handles.radiobutton4,'Value')==1)
 
A=getappdata(0,'A');
 M1=data; 
 E=funct(A, M1);

 axes(handles.axes4);
 imshow(E,[]);
end    
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton3,'Value',0);
data=getappdata(0,'data');
A=getappdata(0,'A');
 M1=data; 
 E=funct(A, M1);
 axes(handles.axes4);
 imshow(E,[]);


% Hint: get(hObject,'Value') returns toggle state of radiobutton4
