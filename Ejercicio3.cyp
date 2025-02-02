// 1. Verifique si la película Batman Begins existe. Cree una relación ACTED_IN entre Michael Caine y dicha película en cuya relación Michael Caine tuvo el rol de Alfred Penny.
MATCH (p:Person {name: "Michael Caine"})
MERGE (m:Movie {title: "Batman Begins"})
MERGE (p)-[:ACTED_IN {role: "Alfred Penny"}]->(m);

// 2. Ahora, como usted es un amante del cine, sabe que este mismo actor también tuvo el mismo rol con la película The Dark Knight. Agregue el rol a esta relación de la misma manera.
MATCH (p:Person {name: "Michael Caine"}), (m:Movie {title: "The Dark Knight"})
MERGE (p)-[:ACTED_IN {role: "Alfred Penny"}]->(m);

// 3. Ahora, actualice también dicha relación para la misma película y el mismo actor en donde agregue que el año de esa actuación fue en 2008
MATCH (p:Person {name: "Michael Caine"})-[r:ACTED_IN]->(m:Movie {title: "The Dark Knight"})
SET r.year = 2008;

// 4. Eliminar el rol de Michael Caine en The Dark Knight
MATCH (p:Person {name: "Michael Caine"})-[r:ACTED_IN]->(m:Movie {title: "The Dark Knight"})
REMOVE r.role;

// 5. Ahora, agregue un nuevo nodo persona Jane Doe con una relación de ACTED_IN a la película de The Matrix.
MERGE (p:Person {name: "Jane Doe"})
MERGE (m:Movie {title: "The Matrix"})
MERGE (p)-[:ACTED_IN]->(m);

// 6. ¿Qué otras personas tienen esta relación con dicha película?
MATCH (p:Person)-[:ACTED_IN]->(m:Movie {title: "The Matrix"})
RETURN p.name;

// 7.  ¿cuál es el actor que más ha trabajado con el mismo director?
MATCH (d:Person)-[:DIRECTED]->(m:Movie)<-[:ACTED_IN]-(a:Person)
RETURN a.name, d.name, count(m) AS collaborations
ORDER BY collaborations DESC
LIMIT 1;

// 8. Consultar todas las relaciones de Tom Cruise con películas
MATCH (p:Person {name: "Tom Cruise"})-[r]->(m:Movie)
RETURN p, r, m;

// 9. Para cerrar con broche de oro y solo por diversión, elimine todo en la base de datos de prueba
MATCH (n)
DETACH DELETE n;
