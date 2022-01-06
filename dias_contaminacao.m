%************************************************************************
%  Função dias_contaminacao
%***************************
%  Calcula o numero de dias ate que todas as pessoas estejam infetadas
%  Recebe o valor de R e de Ni
%  Devolve o vetor dos pontos da solucao da equacao, o vetor dos instantes
%  em que se mediram, os dias ate contaminacao total e o numero de
%  intervalos
%************************************************************************
function [pontos, instantes, dias, n] = dias_contaminacao(R, Ni)
       
    %intervalo de tempo, numero de intervalos e passo para a resolucao 
    ti = 0;
    tf = 400;
    n = 400;
    h = (tf-ti)/n;
    
    %inicializacao  e atribuicao de valores ao vetor que guarda os instantes
    instantes = zeros(1, n+1);  
    for i = 1:1:n
        instantes(i+1) = instantes(i) + h;
    end
    
    %definicao da funcao
    f = @(t,y) -R*y*(Ni+1-y);
    
    %resolucao da equacao
    pontos = resolv_RK3(f, Ni, ti, tf, n);
    
    %contagem do numero de dias ate contaminacao total
    counter = 1;
    while(pontos(counter) > 0.5)
        counter = counter + 1;
    end    
    dias = instantes(counter);
    
end