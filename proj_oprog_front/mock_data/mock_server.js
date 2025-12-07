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

app.get('/catalogs/children/:id', (req, res) => {
  const id = req.params.id;
  const data = catalogData[id];
  
  if (data) {
    res.json(data);
  } else {
    res.status(404).json({ error: 'Catalog not found' });
  }
});

// Full schema data
const schemaData = [
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
  },
  {
    name: 'Order',
    id: 3,
    jsonSchema: JSON.stringify([
      { name: 'orderId', type: 'string', count: '1' },
      { name: 'amount', type: 'number', count: '1' }
    ])
  },
  {
    name: 'Invoice',
    id: 4,
    jsonSchema: JSON.stringify([
      { name: 'invoiceNo', type: 'string', count: '1' },
      { name: 'total', type: 'number', count: '1' }
    ])
  }
];

// /schema/list returns only name and id
app.get('/schema/list', (req, res) => {
  res.json(schemaData.map(({ name, id }) => ({ name, id })));
});

// /schema/:id returns full schema details
app.get('/schema/:id', (req, res) => {
  const id = parseInt(req.params.id, 10);
  const schema = schemaData.find(s => s.id === id);
  if (schema) {
    res.json(schema);
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
  console.log('Server running on http://localhost:3000');
});