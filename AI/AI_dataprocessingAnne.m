clear, close all, clc


%% AI project (Artificial skin) data processing
load('/home/tgj/Documents/9.Semester/AI/AI_variables.mat') 
%load('/home/tj/Documents/9.Semester/AI/AI_variables.mat');


%% 3mm
%processData(x30_3mm_0_0_50.b1)
%data=x30_3mm_0_0_50.b1;
%processData(x30_3mm_0_0_50.b2)

%%

dataList =  [x30_3mm_1_1_50.b1 
            ,x30_3mm_1_1_50.b2 
            ,x30_3mm_neg1_1_50.b1
            x30_3mm_neg1_1_50.b2
            x30_3mm_neg1_neg1_50.b1
            ,x30_3mm_neg1_neg1_50.b2
            ,x30_5mm_0_0_50.b1
            ,x30_5mm_0_0_50.b2
            x30_5mm1_neg1_50.b1
            ,x30_5mm1_neg1_50.b2
            ,x30_5mm_1_1_50.b1
            ,x30_5mm_1_1_50.b2
            ,x30_5mm_0_0_50.b1
            ,x30_5mm_0_0_50.b2
            ,x20_10mm_0_0_50.b1
            ,x20_10mm_0_0_50.b2
            ,x30_10mm0_0_50.b1
            ,x30_10mm0_0_50.b2];%,
            
dataListNames =['x30_3mm_1_1_50.b1'
             'x30_3mm_1_1_50.b2'
             %orighinal data
%              'x30_3mm_neg1_1_50.b1'
%              'x30_3mm_neg1_1_50.b2'
%              'x30_3mm_neg1_neg1_50.b1'
%              'x30_3mm_neg1_neg1_50.b2'
             'x30_3mm-1_1_50.b1'
             'x30_3mm-1_1_50.b2'
             'x30_3mm-1-1_50.b1'
             'x30_3mm-1-1_50.b2'
             'x30_5mm_0_0_50.b1'
             'x30_5mm_0_0_50.b2'
             'x30_5mm1_-1_50.b1'
             'x30_5mm1_-1_50.b2'
             'x30_5mm_1_1_50.b1'
             'x30_5mm_1_1_50.b2'
             'x30_5mm_0_0_50.b1'
             'x30_5mm_0_0_50.b2'
             'x30_10m_0_0_50.b1'
             'x30_10m_0_0_50.b2'
             'x30_10mm0_0_50.b1'
             'x30_10mm0_0_50.b2'];

N_dataList = size(dataListNames);
counter = 1;
%%

for counter = 1:N_dataList(2)
    %%
    
    dataName = dataListNames(counter,:);
    display(dataName)
    dataIn = dataList(:,counter);  
    data = dataIn(not(isnan(dataIn))); 
    
    %% original 
    
    display('original')
    figure('Name', strcat('original - ', dataName))
    plot(data)
    title(strcat('original - ', dataName))
    xlabel('sample')
    ylabel('Value')
    
    %% Remove outliers
    
    display('Remove outliers')
    %new = removeOutliers(data);
    %data = [1 2 3 4 1000 4 3 2 1000 2]
%     STOPFLAG = true(1);
%     while STOPFLAG
%         tf = isoutlier(data)
%         index = find(tf,1)
%         data(index) = []
%         STOPFLAG = not(isempty(index))
%     end

    %tf = isoutlier(data);
    %new = data(tf==0);
    
    new = data;
    new = new(new > mean(new)*0.9);
    new = new(new < mean(new)*1.2);
    
    
    figure('Name', strcat('removed outliers - ', dataName))
    plot(new)
    title(strcat('removed outliers - ', dataName))
    xlabel('sample')
    ylabel('Value')

    %% Lowpass filter on removed outliers
    
    display('Lowpass filter on removed outliers')
    figure('Name', strcat('Applied lowpass - ', dataName))
    Fs = 10000; % PROPELY NOT CORRECT
    [Y,D] = lowpass(new,1,Fs);
    newOut = filter(D,new);
    plot(newOut)
    title(strcat('Applied lowpass - ', dataName))
    xlabel('sample')
    ylabel('Value')


    %% Using Filtfilt
    
    display('Using Filtfilt')
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

%% Test zone

C1=[1 2 3 4]';
C2=[1 2 3 4 5]';
C={C1,C2};
C(1)

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

