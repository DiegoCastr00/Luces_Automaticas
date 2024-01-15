clc;

duracionCapi = 2;
duracionFoco = 3;
fs = 44100;  % frecuencia de muestreo en Hz 

grabadora = audiorecorder(fs, 16, 1);  % 16 bits, 1 canal
aux = 0;
while 1
    recordblocking(grabadora, duracionCapi);
    audio = getaudiodata(grabadora);

    resultado = tratamiento(audio);

    %capi_KNN
    %capi_svm
    resultado_prediccion = predict(capi_KNN, resultado);
    switch true
        case  resultado_prediccion == 0
            fprintf('Ruido en Capi\n');
        case  resultado_prediccion == 1
            fprintf('Capi: ¿Que pasa?\n');
            recordblocking(grabadora, duracionFoco);

            audio = getaudiodata(grabadora);
            resultado = tratamiento(audio);
            %modelo_svm
            %modelo_knn
            resultado_prediccion = predict(modelo_svm, resultado);
            switch true
                case  resultado_prediccion == 0
                    if aux == 0
                       fprintf('--> El foco ya esta apagado\n');
                    else 
                        aux = 0;
                        fprintf('--> Foco apagado\n');
                    end
                case  resultado_prediccion == 1
                    if aux == 1
                       fprintf('--> El foco ya esta encendido\n');
                    else
                        fprintf('--> Foco enciendido\n');
                        aux = 1;
                    end
                case  resultado_prediccion == 2
                    fprintf('Ruido en Foco\n');
                case  resultado_prediccion == 3
                    fprintf('Silencio en Foco\n');
            end

        case  resultado_prediccion == 2
            fprintf('Silencio en Capi\n');
    end

end
