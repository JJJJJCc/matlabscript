k = 1000;
dur = 2;
fs = 44100;
fundFreq = 441;

%for square wave
f = fundFreq*[1:2:(2*k-1)];
Z = (4/pi)./[1:2:(2*k-1)];
t = 0:1/fs:dur-1/fs;
square = additive(f, Z, fs, dur, 'square.wav');
subplot(3,1,1);
plot(t,imag(square));
xlim([0,5*1/441]);
xlabel('time(second)');ylabel('amplitude');title('Squarewave in five periods');

%for triangle wave
index = [1:2:(2*k+1)];
f = fundFreq* index;
sign = ones(1,(k+1));
sign(2:2:end) = -1;
Z = sign*(8/pi^2)./(index.^2);
t = 0:1/fs:dur-1/fs;
triangle = additive(f, Z, fs, dur, 'triangle.wav');
subplot(3,1,2);
plot(t,imag(triangle));
xlim([0,5*1/441]);
xlabel('time(second)');ylabel('amplitude');title('Trianglewave in five periods');

%for sawtooth wave
index = [1:k];
f = fundFreq*index;
Z = 1/pi./index;
t = 0:1/fs:dur-1/fs;
sawtooth = 1/2 - additive(f, Z, fs, dur, 'sawtooth.wav');
subplot(3,1,3);
plot(t,imag(sawtooth));
xlim([0,5*1/441]);
xlabel('time(second)');ylabel('amplitude');title('Trianglewave in five periods');


