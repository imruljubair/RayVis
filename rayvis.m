function varargout = rayvis(varargin)
% RAYVIS MATLAB code for rayvis.fig
%      RAYVIS, by itself, creates a new RAYVIS or raises the existing
%      singleton*.
%
%      H = RAYVIS returns the handle to a new RAYVIS or the handle to
%      the existing singleton*.
%
%      RAYVIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RAYVIS.M with the given input arguments.
%
%      RAYVIS('Property','Value',...) creates a new RAYVIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rayvis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rayvis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rayvis

% Last Modified by GUIDE v2.5 01-Feb-2019 16:11:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rayvis_OpeningFcn, ...
                   'gui_OutputFcn',  @rayvis_OutputFcn, ...
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


% --- Executes just before rayvis is made visible.
function rayvis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rayvis (see VARARGIN)

% Choose default command line output for rayvis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rayvis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rayvis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonGo.
function buttonGo_Callback(hObject, eventdata, handles)

%% Copyright: Mohammad Imrul Jubair (https://imruljubair.github.io/)
%%

global E;
global U;
global V;
global W;
global R,
global c;
global i;
global j;
global nx;
global ny;
global l;
global r;
global t;
global b;
global msg;

global P1;
global P2;
global leni;
global lenj;
global e;
global s;

global gridshow;

ex=str2num((get(handles.ex,'String')));
ey=str2num((get(handles.ey,'String')));
ez=str2num((get(handles.ez,'String')));

E = [ex; ey; ez];

ux=str2num((get(handles.ux,'String')));
uy=str2num((get(handles.uy,'String')));
uz=str2num((get(handles.uz,'String')));

U = [ux; uy; uz];

vx=str2num((get(handles.vx,'String')));
vy=str2num((get(handles.vy,'String')));
vz=str2num((get(handles.vz,'String')));

V = [vx; vy; vz];

wx=str2num((get(handles.wx,'String')));
wy=str2num((get(handles.wy,'String')));
wz=str2num((get(handles.wz,'String')));

W = [wx; wy; wz];

l=str2num((get(handles.l,'String')));
r=str2num((get(handles.r,'String')));
t=str2num((get(handles.t,'String')));
b=str2num((get(handles.b,'String')));

cx=str2num((get(handles.cx,'String')));
cy=str2num((get(handles.cy,'String')));
cz=str2num((get(handles.cz,'String')));

c = [cx; cy; cz];

R=str2num((get(handles.R,'String')));

i=str2num((get(handles.i,'String')));
j=str2num((get(handles.j,'String')));

nx=str2num((get(handles.nx,'String')));
ny=str2num((get(handles.ny,'String')));

gridshow = get(handles.checkShowGrid,'Value');

[P1, P2, e, s, leni, lenj]=ray(R,c,E,U,V,W,l,r,t,b,nx,ny,i,j);
visualizeRay(R,c,E,U,V,l,r,t,b,nx,ny,leni,lenj,e,s,P1,P2, gridshow);

et = "("+num2str(e(1))+", "+num2str(e(2))+", "+num2str(e(3))+")";
pt1 = "("+num2str(P1(1))+", "+num2str(P1(2))+", "+num2str(P1(3))+")";
pt2 = "("+num2str(P2(1))+", "+num2str(P2(2))+", "+num2str(P2(3))+")";
msg = "Ray started at" + et +" on the image plane" +newline+ "And Intersected at "+pt1+" and "+pt2+ " with the sphere.";
set(handles.result, 'String', msg);
set(handles.buttonRefresh,'visible','on');
% set(handles.buttonShowGrids,'visible','on');
% set(handles.buttonGen,'visible','on');
% set(handles.buttonShowGrids,'String','toggle grid');
% if(gridshow==1)
%     set(handles.buttonShowGrids,'String','disable grid');
% else
%      set(handles.buttonShowGrids,'String','enable grid');
% end
%%
% hObject    handle to buttonGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function ex_Callback(hObject, eventdata, handles)
% hObject    handle to ex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ex as text
%        str2double(get(hObject,'String')) returns contents of ex as a double


% --- Executes during object creation, after setting all properties.
function ex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ez_Callback(hObject, eventdata, handles)
% hObject    handle to ez (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ez as text
%        str2double(get(hObject,'String')) returns contents of ez as a double


% --- Executes during object creation, after setting all properties.
function ez_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ez (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ux_Callback(hObject, eventdata, handles)
% hObject    handle to ux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ux as text
%        str2double(get(hObject,'String')) returns contents of ux as a double


% --- Executes during object creation, after setting all properties.
function ux_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function uy_Callback(hObject, eventdata, handles)
% hObject    handle to uy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uy as text
%        str2double(get(hObject,'String')) returns contents of uy as a double


% --- Executes during object creation, after setting all properties.
function uy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function uz_Callback(hObject, eventdata, handles)
% hObject    handle to uz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uz as text
%        str2double(get(hObject,'String')) returns contents of uz as a double


% --- Executes during object creation, after setting all properties.
function uz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vx_Callback(hObject, eventdata, handles)
% hObject    handle to vx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vx as text
%        str2double(get(hObject,'String')) returns contents of vx as a double


% --- Executes during object creation, after setting all properties.
function vx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vy_Callback(hObject, eventdata, handles)
% hObject    handle to vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vy as text
%        str2double(get(hObject,'String')) returns contents of vy as a double


% --- Executes during object creation, after setting all properties.
function vy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vz_Callback(hObject, eventdata, handles)
% hObject    handle to vz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vz as text
%        str2double(get(hObject,'String')) returns contents of vz as a double


% --- Executes during object creation, after setting all properties.
function vz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wx_Callback(hObject, eventdata, handles)
% hObject    handle to wx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wx as text
%        str2double(get(hObject,'String')) returns contents of wx as a double


% --- Executes during object creation, after setting all properties.
function wx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wy_Callback(hObject, eventdata, handles)
% hObject    handle to wy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wy as text
%        str2double(get(hObject,'String')) returns contents of wy as a double


% --- Executes during object creation, after setting all properties.
function wy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wz_Callback(hObject, eventdata, handles)
% hObject    handle to wz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wz as text
%        str2double(get(hObject,'String')) returns contents of wz as a double


% --- Executes during object creation, after setting all properties.
function wz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l_Callback(hObject, eventdata, handles)
% hObject    handle to l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l as text
%        str2double(get(hObject,'String')) returns contents of l as a double


% --- Executes during object creation, after setting all properties.
function l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cx_Callback(hObject, eventdata, handles)
% hObject    handle to cx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cx as text
%        str2double(get(hObject,'String')) returns contents of cx as a double


% --- Executes during object creation, after setting all properties.
function cx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cy_Callback(hObject, eventdata, handles)
% hObject    handle to cy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cy as text
%        str2double(get(hObject,'String')) returns contents of cy as a double


% --- Executes during object creation, after setting all properties.
function cy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cz_Callback(hObject, eventdata, handles)
% hObject    handle to cz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cz as text
%        str2double(get(hObject,'String')) returns contents of cz as a double


% --- Executes during object creation, after setting all properties.
function cz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R_Callback(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R as text
%        str2double(get(hObject,'String')) returns contents of R as a double


% --- Executes during object creation, after setting all properties.
function R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ey_Callback(hObject, eventdata, handles)
% hObject    handle to ey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ey as text
%        str2double(get(hObject,'String')) returns contents of ey as a double


% --- Executes during object creation, after setting all properties.
function ey_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i_Callback(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i as text
%        str2double(get(hObject,'String')) returns contents of i as a double


% --- Executes during object creation, after setting all properties.
function i_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j_Callback(hObject, eventdata, handles)
% hObject    handle to j (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j as text
%        str2double(get(hObject,'String')) returns contents of j as a double


% --- Executes during object creation, after setting all properties.
function j_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nx_Callback(hObject, eventdata, handles)
% hObject    handle to nx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nx as text
%        str2double(get(hObject,'String')) returns contents of nx as a double


% --- Executes during object creation, after setting all properties.
function nx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ny_Callback(hObject, eventdata, handles)
% hObject    handle to ny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ny as text
%        str2double(get(hObject,'String')) returns contents of ny as a double


% --- Executes during object creation, after setting all properties.
function ny_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonRefresh.
function buttonRefresh_Callback(hObject, eventdata, handles)
% hObject    handle to buttonRefresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Copyright: Mohammad Imrul Jubair (https://imruljubair.github.io/)
%%
set(handles.ex,'String','4');
set(handles.ey,'String','4');
set(handles.ez,'String','20');

set(handles.ux,'String','1');
set(handles.uy,'String','0');
set(handles.uz,'String','0');
% 
set(handles.vx,'String','0');
set(handles.vy,'String','1');
set(handles.vz,'String','0');

% 
set(handles.wx,'String','0');
set(handles.wy,'String','0');
set(handles.wz,'String','1');

% 
set(handles.l,'String','-10');
set(handles.r,'String','10');
set(handles.t,'String','10');
set(handles.b,'String','-10');
% 
set(handles.cx,'String','2');
set(handles.cy,'String','-1');
set(handles.cz,'String','3');

% 
set(handles.R,'String','8');
% 
set(handles.i,'String','6');
set(handles.j,'String','4');
% 
set(handles.nx,'String','10');
set(handles.ny,'String','10');
% 
% 
% global E;
% global U;
% global V;
% global W;
% global R,
% global c;
% global i;
% global j;
% global nx;
% global ny;
% global l;
% global r;
% global t;
% global b;
% global msg;
% global gridshow;
% 
% gridshow = get(handles.checkShowGrid,'Value');
% [P1, P2, e, s, leni, lenj]=ray(R,c,E,U,V,W,l,r,t,b,nx,ny,i,j);
% visualizeRay(R,c,E,U,V,l,r,t,b,nx,ny,leni,lenj,e,s,P1,P2, gridshow);
% 
% 
% et = ['(',num2str(e(1)),', ',num2str(e(2)),', ',num2str(e(3)),')'];
% pt1 = ['(',num2str(P1(1)),', ',num2str(P1(2)),', ',num2str(P1(3)),')'];
% pt2 = ['(',num2str(P2(1)),', ',num2str(P2(2)),', ',num2str(P2(3)),')'];
% 
% set(handles.result, 'String', msg);
% set(handles.buttonRefresh,'visible','on');
% % set(handles.buttonShowGrids,'visible','on');
% set(handles.buttonGen,'visible','on');
%set(handles.buttonShowGrids,'String','toggle grid');
% if(gridshow==1)
%     set(handles.buttonShowGrids,'String','disable grid');
% else
%      set(handles.buttonShowGrids,'String','enable grid');
% end
buttonGo_Callback(hObject, eventdata, handles);


% --- Executes on button press in buttonGen.
function buttonGen_Callback(hObject, eventdata, handles)
% hObject    handle to buttonGen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ex=str2num((get(handles.ex,'String')));
ey=str2num((get(handles.ey,'String')));
ez=str2num((get(handles.ez,'String')));

E = [ex; ey; ez];

ux=str2num((get(handles.ux,'String')));
uy=str2num((get(handles.uy,'String')));
uz=str2num((get(handles.uz,'String')));

U = [ux; uy; uz];

vx=str2num((get(handles.vx,'String')));
vy=str2num((get(handles.vy,'String')));
vz=str2num((get(handles.vz,'String')));

V = [vx; vy; vz];

wx=str2num((get(handles.wx,'String')));
wy=str2num((get(handles.wy,'String')));
wz=str2num((get(handles.wz,'String')));

W = [wx; wy; wz];

l=str2num((get(handles.l,'String')));
r=str2num((get(handles.r,'String')));
t=str2num((get(handles.t,'String')));
b=str2num((get(handles.b,'String')));

cx=str2num((get(handles.cx,'String')));
cy=str2num((get(handles.cy,'String')));
cz=str2num((get(handles.cz,'String')));

c = [cx; cy; cz];

R=str2num((get(handles.R,'String')));

i=str2num((get(handles.i,'String')));
j=str2num((get(handles.j,'String')));

nx=str2num((get(handles.nx,'String')));
ny=str2num((get(handles.ny,'String')));

allRay(R,c,E,U,V,W,l,r,t,b,nx,ny);


% --- Executes on button press in buttonShowGrids.
function buttonShowGrids_Callback(hObject, eventdata, handles)
% hObject    handle to buttonShowGrids (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in checkShowGrid.
function checkShowGrid_Callback(hObject, eventdata, handles)
% hObject    handle to checkShowGrid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkShowGrid
