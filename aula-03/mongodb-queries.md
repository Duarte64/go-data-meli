**Devolver restaurante_id, nombre, barrio e tipo_cocina mas excluindo _id para um documento (o primeiro).**
```
db.restaurantes.find(
    {},
    {
        _id: 0,
        nombre: 1, 
        barrio: 1,
        tipo_cocina:1,
        restaurante_id: 1,
    }
)
```

**Devolver restaurante_id, nombre, barrio e tipo_cocina para os primeiros 3 restaurantes que contenham 'Bake' em alguma parte do seu nome.**
```
db.restaurantes.find(
    {
        nombre: /Bake/
    },
    {
        _id: 0,
        nombre: 1, 
        barrio: 1,
        tipo_cocina:1,
        restaurante_id: 1,
    }
).limit(3)
```

**Contar os restaurantes de comida (tipo_cocina) china (Chinese) o tailandesa (Thai) do bairro (bairro) Bronx. Consultar or versus in.**
```
db.restaurantes.countDocuments(
    {
        tipo_cocina: {$in: ["Chinese","Thai"]},
        barrio: "Bronx"
    }
)
```

**Traga 3 restaurantes que receberam pelo menos uma classificação de grau 'A' com pontuação maior que 20. A mesma classificação deve atender às duas condições simultaneamente; investigue o operador elemMatch.**
```
db.restaurantes.find(
    {
        grados: {
            $elemMatch: {
                grado: "A",
                puntaje: { $gt: 20 }
            }
        }
    },
    {
        _id: 0,
        nombre: 1, 
        barrio: 1,
        tipo_cocina:1,
        restaurante_id: 1,
        grados: 1
    }
).limit(3)
```

**Quantos documentos estão faltando coordenadas geográficas? Em outras palavras, verifique se o tamanho de direccion.coord é 0 e contar.**
```
db.restaurantes.countDocuments({
    direccion: {
        coord: 0,
    }
})
```

**Devolver nombre, barrio, tipo_cocina y grados para os 3 primeiros restaurantes; de cada documento apenas a última avaliação. Ver o operador slice.**
```
db.restaurantes.find({},
    {
        _id: 0,
        nombre: 1, 
        barrio: 1,
        tipo_cocina:1,
        grados: { $slice: -1 }
    }
).limit(3)
```

**Quais são os 3 principais tipos de culinária (cuisine) que podemos encontrar nos dados? Googlear "mongodb group by field, count it and sort it". Ver a etapa limit do pipeline de agregação.**
```
db.restaurantes.aggregate([
    {
        $group: {
            _id: "$tipo_cocina",
            count: { $sum: 1 }
        }
    },
    {
        $sort: {
            count: -1
        }
    },
    {
        $limit: 3
    }
])
```

**Quais são os bairros mais desenvolvidos gastronomicamente? Calcular a média ($avg) a pontuação (grades.score) por bairro; considerando restaurantes com mais de três avaliações; oClassifique os bairros com a melhor pontuação. Ajuda: match é um estágio que filtra documentos com base em uma condição, similar a db.orders.find(<condição>). Parece necessário desconstruir as listas grades para produzir um documento para cada ponto usando o palco unwind.**
```
db.restaurantes.aggregate([
    {
        $match: {
            "grados.2": { $exists: true }
        }
    },
    {
        $unwind: "$grados"
    },
    {
        $group: {
            _id: "$barrio",
            averageScore: {$avg: "$grados.puntaje"}
        }
    },
    {
        $project: {
            _id: 1,
            averageScore: { $round: ["$averageScore", 2] }
        }
    },
    {
        $sort: {
            averageScore: -1
        }
    }
])
```

**Uma pessoa querendo comer está na longitude -73.93414657 e na latitude 40.82302903, Quais opções você tem em um raio de 500 metros? Consultar geospatial tutorial.**
```
db.restaurantes.find({
    "direccion.coord": {
        $geoWithin: {
            $centerSphere: [
                [-73.93414657, 40.82302903],
                500 / 6378.1
            ]
        }
    }
})
```