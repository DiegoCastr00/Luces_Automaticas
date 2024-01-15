clc;
enciende = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\enciende'; 
apaga = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\apaga'; 
otros = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\otros';
silencio = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\silencio';
extension = '*.wav';

datos = []; 
etiquetas = []; 

% Enciende
archivos_enciende = dir(fullfile(enciende, extension));
for i = 1:length(archivos_enciende)
    archivo = fullfile(enciende, archivos_enciende(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 1];
end

% Apaga
archivos_apaga = dir(fullfile(apaga, extension));
for i = 1:length(archivos_apaga)
    archivo = fullfile(apaga, archivos_apaga(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 0];
end

% Ruido
archivos_otros = dir(fullfile(otros, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(otros, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 2];
end

%Silencio
archivos_otros = dir(fullfile(silencio, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(silencio, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 3];
end

k = 4; 
modelo_knn = fitcknn(datos, etiquetas, 'NumNeighbors', k);
save('modelo_knn.mat', 'modelo_knn');

modelo_svm = fitcecoc(datos, etiquetas);
save('modelo_svm.mat', 'modelo_svm');