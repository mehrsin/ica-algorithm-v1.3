function RES(sol,data)
load data
disp('======================================')
disp('            BEST Solution             ')
disp('======================================')
disp(sol.info)
xlswrite('out.xlsx',sol.info.O,1,'d5');




end
