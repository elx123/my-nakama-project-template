FROM heroiclabs/nakama-pluginbuilder:3.16.0 AS builder

ENV GO111MODULE on
ENV CGO_ENABLED 1
ENV GOPRIVATE "github.com/heroiclabs/nakama-project-template"

COPY . /backend
WORKDIR /backend

RUN go build --trimpath --mod=vendor --buildmode=plugin -o ./app/authmatch/authmatch.so ./app/authmatch

FROM heroiclabs/nakama:3.16.0

COPY --from=builder /backend/app/authmatch/authmatch.so /nakama/data/modules
COPY --from=builder /backend/zarf/docker-compose/local.yml /nakama/data