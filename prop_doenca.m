%************************************************************************
%  Função prop_doencas
%**********************
%  Estuda o numero de dias ate contaminacao total de uma populacao
%************************************************************************
function prop_doenca
    exit = 0;
    choice = 0;
    
    %menu para escolha da resolucao ou do estudo a efetuar
    while ~exit
        choice = menu('Estudo da propagacao de uma doenca', ...
            'Numero de dias ate contaminacao total', 'Estudo da influencia de R', ...
            'Estudo da influencia de Ni', 'Voltar'); 

        switch choice
            %resolucao da equacao
            case 1
                %pedido dos dados da funcao de propagacao
                dados = inputdlg({'Caracteristica da doenca, R'; ...
                    'Populacao nao infetada inicial, Ni'}, 'Dados', 1);    
                R = str2num(dados{1});
                Ni = str2num(dados{2});
               
                %resolucao
                [sol, t, dias, n] = dias_contaminacao(R, Ni);
               
                %vetor auxiliar de 0.5
                %delimita a zona em toda a populacao esta infetada
                v = ones(1, n+1)/2;
               
                %grafico do numero de pessoas infetadas em funcao do tempo
                fprintf('\nNumero de dias ate a contaminacao total: %d\n', dias);
                desenha_graf(t, sol, v, ...
                   'Pessoas nao infetadas ao longo do tempo', ...
                   'Dias', 'Pessoas nao infetadas', 'Pessoas nao infetadas', ...
                   'Ultima pessoa nao infetada', '-', '-');
           
           %estudo da influencia de R
           case 2
               %pedido do valor de Ni
               dados = inputdlg('Populacao nao infetada inicial, Ni', 'Dados', 1);    
               Ni = str2num(dados{1});
               
               %inicializacoes
               vec_R = zeros(1, 19);
               vec_dias = zeros(1, 19);
               j=1;
               
               %delimitacao dos valores de R a estudar
               R_max = 0.0001;
               R_min = 0.00001;
               
               %calculo dos dias para contaminacao total para diferentes R
               for i=R_min:(R_max-R_min)/18:R_max                   
                   vec_R(j) = i;              
                   [~, ~, dias, ~] = dias_contaminacao(i, Ni);  
                   vec_dias(j) = dias;
                   j=j+1;
               end
               
               %vetor auxiliar de 1
               %delimita a contaminacao em 1 dia
               v = ones(1, 19);
               
               %grafico dos dias ate contaminacao total em funcao de R
               desenha_graf(vec_R, vec_dias, v, 'Estudo da influencia de R', ...
                   'R', 'Dias ate contaminacao total', ...
                   'Dias ate contaminacao total', 'Contaminacao em 1 dia', ...
                   '-', '-');
               
           %estudo da influencia de Ni
           case 3
               %pedido do valor de R
               dados = inputdlg('Caracteristica da doenca, R', 'Dados', 1);    
               R = str2num(dados{1});   
               
               %inicializacoes
               vec_Ni = zeros(1, 21);
               vec_dias = zeros(1, 21);
               j=1;
               
               %delimitacao dos valores de Ni a estudar
               Ni_max = 10000;
               Ni_min = 5000;
                              
               %calculo dos dias para contaminacao total para diferentes Ni
               for i=Ni_min:(Ni_max-Ni_min)/20:Ni_max                   
                   vec_Ni(j) = i;              
                   [~, ~, dias, ~] = dias_contaminacao(R, i);  
                   vec_dias(j) = dias;
                   j=j+1;
               end
               
               %vetor auxiliar de 1
               %delimita a contaminacao em 1 dia
               v = ones(1, 21);
               
               %grafico dos dias ate contaminacao total em funcao de Ni
               desenha_graf(vec_Ni, vec_dias, v, 'Estudo da influencia de Ni', ...
                   'Ni', 'Dias ate contaminacao total', ...
                   'Dias ate contaminacao total', ...
                   'Contaminacao em 1 dia', '-', '-');   
              
           otherwise
               exit = 1;               
       end
    end
end

