clear all;
clc;




prendido = true;

while prendido == true
    ruido=true;
    grabando=true;
    foco1=true;
    foco2=false;
    save('llamadas.mat','ruido','foco1','foco2','grabando','prendido');
    fprintf("dsffdfsd %d \n",prendido);
    fprintf("dsffdfsd %d\n",ruido);
    fprintf("dsffdfsd %d\n",foco1);
    fprintf("dsffdfsd %d\n",foco2);
    fprintf("dsffdfsd %d\n",grabando);
    save('llamadas.mat','ruido','foco1','foco2','grabando','prendido');
end
    % save('llamadas.mat','ruido','foco1','foco2','grabando','prendido');
    % disp(prendido);