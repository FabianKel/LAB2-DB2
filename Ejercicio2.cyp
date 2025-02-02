// 1. Cree un nodo nuevo de tipo persona con el nombre del actor Michael Caine. Utilice la sentencia MERGE para evitar crear nodos duplicados.
MERGE (:Person {name: "Michael Caine"});

// 2. Verifique que se haya creado el nodo con la sentencia MATCH.
MATCH (p:Person {name: "Michael Caine"})
RETURN p;

// 3. También puede utilizar muchas sentencias merge dentro de un mismo query de cypher. Ejecute la siguiente sentencia
MERGE (:Person {name: "Leonardo DiCaprio"})
MERGE (:Person {name: "Christopher Nolan"})
MERGE (:Movie {title: "Inception"});

// 4. Como se revisó en la sesión teórica, se podrá utilizar la sentencia MERGE también para crear relaciones. Cree una relación ACTED_IN para el actor Michael Caine y la película The Dark Night
MATCH (p:Person {name: "Michael Caine"}), (m:Movie {title: "The Dark Knight"})
MERGE (p)-[:ACTED_IN]->(m);

// 5. Verifique que esa relación existe.
MATCH (p:Person {name: "Michael Caine"})-[r:ACTED_IN]->(m:Movie {title: "The Dark Knight"})
RETURN p, r, m;

// 6. Ahora, unifique los conocimientos del paso 3 y resto de pasos para que, con una misma sentencia, utilice una cadena de comandos MERGE para crear un nodo persona con el nombre Chadwick Boseman, un nodo de tipo película con el título Black Panther y la relación ACTED_IN
MERGE (p:Person {name: "Chadwick Boseman"})
MERGE (m:Movie {title: "Black Panther"})
MERGE (p)-[:ACTED_IN]->(m);

// 7. Confirme que la relación haya funcionado.
MATCH (p:Person {name: "Chadwick Boseman"})-[r:ACTED_IN]->(m:Movie {title: "Black Panther"})
RETURN p, r, m;

// 8. Ahora, con el resultado del comando anterior (paso 6), modifique el query para que en una misma consulta MERGE cree un nodo persona (Emily Blunt), un nodo película (A Quiet Place) y la relación ACTED_IN.
MERGE (p:Person {name: "Emily Blunt"})
MERGE (m:Movie {title: "A Quiet Place"})
MERGE (p)-[:ACTED_IN]->(m);
