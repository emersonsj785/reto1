create or replace PROCEDURE SP_HOSPITAL_ACTUALIZAR(
    p_idHospital IN HOSPITAL.idHospital%TYPE,
    p_nombre IN VARCHAR2,
    p_antiguedad IN NUMBER,
    p_idDistrito IN NUMBER,
    p_area IN HOSPITAL.area%TYPE,
    p_idSede IN NUMBER,
    p_idGerente IN NUMBER,
    p_idCondicion IN NUMBER,
    p_fechaRegistro IN DATE,
    v_mensaje OUT VARCHAR2
) IS
BEGIN
    UPDATE HOSPITAL
    SET nombre = p_nombre,
        antiguedad = p_antiguedad,
        idDistrito = p_idDistrito,
        area = p_area,
        idSede = p_idSede,
        idGerente = p_idGerente,
        idCondicion = p_idCondicion,
        fechaRegistro = p_fechaRegistro
    WHERE idHospital = p_idHospital;

    -- Confirmar actualización exitosa
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        v_mensaje := 'Hospital actualizado en la Base de Datos';
    ELSE
        v_mensaje := 'Error: No se pudo actualizar el hospital';
        RETURN;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        v_mensaje := 'Error: ' || SQLERRM;
END;