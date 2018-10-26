/*decompor todos os dias entre 2 datas
Estudo de caso, Dashboard de RH - Data de Admissão e Demissão*/

HISTORICO = 
VAR _calendar =
    CALENDAR ( MIN ( GERAL[Data Admissão] ); MAX ( GERAL[Transferência] ) ) /* Coluna trasnferência criada a partir de Demissão*/
RETURN
    SELECTCOLUMNS (
        FILTER (
            CROSSJOIN ( GERAL; _calendar );
           GERAL[Data Admissão] <= [Date]
                &&GERAL[Transferência] >= [Date]
        );
        "Nome"; GERAL[Nome];
        "CPF"; GERAL[CPF]; 
        "Date"; [Date];
        "Cnpj";GERAL[CNPJ];
        "Empregador";GERAL[Empregador];
        "Cargo";GERAL[Cargo Atual];
        "Setor" ; GERAL[Setor];
        "Sexo" ; GERAL[Sexo];
        "Idade" ; GERAL[Idade];
        "Data Admissão" ; GERAL[Data Admissão];
        "Data Demissão" ; GERAL[Data Demissão]   
          )
