%************************************************************************
%  Função resolv_euler
%**********************
%  Resolve a equacao através do metodo de Euler progressivo
%  Recebe os dados da equacao
%  Devolve a solucao calculada pelo metodo
%************************************************************************
function sol_E = resolv_euler(f, yti, ti, tf, n)
    
    %passo
    h = (tf-ti)/n;
    
    %inicializacao e primeiro valor da matriz, yti
    sol_E = zeros([1 n+1]);
    sol_E(1) = yti;
    
    %ciclo para calcular cada um dos pontos
    j = 1;
    for i = (ti):(h):(tf-h)
        t = i;
        
        %solucao
        sol_E(j+1) = sol_E(j) + h*f(t, sol_E(j));
        
        j = j+1;
    end
end