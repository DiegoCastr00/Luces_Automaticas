clc;
enciende = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\enciende'; 
apaga = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\apaga'; 
otros = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\otros'; 
extension = '*.wav';

datos = []; 
etiquetas = []; 

% Enciende
archivos_enciende = dir(fullfile(enciende, extension));
for i = 1:length(archivos_enciende)
    archivo = fullfile(enciende, archivos_enciende(i).name);
    [audio, fs_audio] = audioread(archivo);
    espectro = abs(fft(audio));
    espectro_normalizado = espectro / max(espectro);
    espectro_normalizado = transpose(espectro_normalizado);
    datos = [datos; espectro_normalizado];
    etiquetas = [etiquetas; 1];
end

% apaga
archivos_apaga = dir(fullfile(apaga, extension));
for i = 1:length(archivos_apaga)
    archivo = fullfile(apaga, archivos_apaga(i).name);
    [audio, fs_audio] = audioread(archivo);
    espectro = abs(fft(audio));
    espectro_normalizado = espectro / max(espectro);
    espectro_normalizado = transpose(espectro_normalizado);
    datos = [datos; espectro_normalizado];
    etiquetas = [etiquetas; 0];
end

% otros
archivos_otros = dir(fullfile(otros, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(otros, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    espectro = abs(fft(audio));
    espectro_normalizado = espectro / max(espectro);
    espectro_normalizado = transpose(espectro_normalizado);
    datos = [datos; espectro_normalizado];
    etiquetas = [etiquetas; 2];
end

k = 6; 
modelo_knn = fitcknn(datos, etiquetas, 'NumNeighbors', k);
save('modelo_knn.mat', 'modelo_knn');
