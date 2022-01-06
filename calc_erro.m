%************************************************************************
%  Função calc_erro
%*******************
%  Calcula o erro absoluto do conjunto de pontos e o erro no ponto final
%  Recebe os pontos calculados pelo método e os pontos calculados
%  exatamente
%  Devolve o erro  em tf
%************************************************************************
function erro_tf = calc_erro(pontos_met, pontos_exat)
    
    max = 0;

    %erro em cada ponto
    for i = 1:1:size(pontos_met, 2)      
        aux = abs(pontos_met(i) - pontos_exat(i));
        %atualizacao do erro absoluto
        if (aux > max)
            max = aux;
        end           
    end

    %erro absoluto
    erro_abs = max;
    %erro no ponto final
    erro_tf = aux;
end

