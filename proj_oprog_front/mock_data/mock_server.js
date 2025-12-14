const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

const catalogData = {
  0: {
    catalogs: [
      { name: "drzewa", id: 1 },
      { name: "chodniki", id: 2 }
    ],
    datasets: [
      { name: "lista_urzedow", id: 0 }
    ]
  },
  1: {
    catalogs: [],
    datasets: []
  },
  2: {
    catalogs: [
      { name: "bemowo", id: 3 }
    ],
    datasets: []
  },
  3: {
    catalogs: [],
    datasets: []
  }
};

const datasetData = {
  0: {
    id: 0,
    name: "lista_urzedow",
    desc: "Lista urzędów w Warszawie",
    contact_point: "kontakt@warszawa.pl",
    keywords: ["urząd", "warszawa", "administracja"],
    distributions: [
      {
        distribution_id: 1,
        accessURL: "https://api.warszawa.pl/datasets/urzedy",
        description: "API endpoint dla danych o urzędach",
        format: "JSON",
        availability: true
      }
    ],
    schema_id: 1
  }
};

app.post('/catalogs', (req, res) => {
  res.status(200).json({'catalog_id': 5})
});

app.get('/catalogs/children/:id', (req, res) => {
  const id = req.params.id;
  const data = catalogData[id];

  if (data) {
    res.json(data);
  } else {
    res.status(404).json({ error: 'Catalog not found' });
  }
});

// Schema storage
let schemaData = [
  {
    name: 'User',
    id: 1,
    jsonSchema: JSON.stringify([
      { name: 'username', type: 'string', count: '1' },
      { name: 'email', type: 'string', count: '1' }
    ])
  },
  {
    name: 'Product',
    id: 2,
    jsonSchema: JSON.stringify([
      { name: 'title', type: 'string', count: '1' },
      { name: 'price', type: 'number', count: '1' }
    ])
  }
];

let nextSchemaId = 3;

// GET /schemas/list - retrieves list of schemas
app.get('/schemas/list', (req, res) => {
  res.json({
    schemas: schemaData.map(({ name, id }) => ({ name, id }))
  });
});

// GET /schemas/:id - retrieves single schema by ID
app.get('/schemas/:id', (req, res) => {
  const id = parseInt(req.params.id, 10);
  const schema = schemaData.find(s => s.id === id);
  if (schema) {
    res.json({
      id: schema.id,
      name: schema.name,
      jsonSchema: schema.jsonSchema
    });
  } else {
    res.status(404).json({ error: 'Schema not found' });
  }
});

// POST /schemas - add new schema
app.post('/schemas', (req, res) => {
  const { name, jsonSchema } = req.body;
  const newSchema = {
    id: nextSchemaId++,
    name,
    jsonSchema
  };
  schemaData.push(newSchema);
  res.status(201).json(newSchema);
});

// PUT /schemas/:id - update existing schema
app.put('/schemas/:id', (req, res) => {
  const id = parseInt(req.params.id, 10);
  const { name, jsonSchema } = req.body;
  const index = schemaData.findIndex(s => s.id === id);

  if (index !== -1) {
    schemaData[index] = { ...schemaData[index], name, jsonSchema };
    res.json(schemaData[index]);
  } else {
    res.status(404).json({ error: 'Schema not found' });
  }
});


app.get('/datasets/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const dataset = datasetData[id];

  if (dataset) {
    res.json(dataset);
  } else {
    res.status(404).json({ error: 'Dataset not found' });
  }
});

app.post('/datasets', (req, res) => {
  const newId = Math.max(...Object.keys(datasetData).map(k => parseInt(k)), -1) + 1;
  const newDataset = {
    id: newId,
    name: req.body.name,
    desc: req.body.description,
    contact_point: req.body.contactPoint,
    keywords: req.body.keywords || [],
    distributions: req.body.distributions || [],
    schema_id: req.body.schemaId,
  };
  datasetData[newId] = newDataset;
  res.status(201).json({ id: newId });
});

app.put('/datasets/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const dataset = datasetData[id];

  if (dataset) {
    Object.assign(dataset, req.body);
    dataset.id = id;
    res.json(dataset);
  } else {
    res.status(404).json({ error: 'Dataset not found' });
  }
});

app.listen(3000, () => {
  console.log('Mock server running on http://localhost:3000');
});