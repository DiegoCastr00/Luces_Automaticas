
%     1 ----->   Capi  
%     0 ----->    RUIDO  
clc;
carpeta_pruebas = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\test_capi'; 
extension = '*.wav';

datos_prueba = [];
etiquetas_prueba_predichas = [];

archivos_pruebas = dir(fullfile(carpeta_pruebas, extension));
for i = 1:length(archivos_pruebas)
    archivo = fullfile(carpeta_pruebas, archivos_pruebas(i).name);
    [audio, fs_audio] = audioread(archivo);

    resultado = tratamiento(audio);

    %capi_KNN
    %capi_svm
    etiqueta_predicha = predict(capi_KNN, resultado);
    etiquetas_prueba_predichas = [etiquetas_prueba_predichas; etiqueta_predicha];
end

etiquetas_prueba_predichas;

for i = 1:length(etiquetas_prueba_predichas)
    switch true
        case  etiquetas_prueba_predichas(i) == 0
            fprintf('Archivo %s: Ruido\n', archivos_pruebas(i).name);
        case  etiquetas_prueba_predichas(i) == 1
            fprintf('Archivo %s: Capi\n', archivos_pruebas(i).name);
        case  etiquetas_prueba_predichas(i) == 2
            fprintf('Archivo %s: Silencio\n', archivos_pruebas(i).name);
    end
end