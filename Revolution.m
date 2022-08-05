function  imp=Revolution(imp,nx,data,P_revolve)

nimp=length(imp);

for i=1:nimp
    ncolony=length(imp(i).colony);
    
    for j=1:ncolony
         
        
        if rand<P_revolve
         
            k=randi([1 nx]);
            
        d=1;
        d=0.1*unifrnd(-1,1)*d;
        
        imp(i).colony(j).x(k)=imp(i).colony(j).x(k)+d;
        
        
        imp(i).colony(j)=fitness(imp(i).colony(j),data);
        end
        
        
    end
end






end







