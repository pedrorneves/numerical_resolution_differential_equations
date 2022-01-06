%************************************************************************
%  Função resolv_RK3
%********************
%  Resolve a equacao através do metodo de Runge-Kutta de 3a ordem
%  Recebe os dados da equacao
%  Devolve a solucao calculada pelo metodo
%************************************************************************
function sol_RK3 = resolv_RK3(f, yti, ti, tf, n)
        
    %passo
    h = (tf-ti)/n;
    
    %inicializacao e primeiro valor da matriz
    sol_RK3 = zeros([1 n+1]);
    sol_RK3(1) = yti;
    
    %ciclo para calcular cada um dos pontos
    j = 1;
    for i = (ti):(h):(tf-h)        
        t = i;
        
        %coeficientes
        k1 = f(t, sol_RK3(j));
        k2 = f(t + h/2, sol_RK3(j) + (k1)*h/2);
        k3 = f(t + h, sol_RK3(j) - (k1)*h + (k2)*h*2);
        %solucao
        sol_RK3(j+1) = sol_RK3(j) + (k1 + 4*k2 + k3)*h/6;
        
        j = j+1;        
    end
end

