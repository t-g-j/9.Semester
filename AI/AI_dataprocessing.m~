close all, clc


%% AI project (Artificial skin) data processing
%load('/home/tgj/Documents/9.Semester/AI/AI_variables.mat') 
load('/home/tgj/Documents/9.Semester/AI/AI_variables.mat') 


%% Loading dock!
dataList =  {x30_3mm_0_0_50.b1 
            ,x30_3mm_0_0_50.b2
            ,x30_3mm_1_1_50.b1 
            ,x30_3mm_1_1_50.b2 
            ,x30_3mm_neg1_1_50.b1
            ,x30_3mm_neg1_1_50.b2
            ,x30_3mm_neg1_neg1_50.b1
            ,x30_3mm_neg1_neg1_50.b2
            % 5mm
            ,x30_5mm_0_0_50.b1
            ,x30_5mm_0_0_50.b2
            ,x30_5mm1_neg1_50.b1
            ,x30_5mm1_neg1_50.b2
            ,x30_5mm_1_1_50.b1
            ,x30_5mm_1_1_50.b2
            ,
            % 10mm
            ,x20_10mm_0_0_50.b1
            ,x20_10mm_0_0_50.b2
            ,x20_10mm_1_1_50.b1
            ,x20_10mm_1_1_50.b2
            ,x30_10mm0_0_50.b1
            ,x30_10mm0_0_50.b2};
        
dataListNames =['x30_3mm_0_0_50.b1' 
             ,'x30_3mm_0_0_50.b2'
             'x30_3mm_1_1_50.b1'
             'x30_3mm_1_1_50.b2'
             'x30_3mm-1_1_50.b1'
             'x30_3mm-1_1_50.b2'
             'x30_3mm-1-1_50.b1'
             'x30_3mm-1-1_50.b2'
             % 5mm
             'x30_5mm_0_0_50.b1'
             'x30_5mm_0_0_50.b2'
             'x30_5mm1_-1_50.b1'
             'x30_5mm1_-1_50.b2'
             'x30_5mm_1_1_50.b1'
             'x30_5mm_1_1_50.b2'
             % 10mm
             'x20_10m_0_0_50.b1'
             'x20_10m_0_0_50.b2'
             'x20_10m_1_1_50.b1'
             'x20_10m_1_1_50.b2'
             'x30_10mm0_0_50.b1'
             'x30_10mm0_0_50.b2'];
         %%
% processData(x30_3mm_1_1_50.b1)
% processData(x30_3mm_1_1_50.b2)
% 
% processData(x30_3mm_neg1_1_50.b1)
% processData(x30_3mm_neg1_1_50.b2)
% 
% 
% processData(x30_3mm_neg1_neg1_50.b1)
% processData(x30_3mm_neg1_neg1_50.b2)
% 
% % 5mm
% processData(x30_5mm_0_0_50.b1)
% processData(x30_5mm_0_0_50.b2)
% 
% processData(x30_5mm1_neg1_50.b1)
% processData(x30_5mm1_neg1_50.b2)
% 
% processData(x30_5mm_1_1_50.b1)
% processData(x30_5mm_1_1_50.b2)
% 
% processData(x30_5mm_0_0_50.b1)
% processData(x30_5mm_0_0_50.b2)
% 
% % 10mm
% processData(x20_10mm_0_0_50.b1)
% processData(x20_10mm_0_0_50.b2)
% 
% processData(x20_10mm_1_1_50.b1)
% processData(x20_10mm_1_1_50.b2)
% 
% processData(x30_10mm0_0_50.b1)
% processData(x30_10mm0_0_50.b2)


         %% display(dataName)
N_dataList = size(dataListNames);
counter = 1
for counter = 1:N_dataList(1)-1
    tmp = dataListNames(counter,:)
    processData(dataList{counter},tmp)
    counter=counter+1
end    



function processed = processData(data,dataNames)
dataName = dataNames;
display(dataName)
display('original')
figure('Name', strcat('original - ', dataName))
plot(data)
title(strcat('original - ', dataName))
xlabel('sample')
ylabel('Value')
%% Remove outliers
    display('Remove outliers')
    n= 1.5;
    mu = mean(data)
    std_var = std(data)
    data(data>mean(data)+n*std(data))=[];
    data(data<mean(data)-80)=[];
%  will take care of discarding values that are n standard deviation above the mean of a. 
% https://stackoverflow.com/questions/15374193/removing-extreme-values-in-a-vector-in-matlab
    figure('Name', strcat('Removed outliers - ', dataName))
    plot(data)
    title('removed outliers')
    xlabel('sample')
    ylabel('Value')

new = data;
%% Lowpass filter on removed outliers
    figure('Name', strcat('Applied lowpass - ', dataName))

    Fs = 10000; % PROPELY NOT CORRECT
    [Y,D] = lowpass(new,1,Fs);
    newOut = filter(D,new);
    plot(newOut)
    title(strcat('Applied lowpass - ', dataName))
    xlabel('sample')
    ylabel('Value')


%% Using Filtfilt
    figure('Name', strcat('filtfilt - ', dataName))

    sff = filtfilt(D,new);
    plot(sff)
    title(strcat('filtfilt - ', dataName))




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

