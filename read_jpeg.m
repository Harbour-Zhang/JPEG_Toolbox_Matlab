
% ��չ����� clear the workspace
clear;clc;

% ���ļ�����ӵ�����·��  add work path
addpath('.\jpegtbx_1.4');

img = imread('lena512.jpg');
% ��ȡ����JPEGͼ��   decode your JPEG image
% jobj���Ǹ�jpegͼ��Ľṹ��   jobj is this JPEG image structure
jobj = jpeg_read('lena512.jpg'); 

% ��ȡ����ϵ�� 
DCT = jobj.coef_arrays{1}; % DCT plane

% �õ�һ��8*8���ֵ�dctϵ������
dct_coef = bdct(img,8);

% �õ�һ��8*8��dct����
mat8 = bdctmtx(8);

% �õ�һ������ϵ��Ϊ50��������
table = jpeg_qtable(50);

% д��JPEGͼ��
jobj.coef_arrays{1} = DCT;

% ������ʽ
jobj.optimize_coding = 1;

% ����jobj��ͼ��Ľṹ��
jpeg_write(jobj,'W.jpg');