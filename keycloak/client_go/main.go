package main

import (
	"context"
	"encoding/json"
	oidc "github.com/coreos/go-oidc"
	"golang.org/x/oauth2"
	"log"
	"net/http"
)

var (
	client_id = "goapp"
	client_secret = "6238f9cf-7b5c-44d6-81a0-8d51fee3bfdb"
)

func main()  {
	ctx := context.Background()

	provider, err := oidc.NewProvider(ctx,"http://localhost:8080/auth/realms/jafao")

	if (err != nil) {
		log.Fatal(err)
	}

	config := oauth2.Config{
		ClientID:    client_id,
		ClientSecret: client_secret,
		Endpoint:     provider.Endpoint(),
		RedirectURL:  "http://localhost:8081/auth/callback",
		Scopes:       []string{oidc.ScopeOpenID,"profile", "email", "roles"},
	}

	state := "123"

	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		http.Redirect(writer, request, config.AuthCodeURL(state), http.StatusFound)
	})

	http.HandleFunc("/auth/callback", func(writer http.ResponseWriter, request *http.Request) {
		if request.URL.Query().Get("state") != state {
			http.Error(writer, "State inválido", http.StatusBadRequest)
			return
		}

		token, err := config.Exchange(ctx, request.URL.Query().Get("code"))

		if err != nil {
			http.Error(writer, "Erro ao trocar o token", http.StatusBadRequest)
			log.Fatal(err)
			return
		}

		resp := struct {
			AccessToken *oauth2.Token
		}{
			token,
		}

		data, err := json.Marshal(resp)

		if err != nil {
			http.Error(writer, "Erro ao serializar JSON", http.StatusInternalServerError)
			log.Fatal(err)
			return
		}

		_, _ = writer.Write(data)

	})

	log.Fatal(http.ListenAndServe("localhost:8081", nil))
}