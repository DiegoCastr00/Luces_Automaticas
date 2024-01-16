clc;
auxiA= 1;
auxiB= 0;
while 1    
    resulPredic = 3
    switch true
        case  resulPredic == 0
            fprintf('Ruido en Ye\n');
            ruido = 1;
        case  resulPredic == 1
            fprintf('Ye: ¿Que pasa?\n');
            switch true
                case  resulPredic == 1 %       A
                    if auxiA == 0
                       fprintf('--> Foco A encendido\n');
                       auxiA = 1;
                    else 
                        fprintf('--> Foco A apagado\n');
                        auxiA = 0;
                    end
                case  resulPredic == 2 %       B
                    if auxiB == 0
                       fprintf('--> Foco B encendido\n');
                       auxiB = 1;
                    else
                        fprintf('--> Foco B apagado\n');
                        auxiB = 0;
                    end
                case  resulPredic == 3
                    fprintf('Ruido en Foco\n');
                case  resulPredic == 4
                    fprintf('Silencio en Foco\n');
            end
        case  resulPredic == 2
            fprintf('Silencio en Ye\n');
    end
    save('llamadas2.mat','auxiB','auxiA','resulPredic','ruido');
end