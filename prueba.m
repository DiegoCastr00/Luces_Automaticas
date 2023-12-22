clc
clear

muestrasPorCuadro = 3024;
umbralAmplitud = 0.01;
umbralCorrelacion = 1607242; 

[audio,samplingRate] = audioread('C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\enciende.wav');
audio_normalizado = audio / max(abs(audio));
fft_resultado = abs(fft(audio_normalizado));
fft_conjugado = conj(fft_resultado);
muestraEncender = fft_conjugado;

deviceReader = audioDeviceReader('SamplesPerFrame', muestrasPorCuadro);

while 1 
    acquiredAudio = deviceReader();
    if max(abs(acquiredAudio)) > umbralAmplitud

        normalizedAudio = acquiredAudio / max(abs(acquiredAudio));
        absAudio = abs(fft(normalizedAudio));       
        correlacion = max(xcorr(absAudio, muestraEncender));

        if correlacion > umbralCorrelacion
            fprintf('SIIIIIIIIIIIII "enciende" detectada. Correlación: %f\n', correlacion);

        else
            fprintf('NOOOOOOOOOOO se detectó la palabra "enciende". Correlación: %f\n', correlacion);

        end
    else
        fprintf('Sin sonido detectado. No se procesarán las muestras.\n');
    end
    pause(0.25);
end