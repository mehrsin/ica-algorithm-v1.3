function  imp=assimilation(imp,nvar,beta,data)

nimp=length(imp);
varsize=size(imp(1).x);

for i=1:nimp
    ncolony=length(imp(i).colony);
    
    for j=1:ncolony
    
        d=imp(i).x-imp(i).colony(j).x;
        d=d.*rand(varsize)*beta;
        
        imp(i).colony(j).x=imp(i).colony(j).x+d;
        

        
        imp(i).colony(j)=fitness(imp(i).colony(j),data);
        
        
    end
end



end



