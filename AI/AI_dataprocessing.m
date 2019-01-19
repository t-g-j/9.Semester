clear, colse all, clc


%% AI project (Artificial skin) data processing
%load('/home/tgj/Documents/9.Semester/AI/AI_variables.mat') 
load('/home/tj/Documents/9.Semester/AI/AI_variables.mat') 


%% 3mm
%processData(x30_3mm_0_0_50.b1)
%data=x30_3mm_0_0_50.b1;
%processData(x30_3mm_0_0_50.b2)

%%
processData(x30_3mm_1_1_50.b1)
processData(x30_3mm_1_1_50.b2)

processData(x30_3mm_neg1_1_50.b1)
processData(x30_3mm_neg1_1_50.b2)


processData(x30_3mm_neg1_neg1_50.b1)
processData(x30_3mm_neg1_neg1_50.b2)

% 5mm
processData(x30_5mm_0_0_50.b1)
processData(x30_5mm_0_0_50.b2)

processData(x30_5mm1_neg1_50.b1)
processData(x30_5mm1_neg1_50.b2)

processData(x30_5mm_1_1_50.b1)
processData(x30_5mm_1_1_50.b2)

processData(x30_5mm_0_0_50.b1)
processData(x30_5mm_0_0_50.b2)

% 10mm
processData(x30_10mm_0_0_50.b1)
processData(x30_10mm_0_0_50.b2)

processData(x30_10mm_1_1_50.b1)
processData(x30_10mm_1_1_50.b2)

processData(x30_10mm0_0_50.b1)
processData(x30_10mm0_0_50.b2)
%%
processData(x30_5mm_0_0_50.b1)

function processed = processData(data)

plot(data)
title('original')
xlabel('sample')
ylabel('Value')
%% Remove outliers

figure
new = removeOutliers(data);
plot(new)
title('removed outliers')
xlabel('sample')
ylabel('Value')

%% Lowpass filter on removed outliers
figure
Fs = 10000; % PROPELY NOT CORRECT
[Y,D] = lowpass(new,1,Fs);
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

end


%% Finding outliers
function noOutLier = removeOutliers(x)
STOPFLAG = true(1);
    while STOPFLAG
    tf = isoutlier(x);
    index = find(tf,1);
    x(index) = [];
    STOPFLAG = not(isempty(index));
    end
    noOutLier = x;
end

