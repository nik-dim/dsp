%1.5

pointers=zeros(8,2)
h=hamming(1000);
for i = 1:8
    beginning=(i-1).*(1000+100)+1;
    ending=(i-1).*(1000+100)+1000;
    y_used=y(beginning:ending);
    y_used= y_used.*transpose(h);
    Y_USED=fft(y_used,2000);
    L=length(Y_USED);
    frequencyBoundary=round(0.8*L/(2*pi));
    
    pointers(i,1)=2*pi*abs(find(Y_USED == max(Y_USED(1:frequencyBoundary)),1,'last'))/L;
    pointers(i,2)=2*pi*abs(find(Y_USED == max(Y_USED(frequencyBoundary:frequencyBoundary.*2)),1,'last'))/L; %eeee den pame kalaaa
    
end


for i=1:8
    for j=1:10
        distance(j)=(touchpad(j,1)-pointers(i,1)).^2 + (touchpad(j,2)-pointers(i,2)).^2
    end
    digit(i)=mod(find(distance == min(distance(:))),10);
    
end

disp(digit)