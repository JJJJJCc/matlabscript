function y = amp_mod(car,mod,fs,dur,name)
% function y = amp_mod(car,mod,fs,dur,name)
% car = Vector holding carrier frequency, amplitude, and phase [fc ac pc]
% mod = Vector holding modulating frequency, amplitude and phase [fm am pm]
% fs = Sampling Rate
% dur = Duration of signal in seconds
% name = name of output wave
% Chen Ji/ Lab2-Q1
t = 0:1/fs:dur-1/fs;
y = (1+mod(2)*cos(2*pi*mod(1)*t+mod(3))).*(car(2)*cos(2*pi*car(1)*t+car(3)));%AM operation
y = y/max(abs(y));%normalization
audiowrite(name,y,fs);%write y into an audio file
end

%By trying out the example groups: car=[440 .9 pi/2] and mod=[5 .5 0]; 
%car=[440 .9 pi/2] and mod=[220 .5 0]. I find that the sound generated from
%first modulation is in higher putch while the second one is in lower
%pitch. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The first sound sounds like 440Hz but have a slightly lower or
%higher pitch difference happening, which might similar to the tremolo
%effect used in guitar. After AM, 440Hz generates 435Hz and 445Hz
%
%The second sound sounds like lower, because it generates 440Hz, 220Hz, and
%660Hz.
%
