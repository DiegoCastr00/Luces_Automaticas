clc;

load('ye_svm.mat');
load('modelo_svm.mat');

duracionCapi = 2;
duracionFoco = 3;
fs = 44100;  % frecuencia de muestreo en Hz 

grabadora = audiorecorder(fs, 16, 1);  % 16 bits, 1 canal
aux_A= 0;
aux_B= 0;
while 1
    recordblocking(grabadora, duracionCapi);
    audio = getaudiodata(grabadora);

    resultado = tratamiento(audio);

    
    resultado_prediccion = predict(ye_svm, resultado);
    switch true
        case  resultado_prediccion == 0
            fprintf('Ruido en Ye\n');
        case  resultado_prediccion == 1
            fprintf('Ye: ¿Que pasa?\n');
            recordblocking(grabadora, duracionFoco);

            audio = getaudiodata(grabadora);
            resultado = tratamiento(audio);
            %modelo_svm
            %modelo_knn
            resultado_prediccion = predict(modelo_svm, resultado);

            switch true
                case  resultado_prediccion == 1 %       A
                    if aux_A == 0
                       fprintf('--> Foco A encendido\n');
                       aux_A = 1;
                    else 
                        fprintf('--> Foco A apagado\n');
                        aux_A = 0;
                    end

                case  resultado_prediccion == 2 %       B
                    if aux_B == 0
                       fprintf('--> Foco B encendido\n');
                       aux_B = 1;
                    else
                        fprintf('--> Foco B apagado\n');
                        aux_B = 0;
                    end

                case  resultado_prediccion == 3
                    fprintf('Ruido en Foco\n');
                case  resultado_prediccion == 4
                    fprintf('Silencio en Foco\n');
            end

        case  resultado_prediccion == 2
            fprintf('Silencio en Ye\n');
    end

end
