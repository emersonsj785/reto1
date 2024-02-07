CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ELIMINAR(
    p_hospital IN NUMBER,
    v_mensaje OUT VARCHAR
) 
IS
    cursor hospitales is
        SELECT 1 FROM HOSPITAL FETCH FIRST 1 ROW ONLY;
        
    v_contador NUMBER := 0;
BEGIN
    -- Verificamos si hay al menos un hospital en la tabla
    FOR hospital_record IN hospitales LOOP
        v_contador := v_contador + 1;
    END LOOP;

    -- Si no hay ningún Hospital
    IF v_contador = 0 THEN
        v_mensaje := 'No hay datos en la tabla HOSPITAL.';
        RETURN;
    END IF;

    -- Contamos cuántos hospitales existen con el ID proporcionado
    SELECT COUNT(*)
    INTO v_contador
    FROM HOSPITAL
    WHERE idhospital = p_hospital;

    -- Si no se encuentra ningún hospital con el ID
    IF v_contador = 0 THEN
        v_mensaje := 'El hospital especificado no existe.';
        RETURN;
    END IF;

    -- Eliminar Hospital
    DELETE FROM HOSPITAL WHERE idhospital = p_hospital;

    v_mensaje := 'El hospital ha sido eliminado exitosamente.';
EXCEPTION
    WHEN OTHERS THEN
        v_mensaje := 'Error: ' || SQLERRM;
END;
