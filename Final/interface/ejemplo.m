clear all;
clc;

ruido=false;
grabando=false;
foco1=false;
foco2=false;

prendido = true;

while prendido == true
    ruido=false;
    grabando=true;
    foco1=true;
    foco2=false;
%    save('llamadas.mat','ruido','foco1','foco2','grabando','prendido');
 %   fprintf("prendido %d \n",prendido);
 %   fprintf("ruido %d\n",ruido);
    fprintf("foco1 %d\n",foco1);
    fprintf("foco2 %d\n",foco2);
    pause(.5);
    foco1=false;
    foco2=true;
    fprintf("foco1 %d\n",foco1);
    fprintf("foco2 %d\n",foco2);
    pause(.5);
 %   fprintf("grabando %d\n",grabando);
    %save('llamadas.mat','ruido','foco1','foco2','grabando','prendido');
    pause(.0001)
end
    % save('llamadas.mat','ruido','foco1','foco2','grabando','prendido');
