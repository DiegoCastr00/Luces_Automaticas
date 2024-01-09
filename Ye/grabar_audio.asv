% 100  ---> Capi
% 25 -----> Hablando ruido capi
% 25 -----> Plabra capi 

% YE -> 2 segundos  
% Demas -> 3 segundos
clc;
duracion = 2; %segundos
num_grabaciones = 50; %cantidad de audios

% carpeta_destino = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\Ye\focoA';
carpeta_destino = "C:\MatLab\Señales\Luces_Automaticas\Ye\ye_ruido";

if ~exist(carpeta_destino, 'dir')
    mkdir(carpeta_destino);
end
 
fs = 44100;  % frecuencia de muestreo en Hz 
grabadora = audiorecorder(fs, 16, 1);  % 16 bits, 1 canal

for i = 1:num_grabaciones
    disp(['Grabando audio ', num2str(i)]);
    recordblocking(grabadora, duracion);
    audio_data = getaudiodata(grabadora);
    nombre_archivo = fullfile(carpeta_destino, ['focoA_', num2str(i), '.wav']);
    audiowrite(nombre_archivo, audio_data, fs);
end

