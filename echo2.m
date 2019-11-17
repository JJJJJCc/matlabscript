fs = 44100;
ntau = 11;
ntaps = fs*1.2;
tau = [];
% set tau values
for i = 0:10
    tau = [tau,2^i];
end
tau = round(0.001*tau*fs);
irs = zeros(ntaps,ntau);
for i = 1:ntau
    irs(1,i) = 1;
    irs(tau(i)+1,i) = 0.9;
end
guitar = audioread('guitarsnip.wav');
guitar = [guitar(1:2*fs);zeros(1.5*fs,1)];
guitar_echo = fftfilt(irs(:,4),guitar);
soundsc(guitar_echo,fs);

drum = audioread('drumsnip.wav');
drum = [drum(1:1.5*fs);zeros(1.5*fs,1)];
drum_echo = fftfilt(irs(:,4),guitar);
soundsc(drum_echo,fs);