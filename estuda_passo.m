%************************************************************************
%  Função estuda_passo
%**********************
%  Apresenta o grafico da relacao entre log(erro) e log(passo)
%  Recebe os dados da funcao
%************************************************************************
function estuda_passo(f, yti, ti ,tf)
    
    fprintf('\nA processar...\n');

    %inicializacoes
    passo_e = zeros(1,3);
    passo_RK3 = zeros(1,3);
    er_euler = zeros(1, 20);
    er_RK3 = zeros(1, 20);
    passo_vec_e = zeros(1, 20);
    passo_vec_RK3 = zeros(1, 20);
    
    %calculo do minimo numero de intervalos que permita a estabilidade
    passo_e = calc_passo_euler(f, yti, ti, tf);
    nmin_e = double(passo_e(3)); %assumimos este como o numero de intervalos 
                                 %minimo, para mostrar a funcao a explodir; 
                                 %no intervalo seguinte ja e estavel
    passo_RK3 = calc_passo_RK3(f, yti, ti, tf);
    nmin_RK3 = double(passo_RK3(3)); %assumimos este como o numero de intervalos 
                                     %minimo, para mostrar a funcao a explodir; 
                                     %no intervalo seguinte ja e estavel
    
    %euler
    j = 1;
    for i = 1:1:20
        
        %determinacao de h e n, preenchimento do vetor de h
        h = ((tf-ti)/nmin_e)/(2^(i-1));
        passo_vec_e(i) = h;
        n = round((tf-ti)/h);
        
        %inicializacao
        sol_exata_val_e = zeros(1, nmin_e+1);
        aux_exata_val_e = zeros(1, n+1);
        sol_aprox_euler = zeros(1, nmin_e+1);
        erro_euler = zeros(1, 2);
        aux_sol_euler = zeros(1, n+1);
        
        %solucao exata
        aux_exata_val_e = solucao_val(f, yti, ti, tf, n);
        sol_exata_val_e(1) = aux_exata_val_e(1);
        for k = 1:1:nmin_e           
            sol_exata_val_e(k+1) = aux_exata_val_e(1+2^(i-1)*(k));
        end
                
        %solucao por euler       
        aux_sol_euler = resolv_euler(f, yti, ti, tf, n);   
        sol_aprox_euler(1) = aux_sol_euler(1);
        for k = 1:1:nmin_e
            sol_aprox_euler(k+1) = aux_sol_euler(1+2^(i-1)*(k));
        end       
        
        %erro
        erro_euler = calc_erro(sol_aprox_euler, sol_exata_val_e);
        er_euler(j) = erro_euler;
        
        j = j+1;
    end
    
   
   %RK3        
   j = 1; 
   for i = 1:1:20
        
        %determinacao de h e n, preenchimento do vetor de h
        h = ((tf-ti)/nmin_RK3)/(2^(i-1));
        passo_vec_RK3(i) = h;
        n = round((tf-ti)/h);
        
        %inicializacao
        sol_exata_val_RK3 = zeros(1, nmin_RK3+1);
        aux_exata_val_RK3 = zeros(1, n+1);
        sol_aprox_RK3 = zeros(1, nmin_RK3+1);
        erro_RK3 = zeros(1, 2);
        aux_sol_RK3 = zeros(1, n+1);
        
        %solucao exata
        aux_exata_val_RK3 = solucao_val(f, yti, ti, tf, n);
        sol_exata_val_RK3(1) = aux_exata_val_RK3(1);
        for k = 1:1:nmin_RK3
            sol_exata_val_RK3(k+1) = aux_exata_val_RK3(1+2^(i-1)*(k));
        end
        
        %solucao por RK3      
        aux_sol_RK3 = resolv_RK3(f, yti, ti, tf, n);  
        sol_aprox_RK3(1) = aux_sol_RK3(1);
        for k = 1:1:nmin_RK3
            sol_aprox_RK3(k+1) = aux_sol_RK3(1+2^(i-1)*(k));
        end
       
        %erro
        erro_RK3 = calc_erro(sol_aprox_RK3, sol_exata_val_RK3);
        er_RK3(j) = erro_RK3;
        
        j = j+1;
   end
    
    fprintf('Fim do processamento:\n');
    
    %grafico log(erro) por log(h)    
    loglog(passo_vec_e, er_euler,'--o', passo_vec_RK3, er_RK3, '--*')
    title('Estudo de log(erro) em funcao de log(passo)');
    xlabel('log(h)');
    ylabel('log(e)');
    legend('Euler Progressivo','Runge-Kutta de 3a ordem');
    grid on;
    
end
