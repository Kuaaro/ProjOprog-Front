# proj_oprog_front


### Urychomienie kontenera z aplikacją
Zbudowanie image'a
```
docker build -f ./docker/Dockerfile -t my-flutter-app .
```
Uruchomienie kontenra
```
docker run -d -p 8080:80 --name flutter_container my-flutter-app
```
### Uruchomienie serwera z testowym API

```sh
cd moda_data
npm install
node mock_server.js
```

## Docker Compose (Full Stack)

Run both backend and frontend together using Docker Compose.

### Prerequisites

- Docker
- Docker Compose
- Both backend and frontend repositories cloned

### Setup

1. Clone both repos:

```bash
git clone https://github.com/Kuaaro/ProjOpro-Back.git
git clone https://github.com/Kuaaro/ProjOprog-Front.git
```

2. Move or link `docker-compose.yml` from the backend repository to the parent directory (same level as both repos):
```bash
ln ProjOpro-Back/src/docker-compose.yml .
```

Your final structure should look like:
```
/parent-directory/
├── ProjOpro-Back/      # Backend repository
├── ProjOprog-Front/     # Frontend repository
└── docker-compose.yml  # Docker Compose file (moved here)
```

### Running

From the parent directory (where `docker-compose.yml` is located):
```bash
docker-compose up --build
```

### Access Points

- **Frontend**: `http://localhost`
- **Backend API**: `http://localhost:5056`
- **Swagger UI**: `http://localhost:5056/swagger`
