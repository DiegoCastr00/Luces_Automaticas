% 100  ---> Capi
% 25 -----> Hablando ruido capi
% 25 -----> Plabra capi 

% YE -> 2 segundos
% Demas -> 3 segundos
clc;
duracion = 3; %segundos
num_grabaciones = 57; %cantidad de audios

carpeta_destino = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Ye\apaga_focoB';

if ~exist(carpeta_destino, 'dir')
    mkdir(carpeta_destino);
end
 
fs = 44100;  % frecuencia de muestreo en Hz 
grabadora = audiorecorder(fs, 16, 1);  % 16 bits, 1 canal

for i = 57:num_grabaciones
    disp(['Grabando audio ', num2str(i)]);
    recordblocking(grabadora, duracion);
    audio_data = getaudiodata(grabadora);
    nombre_archivo = fullfile(carpeta_destino, ['apaga_focoB_', num2str(i), '.wav']);
    audiowrite(nombre_archivo, audio_data, fs);
end

