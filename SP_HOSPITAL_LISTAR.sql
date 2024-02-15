create or replace PROCEDURE SP_HOSPITAL_LISTAR (
    in_tipo IN INT, -- 1 para idHospital, 2 para idSede
    in_id IN INT, -- idHospital o idSede según el tipo
    hospital_refcur OUT SYS_REFCURSOR
) IS
BEGIN
    IF in_tipo = 1 THEN
        OPEN hospital_refcur FOR
            SELECT 
                H.idHospital,
                H.nombre,
                H.antiguedad,
                H.area,
                H.idDistrito,
                D.descDistrito,
                S.idSede,
                S.descSede,
                H.idGerente,
                G.descGerente,
                H.idCondicion,
                C.descCondicion,
                H.fechaRegistro
            FROM 
                HOSPITAL H
            INNER JOIN 
                DISTRITO D ON H.idDistrito = D.idDistrito
            INNER JOIN 
                SEDE S ON H.idSede = S.idSede
            INNER JOIN 
                GERENTE G ON H.idGerente = G.idGerente
            INNER JOIN 
                CONDICION C ON H.idCondicion = C.idCondicion
            WHERE 
                H.idHospital = in_id;
            COMMIT;
    ELSIF in_tipo = 2 THEN
        OPEN hospital_refcur FOR
            SELECT 
                H.idHospital,
                H.nombre,
                H.antiguedad,
                H.area,
                H.idDistrito,
                D.descDistrito,
                S.idSede,
                S.descSede,
                H.idGerente,
                G.descGerente,
                H.idCondicion,
                C.descCondicion,
                H.fechaRegistro
            FROM 
                HOSPITAL H
            INNER JOIN 
                DISTRITO D ON H.idDistrito = D.idDistrito
            INNER JOIN 
                SEDE S ON H.idSede = S.idSede
            INNER JOIN 
                GERENTE G ON H.idGerente = G.idGerente
            INNER JOIN 
                CONDICION C ON H.idCondicion = C.idCondicion
            WHERE 
                H.idSede = in_id;
            COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Tipo de búsqueda no válido.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron datos.');
        RAISE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE;
END;