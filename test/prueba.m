clc;
clear;
ye = 'C:\Users\Khoss\Documents\MATLAB\Programas MATHLAB\ProcesamientoSenales\proyecto\test\uno'; 
extension = '*.wav';

archivos_enciende = dir(fullfile(ye, extension));
for i = 1:length(archivos_enciende)
    archivo = fullfile(ye, archivos_enciende(i).name);
    [audio, fs_audio] = audioread(archivo);

    fs = 44100;
    windowLength = round(0.2*fs);
    overlapLength = round(0.025*fs);
    
    pitchh = pitch(audio,fs,WindowLength=windowLength,OverlapLength=overlapLength,Range=[50,250]);
    pitchh= transpose(pitchh);
    
    ModeloMel = audioFeatureExtractor(SampleRate=fs, ...
        Window=hamming(windowLength,"periodic"), ...
        OverlapLength=overlapLength, ...
        zerocrossrate=true, ...
        shortTimeEnergy=true, ...
        pitch=true, ...
        mfcc=true);
    
    mel = extract(ModeloMel,audio);
    mel = mel(:);
    mel = transpose(mel);

    espectro = abs(fft(audio));
    espectro_normalizado = espectro / max(espectro);
    espectro_normalizado = transpose(espectro_normalizado);

    energia = sum(audio.^2);  % Energía del audio
    ritmo = mean(diff(audio));  % Ritmo del audio
    desviacionEstandar = std(audio);
    
    resultado = [mel, pitchh,energia,ritmo,desviacionEstandar, espectro_normalizado];

end
size(resultado)
