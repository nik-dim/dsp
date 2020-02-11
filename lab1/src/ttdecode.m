 function out  = ttdecode(signIn)

[beginning,ending]=findCriticalPoints(signIn)
filename = 'touchpad.mat';
m = matfile(filename);
touchpad=m.touchpad;

% signal_length=length(signIn);
endloop=length(ending);

% index=zeros(8,2);
h=ending-beginning
for i = 1:endloop
    
    y_used=signIn(beginning(i):ending(i));
    y_used= y_used.*transpose(h(i));
    Y_USED=fft(y_used,1000);
    L=length(Y_USED);
    frequencyBoundary=round(0.8*L/(2*pi));
    
    index1(i)=2*pi*abs(find(Y_USED == max(Y_USED(1:frequencyBoundary)),1,'last'))/L;
    index2(i)=2*pi*abs(find(Y_USED == max(Y_USED(frequencyBoundary:frequencyBoundary.*2)),1,'last'))/L;
end

for i=1:endloop
    for j=1:10
        distance(j)=(touchpad(j,1)-index1(i)).^2 + (touchpad(j,2)-index2(i)).^2
    end
    digit(i)=mod(find(distance == min(distance(:))),10);
    
end


out=digit;

end

