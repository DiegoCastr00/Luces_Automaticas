clc;

FocoA = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\test\enciende_focoA';
ApagaA = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\test\apaga_focoA';
 
FocoB = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\test\enciende_focoB';
ApagaB = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\test\apaga_focoB';

otros = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Basura\otros';
silencio = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Basura\silencio';

%Nancy
% FocoA = 'C:\MatLab\Señales\Luces_Automaticas\Ye\enciende_focoA';
% ApagaA = 'C:\MatLab\Señales\Luces_Automaticas\Ye\apaga_focoA';
% 
% FocoB = 'C:\MatLab\Señales\Luces_Automaticas\Ye\enciende_focoB';
% ApagaB = 'C:\MatLab\Señales\Luces_Automaticas\Ye\apaga_focoB';
% 
% otros = 'C:\MatLab\Señales\Luces_Automaticas\otros';
% silencio = 'C:\MatLab\Señales\Luces_Automaticas\silencio';

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

% Apaga
archivos_apaga = dir(fullfile(ApagaA, extension));
for i = 1:length(archivos_apaga)
    archivo = fullfile(ApagaA, archivos_apaga(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 2];
end

% Ruido
archivos_otros = dir(fullfile(FocoB, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(FocoB, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 3];
end

archivos_otros = dir(fullfile(ApagaB, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(ApagaB, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 4];
end

archivos_otros = dir(fullfile(otros, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(otros, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 5];
end

%Silencio
archivos_otros = dir(fullfile(silencio, extension));
for i = 1:length(archivos_otros)
    archivo = fullfile(silencio, archivos_otros(i).name);
    [audio, fs_audio] = audioread(archivo);
    resultado = tratamiento(audio);
    datos = [datos; resultado];
    etiquetas = [etiquetas; 6];
end

% k = 4; 
% modelo_knn = fitcknn(datos, etiquetas, 'NumNeighbors', k);
% save('modelo_knn.mat', 'modelo_knn');

modelo_svm = fitcecoc(datos, etiquetas);
save('modelo_svm.mat', 'modelo_svm');

% modelo_RBF = fitcecoc(datos, etiquetas, 'Learners', templateSVM('KernelFunction', 'rbf'));
% save('modelo_RBF.mat', 'modelo_RBF');
