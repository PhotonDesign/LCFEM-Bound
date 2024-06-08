function x = tr_sparseCoLO(A, b, c, K, J)

    % SparseCoLO + SeDuMi
    parCoLO.SDPsolver = 'mosek';
    parCoLO.domain = 1; parCoLO.range = 2; parCoLO.EQorLMI = 1;

    [x, y, infoCoLO, cliqueDomain, cliqueRange, LOP] = sparseCoLO_Mosek(A, b, c, K, J, parCoLO);
    
    [primalObjValue, dualObjValue, primalfeasiblity, dualfeasibility] = ...
        evaluateCoLO(x,y,A,b,c,K,J,cliqueDomain,cliqueRange);
    Obj = primalObjValue;
    
    x = psdCompletion(x, K, cliqueDomain);

end