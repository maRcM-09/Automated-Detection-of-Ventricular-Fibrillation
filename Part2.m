%%basic initialization
timeAxis = (M(:,1));
Signal1 = (M(:,2));
Signal2 = (M(:,3));

Signal1Filtered = filter(Equi,Signal1);
Signal1FilteredButter = filter(ButterOrder10,Signal1);
Signal1FilteredChebychev = filter(Chebychev1,Signal1);

freq=linspace(0,pi,4096);

%% detector
%This puts the entire signal in one array, in order to simulate an online
%detection system

p = zeros(4096,length(timeAxis)/3000); %the power spectrum will be of length 4096

p(:,1) = pspectrum(filter(Chebychev1,Signal1(1 : 3000)))/sum(abs(pspectrum(filter(Chebychev1,Signal1((1: 3000))))));
for i = 2:1:(length(timeAxis)/3000) %split into 12-second intervals, but take 2 extra seconds from before in case we need to use some other filter with a larger order.
    p(:,i) = pspectrum(filter(Chebychev1,Signal1((3000*i - 3500) : 3000*i)))/sum(abs(pspectrum(filter(Chebychev1,Signal1((2500*(i-1)) +1: 3000*i))))); %to have them normalized so as to see the perentage
end

%(p(:,i)) represents the ith interval's power spectrum
plot(p(:,7),'r');hold on ;plot(p(:,8),'blue');hold on ;plot(p(:,9),'yellow');hold on ;plot(p(:,10),'black');hold off ;
