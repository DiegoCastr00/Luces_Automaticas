function resultado = tratamiento(audio)
    espectro = abs(fft(audio));
    espectro_normalizado = espectro / max(espectro);
    espectro_normalizado = transpose(espectro_normalizado);
    energia = sum(audio.^2);  % Energía del audio
    ritmo = mean(diff(audio));  % Ritmo del audio
    resultado = [espectro_normalizado, energia, ritmo];
end