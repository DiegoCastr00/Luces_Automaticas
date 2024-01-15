clc;
capi = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\capi'; 
otros = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\ruido_capi';
silencio = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\silencio_capi'; 
extension = '*.wav';

datos = []; 
etiquetas = []; 

% Capi
archivos_enciende = dir(fullfile(capi, extension));
for i = 1:length(archivos_enciende)
    archivo = fullfile(capi, archivos_enciende(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 1];
end

% Otros
archivos_otros = dir(fullfile(otros, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(otros, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 0];
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

k=3;
capi_KNN = fitcknn(datos, etiquetas, 'NumNeighbors', k);
save('capi_KNN.mat', 'capi_KNN');

capi_svm = fitcecoc(datos, etiquetas);
save('capi_svm.mat', 'capi_svm');
