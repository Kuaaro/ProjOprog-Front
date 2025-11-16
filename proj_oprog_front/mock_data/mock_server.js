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

app.get('/catalogs/children/:id', (req, res) => {
  const id = req.params.id;
  const data = catalogData[id];
  
  if (data) {
    res.json(data);
  } else {
    res.status(404).json({ error: 'Catalog not found' });
  }
});

app.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});