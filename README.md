# API de Filmes

## Endpoints

### 1. Listar Filmes

**GET** `/movies`

- **Descrição**: Retorna todos os filmes ordenados por `release_year`.
- **Parâmetros de Filtro**:
  - `release_year`: Filtra por ano de lançamento.
  - `genre`: Filtra por gênero.
  - `country`: Filtra por país.

Exemplos:

GET http://localhost:3000/movies?release_year=2019
GET http://localhost:3000/movies?genre=Thriller
GET http://localhost:3000/movies?release_year=2019&genre=Thriller


### 2. Importar Arquivo CSV

**POST** `/movies/import`

- **Descrição**: Importa filmes a partir de um arquivo CSV.
- **Parâmetro**:
  - `file`: Arquivo CSV contendo os dados dos filmes (campo obrigatório).

Exemplo de requisição (Postman):

- **Método**: POST
- **URL**: `http://localhost:3000/movies/import`
- **Body**: Form-data
  - **Key**: `file` (tipo "File")
  - **Valor**: Selecione o arquivo `netflix_titles.csv`

## Como rodar o projeto:

1. Clone este repositório.
2. Instale as dependências:
