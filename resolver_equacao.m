%************************************************************************
%  Função resolver_equacao
%**************************
%  Pergunta qual o metodo a usar na resolucao e apresenta o erro respetivo 
%  e um grafico com a solucao aproximada e a solucao exata em funcao
%  do tempo
%  Recebe os dados da equacao
%************************************************************************
function resolver_equacao(f, yti, ti, tf)          
    
    %pedir numero de intervalos
    %transformar o passo pedido num passo e numero de intervalos
    %utilizaveis
    passos = inputdlg('Passo', 'Passo', 1);
    hu = str2num(passos{1});    
    nr = (tf-ti)/hu;
    n = double(round(0.5+nr));
    h = (tf-ti)/n;

    %escolha do metodo a usar e resolucao correspondente
     choice = menu('Metodo Numerico para Resolucao da Equacao', ...
          'Método de Euler Progressivo', 'Método de Runge-Kutta de 3a ordem');        
    
      switch choice         
         %Euler
         case 1
             %garantir a estabilidade do processo, validando o passo e
             %numero de intervalos
             passo = calc_passo_RK3(f, yti, ti, tf);
             if (n <= double(passo(3)))
                 n = double(passo(3))+1;
             end
             %calculo da solucao aproximada
             sol_aprox = zeros(1, n+1);             
             sol_aprox = resolv_euler(f, yti, ti, tf, n);
             %inicializacao da solucao exata
             sol_exata_val = zeros(1, n+1);
             %variavel texto
             texto = 'Metodo de Euler Progressivo';
         
         %RK3
         case 2
             %garantir a estabilidade do processo, validando o passo e
             %numero de intervalos
             passo = calc_passo_euler(f, yti, ti, tf);
             if (n <= double(passo(3)))
                 n = double(passo(3))+1;
             end
             %calculo da solucao aproximada
             sol_aprox = zeros(1, n+1);             
             sol_aprox = resolv_RK3(f, yti, ti, tf, n);
             %inicializacao da solucao exata
             sol_exata_val = zeros(1, n+1);
             %variavel texto
             texto = 'Metodo de Runge-Kutta de 3a Ordem';
     end  
    
    %erro    
    erro = zeros(1, 2);
    sol_exata_val = solucao_val(f, yti, ti, tf, n);
    erro = calc_erro(sol_aprox, sol_exata_val); 
    %apresentacao do erro em tf no ecra
    fprintf('\nO erro no ultimo ponto e:\n');
    erro
    
    %grafico da solucao aproximada e da solucao exata em funcao do tempo
    t = zeros(1, n+1);
    for i = 0:1:n
        t(i+1) = ti + i*h;
    end        
    desenha_graf(t, sol_aprox, sol_exata_val, texto, 't', 'y(t)', ...
        'Aproximacao numerica', 'Solucao exata', '--o', '--*')
        
end