FROM instrumentisto/flutter:latest AS build

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./

RUN flutter pub get

COPY . .

RUN flutter build web --release --dart-define="METADATA_MANAGER_API=${METADATA_MANAGER_API:-http://localhost:3000}"

FROM nginx:1.25-alpine

COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
