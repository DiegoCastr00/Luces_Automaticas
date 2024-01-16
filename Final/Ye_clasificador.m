clc;

% ye = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Final\ye'; 
% ruido = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Final\ye_ruido';
% silencio = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Final\ye_silencio'; 

% extension = '*.wav';

ye = 'D:\Descargas 2\IPN\5to\Procesamiento de Señales\interfazLuces\Luces_Automaticas\Final\ye';
ruido = 'D:\Descargas 2\IPN\5to\Procesamiento de Señales\interfazLuces\Luces_Automaticas\Final\ye_ruido';
silencio = 'D:\Descargas 2\IPN\5to\Procesamiento de Señales\interfazLuces\Luces_Automaticas\Final\ye_silencio';
extension = '*.wav';

%Nancy
% ye = 'C:\MatLab\Señales\Luces_Automaticas\Final\ye'; 
% ruido = 'C:\MatLab\Señales\Luces_Automaticas\Final\ye_ruido';
% silencio = 'C:\MatLab\Señales\Luces_Automaticas\Final\ye_silencio'; 
% extension = '*.wav';

datos = []; 
etiquetas = []; 

% Otros
archivos_otros = dir(fullfile(ruido, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(ruido, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 0];
end

% Ye
archivos_enciende = dir(fullfile(ye, extension));
for i = 1:length(archivos_enciende)
    archivo = fullfile(ye, archivos_enciende(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 1];
end

% Silencio
archivos_otros = dir(fullfile(silencio, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(silencio, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 2];
end

% k=3;
% ye_KNN = fitcknn(datos, etiquetas, 'NumNeighbors', k);
% save('ye_KNN.mat', 'ye_KNN');

ye_svm = fitcecoc(datos, etiquetas);
save('ye_svm.mat', 'ye_svm');

%  ye_RBF = fitcecoc(datos, etiquetas, 'Learners', templateSVM('KernelFunction', 'rbf'));
%  save('ye_RBF.mat', 'ye_RBF');

 