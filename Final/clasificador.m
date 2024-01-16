clc;

% FocoA = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Final\focoA';
% FocoB = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Final\focoB';
% 
% otros = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Final\otros';
% silencio = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Final\silencio';
<<<<<<< HEAD
=======

%EDKIR
FocoA = 'D:\Descargas 2\IPN\5to\Procesamiento de Señales\interfazLuces\Luces_Automaticas\Final\focoA';
FocoB = 'D:\Descargas 2\IPN\5to\Procesamiento de Señales\interfazLuces\Luces_Automaticas\Final\focoB';
otros = 'D:\Descargas 2\IPN\5to\Procesamiento de Señales\interfazLuces\Luces_Automaticas\Final\otros';
silencio = 'D:\Descargas 2\IPN\5to\Procesamiento de Señales\interfazLuces\Luces_Automaticas\Final\silencio';

>>>>>>> a31d0a05b67a1e260a53648e86bf36e34505cd6e

%Nancy
FocoA = 'C:\MatLab\Señales\Luces_Automaticas\Final\focoA';
FocoB = 'C:\MatLab\Señales\Luces_Automaticas\Final\focoB';
ruido = 'C:\MatLab\Señales\Luces_Automaticas\Final\ruido';
silencio = 'C:\MatLab\Señales\Luces_Automaticas\Final\silencio';
extension = '*.wav';

datos = []; 
etiquetas = []; 

% Enciende
archivos_enciende = dir(fullfile(FocoA, extension));
for i = 1:length(archivos_enciende)
    archivo = fullfile(FocoA, archivos_enciende(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 1];
end

archivos_otros = dir(fullfile(FocoB, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(FocoB, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 2];
end

archivos_otros = dir(fullfile(ruido, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(ruido, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 3];
end

%Silencio
archivos_otros = dir(fullfile(silencio, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(silencio, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 4];
end

% k = 4; 
% modelo_knn = fitcknn(datos, etiquetas, 'NumNeighbors', k);
% save('modelo_knn.mat', 'modelo_knn');

modelo_svm = fitcecoc(datos, etiquetas, );
save('modelo_svm.mat', 'modelo_svm');

% modelo_RBF = fitcecoc(datos, etiquetas, 'Learners', templateSVM('KernelFunction', 'rbf'));
% save('modelo_RBF.mat', 'modelo_RBF');
