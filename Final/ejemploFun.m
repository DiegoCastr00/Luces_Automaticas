clc;
aux_A= 0; 
aux_B = 0;
load('ye_svm.mat');
load('modelo_svm.mat');
    
while 1 
    [aux_A, aux_B,resultado_ye, resultado_prediccion] = funcionMain(aux_A, aux_B, ye_svm,modelo_svm );
    aux_A = aux_A; 
    aux_B = aux_B;
end 

