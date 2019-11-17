function y = additive(f, Z, fs, dur, name)
% function y = additive(f, Z, fs, dur, name)
% f: vector of frequencies in Hz
% Z: vector of complex amplitudes A*exp(j*phi)
% fs: sampling rate in Hz
% dur: total duration of the signal in seconds
% name: name of the output audio file
% f and Z must be of the same length:
% Z(1) corresponds to f(1) and so on.
% chen Ji / Lab 2-2
if size(Z) ~= size(f)
    error('f and Z are not in the same size.');
else
    t = 0:1/fs:dur-1/fs;
    y = Z'.*exp(2*1j*pi*f'.*t); % vector addition
    sizey = size(y);
    if sizey(1)~=1
        y = sum(y);
    end
    y = y/max(abs(y));
    audiowrite(name,y,fs); % write y into an audio file
end

