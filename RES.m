function RES(sol,data)
load data
disp('======================================')
disp('            BEST Solution             ')
disp('======================================')
disp(sol.info)
xlswrite('out.xlsx',sol.info.O,1,'d5');




end


% in mahsol motalegh be matlabhome.ir ast foroshe an dar saiere sitha gheire ghanoni ast
% va peigard ghanoni darad dar sorate moshahede lotfan be ma etela dahid
% https://matlabhome.ir/
% @matlabhome_admin
% https://t.me/matlabhome
% 09190090258