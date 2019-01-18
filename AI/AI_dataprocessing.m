%% AI project (Artificial skin) data processing
%plot(x30_5mm_0_0_50.b1)

plot(x30_5mm_0_0_50.b2)
title('original')
xlabel('sample')
ylabel('Value')
%% Remove outliers

figure
new = removeOutliers(x30_5mm_0_0_50.b2);
plot(new)
title('removed outliers')
xlabel('sample')
ylabel('Value')

%% Lowpass filter on removed outliers
figure
Fs = 10000; % PROPELY NOT CORRECT
[Y,D] = lowpass(new,100,Fs);
newOut = filter(D,new);
plot(newOut)
title('Applied lowpass')
xlabel('sample')
ylabel('Value')


%% Using Filtfilt
figure
sff = filtfilt(D,new);
plot(sff)
title('filtfilt')




%% Butterworth removec outliers
%Wn = 300/500;
%[B,A] = butter(2,Wn,'low');
%h = fvtool(B,A)
%newOut = filter(B,A,x30_5mm_0_0_50.b2);
%plot(newOut)
%




%% Finding outliers
function noOutLier = removeOutliers(x)
STOPFLAG = true(1)
    while STOPFLAG
    tf = isoutlier(x);
    index = find(tf,1);
    x(index) = [];
    STOPFLAG = not(isempty(index));
    end
    noOutLier = x;
end

