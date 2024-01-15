% 100  ---> Capi
% 25 -----> Hablando ruido capi
% 25 -----> Plabra capi 



clc;
duracion = 3; %segundos
num_grabaciones = 200; %cantidad de audios

carpeta_destino = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\edkir\ruido_capi';
carpeta_daphne = 'D:\Señales\Luces_Automaticas\AudioDaphne\focoB';

if ~exist(carpeta_daphne, 'dir')
    mkdir(carpeta_daphne);
end
 
fs = 44100;  % frecuencia de muestreo en Hz 
grabadora = audiorecorder(fs, 16, 1);  % 16 bits, 1 canal

for i = 101:num_grabaciones
    disp(['Grabando audio ', num2str(i)]);
    recordblocking(grabadora, duracion);
    audio_data = getaudiodata(grabadora);
    nombre_archivo = fullfile(carpeta_daphne, ['focoB_', num2str(i), '.wav']);
    audiowrite(nombre_archivo, audio_data, fs);
end

