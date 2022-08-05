

emp.x=[];
emp.info=[];
emp.fit=[];
emp.SCH=[];

colony=repmat(emp,ncountries,1);


for i=1:ncountries
    i
colony(i).x=unifrnd(lb,ub);
colony(i)=fitness(colony(i),data);
end



[value,index]=sort([colony.fit]);

colony=colony(index);

imp=colony(1:nimp);

colony=colony(nimp+1:end);


ncolony=length(colony);
colony=colony(randperm(ncolony));



k=0;
j=1;

for i=1:ncolony
 k=k+1;
    
imp(k).colony(j)=colony(i);

if k==nimp
    k=0;
    j=j+1;
end


end


