create or replace PROCEDURE SP_HOSPITAL_REGISTRAR(
    p_nombre IN VARCHAR2,
    p_antiguedad IN NUMBER,
    p_idDistrito IN NUMBER,
    p_area IN HOSPITAL.area%TYPE,
    p_idSede IN NUMBER,
    p_idGerente IN NUMBER,
    p_idCondicion IN NUMBER,
    p_fechaRegistro IN DATE,
    v_mensaje OUT VARCHAR2,
    hospital_refcur OUT SYS_REFCURSOR
) 
IS
    v_idHospital HOSPITAL.idHospital%TYPE;
BEGIN
    INSERT INTO HOSPITAL (idDistrito, nombre, antiguedad, area, idSede, idGerente, idCondicion, fechaRegistro)
    VALUES (p_idDistrito, p_nombre,p_antiguedad, p_area, p_idSede, p_idGerente, p_idCondicion, p_fechaRegistro)
    RETURNING idHospital INTO v_idHospital;

    -- Confirmar inserción exitosa
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        v_mensaje := 'Hospital agregado a la Base de Datos';
    ELSE
        v_mensaje := 'Error: No se pudo agregar el hospital';
        RETURN;
    END IF;

    -- Abrir el cursor ref para devolver los datos del nuevo hospital
    OPEN hospital_refcur FOR
        SELECT * FROM HOSPITAL WHERE idHospital = v_idHospital;
    
EXCEPTION
    WHEN OTHERS THEN
        v_mensaje := 'Error: ' || SQLERRM;
END;