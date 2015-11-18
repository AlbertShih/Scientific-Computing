clc; close all; clear all;

waveFile='high.wav';
[y, fs, nbits]=wavread(waveFile);
index1=41050;
frameSize=1024;
index2=index1+frameSize-1;
frame=y(index1:index2);

subplot(4,1,1); plot(y); grid on
title(waveFile);
line(index1*[1 1], [-1 1], 'color', 'r');
line(index2*[1 1], [-1 1], 'color', 'r');
subplot(4,1,2); plot(frame, '.-'); grid on
point=[210, 972];
line(point, frame(point), 'marker', 'o', 'color', 'red');

periodCount=4;
fp=((point(2)-point(1))/periodCount)/fs;	% fundamental period
ff=fs/((point(2)-point(1))/periodCount);	% fundamental frequency
highpitch=69+12*log2(ff/440);
fprintf('high.wav:\nFundamental period = %g second\n', fp);
fprintf('Fundamental frequency = %g Hertz\n', ff);
fprintf('Pitch = %g semitone\n', highpitch);

waveFile='low.wav';
[y, fs, nbits]=wavread(waveFile);
index1=41050;
frameSize=1024;
index2=index1+frameSize-1;
frame=y(index1:index2);

subplot(4,1,3); plot(y); grid on
title(waveFile);
line(index1*[1 1], [-1 1], 'color', 'r');
line(index2*[1 1], [-1 1], 'color', 'r');
subplot(4,1,4); plot(frame, '.-'); grid on
point=[240, 1002];
line(point, frame(point), 'marker', 'o', 'color', 'red');

periodCount=2;
fp=((point(2)-point(1))/periodCount)/fs;	% fundamental period
ff=fs/((point(2)-point(1))/periodCount);	% fundamental frequency
lowpitch=69+12*log2(ff/440);
fprintf('low.wav:\nFundamental period = %g second\n', fp);
fprintf('Fundamental frequency = %g Hertz\n', ff);
fprintf('Pitch = %g semitone\n', lowpitch);

fprintf('Pitch range= %g ~ %g semitone\n', lowpitch, highpitch);