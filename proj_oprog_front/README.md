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