run('ejemplo.m');

t = timer('ExecutionMode', 'fixedRate', 'Period', .5, 'TimerFcn', @cicloWhile);
start(t);

function cicloWhile
    global ruido;
    global prendido;
    global grabando;
    global foco1;
    global foco2;
    save('llamadas.mat','ruido','foco1','foco2','grabando','prendido');
end

    