%************************************************************************
%  Função solucao_val
%*********************
%  Resolve a equacao em varios pontos, sem utilizar os metodos aqui 
%  definidos, através da funcao dsolve
%  Recebe os dados da equacao
%  Devolve os pontos da solucao 
%************************************************************************
function sol_val = solucao_val(f, yti, ti, tf, n)
    
    %passo
    h = (tf-ti)/n;
    
    %inicializacao    
    sol_val = zeros(1, n+1);  
    t_aux=ti;
    j = 1;
    
    %equacao da solucao
    eq = solucao_eq(f, yti, ti);
        
    %solucao nos diferentes pontos
    for i = (ti):(h):(tf)        
        sol_val(j) = eq(t_aux);
        t_aux = t_aux + h;
        j = j+1;       
    end
    
end
