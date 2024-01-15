clc;
carpeta_pruebas = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\test'; 
extension = '*.wav';

datos_prueba = [];
etiquetas_prueba_predichas = [];

archivos_pruebas = dir(fullfile(carpeta_pruebas, extension));
for i = 1:length(archivos_pruebas)
    archivo = fullfile(carpeta_pruebas, archivos_pruebas(i).name);
    [audio, fs_audio] = audioread(archivo);

    resultado = tratamiento(audio);
    %modelo_svm
    %modelo_knn
    etiqueta_predicha = predict(modelo_knn, resultado);
    etiquetas_prueba_predichas = [etiquetas_prueba_predichas; etiqueta_predicha];
end

etiquetas_prueba_predichas;


%     1 ----->   Enciende -----> Impares  
%     0 ----->    Apaga   ----->  Pares  

for i = 1:length(etiquetas_prueba_predichas)
    switch true
        case  etiquetas_prueba_predichas(i) == 0
            fprintf('Archivo %s: Apaga\n', archivos_pruebas(i).name);
        case  etiquetas_prueba_predichas(i) == 1
            fprintf('Archivo %s: Enciende\n', archivos_pruebas(i).name);
        case  etiquetas_prueba_predichas(i) == 2
            fprintf('Archivo %s: Ruido\n', archivos_pruebas(i).name);
        case  etiquetas_prueba_predichas(i) == 3
            fprintf('Archivo %s: Silencio\n', archivos_pruebas(i).name);
    end
end