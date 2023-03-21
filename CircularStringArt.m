clear clc;



graylion=rgb2gray(imread('C:\Users\AhmetSalih\Desktop\StringArtProject\Images\tesla4.jpg'));



pxlv=length(graylion(:,1));
pxlh=length(graylion(1,:));
midp=[pxlh/2,pxlv/2];

avrrgb=sum(graylion(:))/(pxlv*pxlh);

radius=250;
n=300;
repeat=600;
alfa=(2*pi)/n;
LW=1;
HLW=LW/2;


Coords=zeros(n,2);
for i=1:n
beta=i*alfa;
Coords(i,1)=midp(1,1)+cos(beta)*radius;
Coords(i,2)=midp(1,2)+sin(beta)*radius;
end
round(Coords,2)

best=10000000;
basepoint=1;
sayac2=1;
siralama=zeros(n,1);
siralama(1,1)=1;
sond=255;


for k=1:repeat;
    tic;
infomat=zeros(n,15);

            

if basepoint~=i
     for i=1:n;
         
         if abs(basepoint-i)>5
         
            x1sag=Coords(basepoint,1)-HLW;
            x1sol=Coords(basepoint,1)+HLW;
            y1sol=Coords(basepoint,2)+HLW;
            y1sag=Coords(basepoint,2)-HLW;
            x2alt=Coords(i,1)+HLW;
            x2ust=Coords(i,1)-HLW;
            y2ust=Coords(i,2)-HLW;
            y2alt=Coords(i,2)+HLW;
            
            
            BW=roipoly(graylion,[x1sol,x1sag,x2ust,x2alt],[y1sol,y1sag,y2ust,y2alt]);
            
            ilkd=sum(graylion(BW(:)))/sum(BW(:));
            

            infomat(i,1)=basepoint;
            infomat(i,2)=i;
            infomat(i,3)=Coords(i,1);
            infomat(i,4)=Coords(i,2);
            infomat(i,5)=Coords(basepoint,1);
            infomat(i,6)=Coords(basepoint,2);
            infomat(i,7)=sond-ilkd;
            
            infomat(i,8)=x1sol;
            infomat(i,9)=x1sag;
            infomat(i,10)=x2ust;
            infomat(i,11)=x2alt;
            infomat(i,12)=y1sol;
            infomat(i,13)=y1sag;
            infomat(i,14)=y2ust;
            infomat(i,15)=y2alt;
            
            
            
            
         end
    end
end

best=max(infomat(:,7));

index=find(infomat(:,7)==best);
basepoint=index(1,1);

sayac2=sayac2+1;
siralama(sayac2,1)=basepoint;

if sayac2>2 && basepoint==siralama(sayac2-2,1);
    basepoint=randi([1 200]);
end

if abs(siralama(sayac2,1)-siralama(sayac2-1,1))>4
basepoint    
end

BW=roipoly(graylion,[infomat(basepoint,8),infomat(basepoint,9),infomat(basepoint,10),infomat(basepoint,11)],[infomat(basepoint,12),infomat(basepoint,13),infomat(basepoint,14),infomat(basepoint,15)]);

graylion(BW(:)==1)=255;


imshow(graylion, [])
drawnow;

sond=sum(graylion(BW(:)))/sum(BW(:));

percentage=(sayac2/repeat)*100
x=toc;
mintocomplete=((repeat-k)*x)/60
end

siralama(find(siralama(:)==0))=1;

x1=Coords(siralama(1:k-1,1),1);
y1=pxlv-Coords(siralama(1:k-1,1),2);

x2=Coords(siralama(2:k,1),1);
y2=pxlv-Coords(siralama(2:k,1),2);

subplot(1,2,1);
imshow(graylion);
subplot(1,2,2);
p1=plot([x1 x2],[y1 y2],'color',[0.6 0.6 0.6],'LineWidth',0.4);




