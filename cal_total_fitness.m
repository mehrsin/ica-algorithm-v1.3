function  imp=cal_total_fitness(imp,zeta)

nimp=length(imp);

for i=1:nimp
   
    imp(i).totalfit=imp(i).fit+zeta*mean([imp(i).colony.fit]);
    
end

end







