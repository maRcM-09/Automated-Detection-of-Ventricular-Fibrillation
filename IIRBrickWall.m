time20s = M(1:5000);
Mcoloumn3=M(30001:60000);
Window1 = Mcoloumn3(1:5000);
Window2 = Mcoloumn3(5001:10000);
Window3 = Mcoloumn3(10001:15000);
Window4 = Mcoloumn3(15001:20000);
Window5 = Mcoloumn3(20001:25000);
Window6 = Mcoloumn3(25001:30000);

%brickwall in frequency domain
BrickWall = [0,linspace(1,1,450),linspace(0,0,4098),linspace(1,1,450),0];
BrickWallTime = ifft(BrickWall);

WindowNew1 = real(ifft((fft(Window1').*(BrickWall))));
%WindowNew2 = real(ifft((fft(Window2').*(BrickWall))));
%WindowNew3 = real(ifft((fft(Window3').*(BrickWall))));
%WindowNew4 = real(ifft((fft(Window4').*(BrickWall))));
%WindowNew5 = real(ifft((fft(Window5').*(BrickWall))));
%WindowNew6 = real(ifft((fft(Window6').*(BrickWall))));

%subplot(2,3,1); plot(time20s,Window1); hold on; plot(time20s,WindowNew1,'r');hold off;
%subplot(2,3,2); plot(time20s,Window2); hold on; plot(time20s,WindowNew2,'r');hold off;
%subplot(2,3,3); plot(time20s,Window3); hold on; plot(time20s,WindowNew3,'r');hold off;
%subplot(2,3,4); plot(time20s,Window4); hold on; plot(time20s,WindowNew4,'r');hold off;
%subplot(2,3,5); plot(time20s,Window5); hold on; plot(time20s,WindowNew5,'r');hold off;
subplot(2,3,6); plot(time20s,Window6); hold on; plot(time20s,WindowNew6,'r');hold off;




