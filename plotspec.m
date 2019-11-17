function plotspec(x, fs)
% function plotspec(x, fs)
% A function to plot the magnitude spectrum of a real time domain signal
%
% plotspec(x)
% when no sampling rate is specified, normalize frequency to cycles per sample
%
% plotspec(x, fs)
% when a sampling rate is given, set the frequency axis in [Hz]
%
% Chen Ji/Lab 4-1

N = 2^nextpow2(length(x));
N1 = 2^15;
x1 = x(1:N1);
x2 = x(7*fs+(0:N1-1));

X = abs(fft(x,N))/N;
X = mag2db(X);
X = X(1:N/2);
X1 = abs(fft(x1.*hanning(N1),N))/N1;
X1 = mag2db(X1);
X1 = X1(1:N/2);
X2 = abs(fft(x2.*hanning(N1),N))/N1;
X2 = mag2db(X2);
X2 = X2(1:N/2);
TF = islocalmax(X);
if nargin == 1
    f = 0:2/N:1-2/N;
    semilogx(f,[X1 X2]);
    %plot(f,X,X(TF),'r*');
    xlim([100,10000]);
    xlabel('Normalized Frequency(cycles per sample)');
else
    f = 0:fs/N:fs/2-fs/N;
    semilogx(f,[X1 X2]);
    %plot(f,X,f(TF),X(TF),'r*');
    xlim([100,10000]);
    xlabel('Frequency(Hz)');
end
    ylabel('Amplitude');
    title('Magnitude spectrum of input signal');
end
