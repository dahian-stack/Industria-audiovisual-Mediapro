USE mediapro;

-- 1. ¿Cuáles son todas las escenas de una producción específica? 
SELECT * FROM Escena
WHERE id_produccion = 1;

-- 2.¿Qué equipos técnicos tienen valor inferior a 10,000?
SELECT * FROM Equipo_Tecnico
WHERE valor < 10000;

-- 3. ¿Cuáles son los materiales grabados de cierta escena con calificación Óptima?
SELECT * FROM Material_Grabado
WHERE id_escena = 1
AND calificacion = 'óptima';

-- 4. ¿Qué localizaciones son interiores o tienen facilidades de electricidad? 
SELECT * FROM Localizacion
WHERE tipo = 'Interior'
OR facilidades LIKE '%electricidad%';

-- 5. ¿Cuáles son los planes de rodaje para la primera quincena de abril de 2024?
SELECT * FROM Plan_Rodaje
WHERE fecha BETWEEN '2024-04-01' AND '2024-04-15';

-- 6. ¿Qué actores han interpretado personajes Protagonista o Antagonista? 
SELECT DISTINCT a.*
FROM Actor a
JOIN Escena_Actor ea ON a.id_actor = ea.id_actor
JOIN Personaje p ON ea.id_personaje = p.id_personaje
WHERE p.descripcion LIKE '%Protagonista%'
OR p.descripcion LIKE '%Antagonista%';

-- 7. ¿Cuáles son las producciones con títulos que contienen las palabras "amor" o "tiempo"?
SELECT * FROM Produccion
WHERE titulo LIKE '%amor%'
OR titulo LIKE '%tiempo%';

-- 8. ¿Qué postproducciones iniciadas hace más de 30 días no tienen fecha de finalización?
SELECT * FROM Postproduccion
WHERE fecha_fin IS NULL
AND fecha_inicio < CURDATE() - INTERVAL 30 DAY;

-- 9. ¿Cuál es el material grabado ordenado por producción y duración?
SELECT * FROM Material_Grabado
ORDER BY id_produccion, duracion DESC;

-- 10. ¿Cuántos minutos de material se han grabado por producción y día de rodaje?
SELECT id_produccion, toma, SUM(duracion) AS total_minutos FROM Material_Grabado
GROUP BY id_produccion, toma;

