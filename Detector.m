%%basic initialization
timeAxis = (M(:,1));
Signal1 = (M(:,2));
Signal2 = (M(:,3));

Signal1Filtered = filter(EqUI500Order,Signal1);
Signal1FilteredButter = filter(ButterFilter,Signal1);
Signal1FilteredChebychev = filter(Chebychev1,Signal1);


%% detector
%This puts the entire signal in one array, in order to simulate an online
%detection system

detectorPlot = zeros((length(timeAxis)/2500));
p = zeros(4096,length(timeAxis)/3000); %the power spectrum is of length 4096

filteredFrame = filter(Chebychev1,Signal1(1 : 3000));
p(:,1) = pspectrum(filteredFrame,250)/sum(abs(pspectrum(filteredFrame,250)));



for i = 2:1:(length(timeAxis)/2500) %split into 10-second intervals, but take 2 extra seconds from before in case we need to use some other filter with a larger order.
    
    filteredFrame2s = filteredFrame(2500:2990);
    filteredFrame10s = filter(Chebychev1,Signal1((2500*(i-1)) : 2500*i));
    filteredFrame = [filteredFrame2s;filteredFrame10s];
    p(:,i) = pspectrum(filteredFrame,250)/sum(abs(pspectrum(filteredFrame,250))); %to have them normalized so as to see the perentage
    
    
end

for i = 1:1:(length(timeAxis)/2500)
    thisSpectrum = p(:,i);
    numberOfPeaks = 0;
    for j = 1:1:100
        if thisSpectrum(j) > 0.005
            numberOfPeaks = numberOfPeaks+1;
        end
    end

    for j = 250:1:4096
        if thisSpectrum(j) > 0.005
            numberOfPeaks = numberOfPeaks + 1;
        end
    end
    if numberOfPeaks < 18
        detectorPlot(i) = 1;
        disp ('ALARM AT TIME: ');
        disp(i*2500/250); %the alarm is always going to sound at the end of a measurement, not the beginning
    else
        
        detectorPlot(i) = 0;
        disp('NO ALARM KEEP LIVING');

    end
    
end

subplot(211); stem(linspace(10,length(timeAxis)/250,length(detectorPlot)),detectorPlot); title('Detector, 1 is for alarm, 0 is for safe');
subplot(212); plot(timeAxis,Signal1FilteredChebychev); title('ECG Signal');
    

%(p(:,i)) represents the ith interval's power spectrum

%% spectra for windows of signals
subplot(221);
plot(linspace(0,125,4096),pspectrum(Signal1FilteredChebychev(1000:4000),250)/sum(pspectrum(Signal1FilteredChebychev(1000:4000),250))); title('spectrum from time 4s to 16s');
subplot(222);
plot(linspace(0,125,4096),pspectrum(Signal1FilteredChebychev(8000:12000),250)/sum(pspectrum(Signal1FilteredChebychev(8000:12000),250)));title('spectrum from time 32s to 48s');
subplot(223);
plot(linspace(0,125,4096),pspectrum(Signal1FilteredChebychev(30000:33000),250)/sum(pspectrum(Signal1FilteredChebychev(30000:33000),250)),'r');title('spectrum from time 120s to 132s');
subplot(224);
plot(linspace(0,125,4096),pspectrum(Signal1FilteredChebychev(39000:42000)/sum(pspectrum(Signal1FilteredChebychev(39000:42000),250)),250),'r');title('spectrum from time 156s to 168s');
