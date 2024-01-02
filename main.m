clc;

duracionCapi = 2; % segundos
duracionFoco = 3;
fs = 44100;  % frecuencia de muestreo en Hz 

grabadora = audiorecorder(fs, 16, 1);  % 16 bits, 1 canal
aux = 0;
while 1
    recordblocking(grabadora, duracionCapi);
    audio_data = getaudiodata(grabadora);

    espectro = abs(fft(audio_data));
    espectro_normalizado = espectro / max(espectro);
    espectro_normalizado = transpose(espectro_normalizado);
    %capi_KNN
    %capi_svm
    %modelo_svm
    %modelo_knn
    resultado_prediccion = predict(capi_svm, espectro_normalizado);
    switch true
        case  resultado_prediccion == 0
            fprintf('Ruido\n');
        case  resultado_prediccion == 1
            fprintf('Capi: ¿Que pasa?\n');
            recordblocking(grabadora, duracionFoco);
            audio_data = getaudiodata(grabadora);
            espectro = abs(fft(audio_data));
            espectro_normalizado = espectro / max(espectro);
            espectro_normalizado = transpose(espectro_normalizado);
            resultado_prediccion = predict(modelo_svm, espectro_normalizado);
            switch true
                case  resultado_prediccion == 0
                    if aux == 0
                       fprintf('El foco ya esta apagado\n');
                    else 
                        aux = 0;
                        fprintf('Foco apagado\n');
                    end
                case  resultado_prediccion == 1
                    if aux == 1
                       fprintf('El foco ya esta encendido\n');
                    else
                        fprintf('Foco enciendido\n');
                        aux = 1;
                    end
                case  resultado_prediccion == 2
                    fprintf('Ruido\n');
                case  resultado_prediccion == 3
                    fprintf('Silencio\n');
            end

        case  resultado_prediccion == 2
            fprintf('Silencio\n');
    end

end
