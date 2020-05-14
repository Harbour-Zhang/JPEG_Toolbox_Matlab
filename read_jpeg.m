
% ��չ����� clear the workspace
clear;clc;

% ���ļ�����ӵ�����·��  add work path
addpath('.\jpegtbx_1.4');

% ��ȡ����JPEGͼ��   decode your JPEG image
% jobj���Ǹ�jpegͼ��Ľṹ��   jobj is this JPEG image structure
jobj = jpeg_read('W.jpg'); 

% ��ȡ����ϵ�� 
DCT = jobj.coef_arrays{1}; % DCT plane

% д��JPEGͼ��
jobj.coef_arrays{1} = DCT;

% ������ʽ
jobj.optimize_coding = 1;

% ����jobj��ͼ��Ľṹ��
jpeg_write(jobj,'W.jpg');