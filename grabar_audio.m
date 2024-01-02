clc;
duracion = 2; %segundos
num_grabaciones = 150; %cantidad de audios

carpeta_destino = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\capi';

if ~exist(carpeta_destino, 'dir')
    mkdir(carpeta_destino);
end
 
fs = 44100;  % frecuencia de muestreo en Hz 
grabadora = audiorecorder(fs, 16, 1);  % 16 bits, 1 canal

for i = 101:num_grabaciones
    disp(['Grabando audio ', num2str(i)]);
    recordblocking(grabadora, duracion);
    audio_data = getaudiodata(grabadora);
    nombre_archivo = fullfile(carpeta_destino, ['capi_', num2str(i), '.wav']);
    audiowrite(nombre_archivo, audio_data, fs);
end

