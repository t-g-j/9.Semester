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
%% Manuel preprocessing of the data (cutting away samples after visual inspections.
%dataList{}= dataList{counter}(4000:end,1)
dataList{20}= dataList{20}(3*10^4:end,1)
dataList{19}= dataList{19}(3*10^4:end,1)

dataList{13}= dataList{13}(0.6*10^4:end,1)
dataList{14}= dataList{14}(0.6*10^4:end,1)

dataList{12}= dataList{12}(0.5*10^5:end,1)
dataList{11}= dataList{11}(0.5*10^5:end,1)

dataList{3}= dataList{3}(5*10^4:end,1)
dataList{4}= dataList{4}(5*10^4:end,1)

dataList{1}= dataList{1}(1:3.8*10^5,1)
dataList{2}= dataList{2}(1:3.8*10^5,1)

%% display(dataName)
N_dataList = size(dataListNames);
counter = 1

for counter = 1:N_dataList(1)
    tmp = dataListNames(counter,:)
    processData(dataList{counter},tmp)
    %counter=counter+1 %No need for function does that :) :) I think
end    



function processed = processData(data,dataNames)
dataName = dataNames;


%text(0.5, 0.98,strrep(dataName,'_','\_'))

display(dataName)
display('original')
%figure('Name', strcat('original - ', dataName))
figure('Name', strcat('', dataName))
%title(strrep(dataName,'_','\_'))

subplot(2,2,1);
plot(data)
title(strcat('original ', ''))
xlabel('sample')
ylabel('Value')
%% Remove outliers
    display('Remove outliers')
    n= 1.5;
    mu = mean(data)
    std_var = std(data)
    data(data>mean(data)+n*std(data))=[];
    data(data<mean(data)-60)=[];
%  will take care of discarding values that are n standard deviation above the mean of a. 
% https://stackoverflow.com/questions/15374193/removing-extreme-values-in-a-vector-in-matlab
    %figure('Name', strcat('Removed outliers - ', dataName))
    
    subplot(2,2,2);
    plot(data)
    title('removed outliers')
    xlabel('sample')
    ylabel('Value')

new = data;
%% Lowpass filter on removed outliers
    %figure('Name', strcat('Applied lowpass - ', dataName))
    
    subplot(2,2,3); 
    Fs = 10000; % PROPELY NOT CORRECT
    [Y,D] = lowpass(new,1,Fs);
    newOut = filter(D,new);
    plot(newOut(100:end,:))
    title(strcat('Applied lowpass ', ''))
    xlabel('sample')
    ylabel('Value')


%% Using Filtfilt
    %figure('Name', strcat('filtfilt - ', dataName))
 
    subplot(2,2,4);  
    sff = filtfilt(D,new);
    plot(sff)
    title(strcat('filtfilt ', ''))
    xlabel('sample')
    ylabel('Value')


%% Butterworth removec outliers
%Wn = 300/500;
%[B,A] = butter(2,Wn,'low');
%h = fvtool(B,A)
%newOut = filter(B,A,x30_5mm_0_0_50.b2);
%plot(newOut)
%
set(gcf,'units','normalized','outerposition',[0 0 1 1])
saveas(gcf,strcat('/home/tgj/Documents/9.Semester/AI/figure/plot_', dataName,'.png'))


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
%%

