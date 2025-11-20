# Stage 1: Build Flutter web app
FROM ghcr.io/cirruslabs/flutter:stable AS build

# Accept API_BASE_URL as build argument
ARG API_BASE_URL=

ENV API_BASE_URL=${API_BASE_URL}

WORKDIR /workspace

# Copy pubspec files first for better caching
COPY pubspec.yaml pubspec.lock ./

# Install dependencies with cache mount
RUN --mount=type=cache,target=/root/.pub-cache \
    flutter pub get

# Copy the rest of the source code
COPY . .

# Build Flutter web app
RUN --mount=type=cache,target=/root/.pub-cache \
    flutter build web --release --base-href / --dart-define=API_BASE_URL=$API_BASE_URL

RUN ls -la build/web/

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy built Flutter web app from build stage
COPY --from=build /workspace/build/web /usr/share/nginx/html

# Copy nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

