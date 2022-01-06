%************************************************************************
%  Função solucao_exata
%***********************
%  Calcula a equacao da solucao exata e o seu valor nos pontos pedidos
%  Recebe os dados da funcao
%************************************************************************
function solucao_exata(f, yti, ti ,tf)
   
    %pedir numero de intervalos
    intervalos = inputdlg('Numero de intervalos', 'Numero de intervalos', 1);
    n = str2num(intervalos{1});
  
    %inicializacao de vetores
    sol_exata_val = zeros(1, n+1);
    
    %equacao
    sol_exata_eq = solucao_eq(f, yti, 0);
    fprintf('\nA solucao exata da equacao diferencial e:\n');
    sol_exata_eq
    
    %pontos
    sol_exata_val = solucao_val(f, yti, ti, tf, n);
    fprintf('\nOs valores nos pontos pedidos sao:\n');
    sol_exata_val

end

