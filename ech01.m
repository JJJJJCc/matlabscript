fs = 44100;
tau =round([0.001*fs, 0.002*fs, 0.003*fs]);
gamma = 0.9;
h = zeros(1,fs);
h(1) = 1;
for i = 1:3
    hold;
    h(tau(i)) = gamma; 
    N = 2^nextpow2(length(h));
    H = mag2db((abs(fft(h,N))/N).^2);
    f = 0:fs/N:fs/2-fs/N;
    plot(f,H(1:N/2));
    xlim([0,2000]);
    hold;
end
legend('1ms','2ms','3ms');
title('Frequency response of echo');
xlabel('Frequency(Hz)');
ylabel('Amplitude(dB)');



