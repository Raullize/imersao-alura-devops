# Imersão DevOps - Alura Google Cloud

Este projeto é uma API desenvolvida com FastAPI para gerenciar alunos, cursos e matrículas em uma instituição de ensino.

## 📚 Sobre o Projeto

Este repositório foi criado durante a **Imersão DevOps da Alura com Google Cloud**, onde pude aprender na prática conceitos fundamentais de DevOps, incluindo:

- **DevOps**: Cultura e práticas de desenvolvimento e operações
- **Pipeline**: Automação de processos de desenvolvimento
- **CI/CD**: Integração e entrega contínuas
- **Convenção de commits**: Padronização de mensagens de commit
- **Google Cloud**: Plataforma de nuvem para deploy e gerenciamento

> ⚠️ **Importante**: O projeto em si da escola não foi ensinado como fazer, foi apenas usado como base para aprender os conceitos de DevOps na prática.

## 🛠️ Pré-requisitos

- [Python 3.10 ou superior](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- [Docker](https://www.docker.com/get-started/)
- [Google Cloud CLI](https://cloud.google.com/cli?hl=pt-BR) (opcional, para deploy)

## 🚀 Como Executar a Aplicação

### Opção 1: Execução Local (sem Docker)

1. **Faça o download do repositório:**
   ```sh
   git clone https://github.com/guilhermeonrails/imersao-devops.git
   cd imersao-devops
   ```

2. **Crie um ambiente virtual:**
   ```sh
   python3 -m venv ./venv
   ```

3. **Ative o ambiente virtual:**
   - No Linux/Mac:
     ```sh
     source venv/bin/activate
     ```
   - No Windows:
     ```sh
     venv\Scripts\activate
     ```

4. **Instale as dependências:**
   ```sh
   pip install -r requirements.txt
   ```

5. **Execute a aplicação:**
   ```sh
   uvicorn app:app --reload
   ```

6. **Acesse a documentação interativa:**
   Abra o navegador e acesse: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

### Opção 2: Execução com Docker

#### Usando Docker Compose (Recomendado)
```sh
# Construir e executar os containers
docker-compose up --build

# Executar em background
docker-compose up -d --build

# Parar os containers
docker-compose down
```

#### Usando Docker diretamente
```sh
# Construir a imagem
docker build -t escola-api .

# Executar o container
docker run -p 8000:8000 escola-api
```

A aplicação estará disponível em: [http://localhost:8000/docs](http://localhost:8000/docs)

## ☁️ Deploy no Google Cloud

### Configuração Inicial
```sh
# Fazer login no Google Cloud
gcloud auth login

# Configurar o projeto
gcloud config set project SEU_PROJECT_ID

# Habilitar APIs necessárias
gcloud services enable run.googleapis.com
gcloud services enable cloudbuild.googleapis.com
```

### Deploy para Cloud Run
```sh
# Deploy direto do código local
gcloud run deploy escola-api \
  --source . \
  --platform managed \
  --region us-central1 \
  --port 8000 \
  --allow-unauthenticated

# Ou deploy usando uma imagem Docker
gcloud run deploy escola-api \
  --image gcr.io/SEU_PROJECT_ID/escola-api \
  --platform managed \
  --region us-central1 \
  --port 8000 \
  --allow-unauthenticated
```

### Comandos Úteis do Google Cloud
```sh
# Listar deployments
gcloud run services list

# Ver logs da aplicação
gcloud run services logs tail escola-api

# Deletar o serviço
gcloud run services delete escola-api

# Configurar domínio customizado
gcloud run domain-mappings create --service escola-api --domain seu-dominio.com
```

## 🐳 Arquivos Docker

Durante a imersão, aprendi a criar e configurar os arquivos Docker necessários:

### Dockerfile
Usado para criar a imagem Docker da aplicação, baseado na **Docker Reference** para FastAPI:
- Define a imagem base Python
- Instala dependências
- Configura o ambiente de produção
- Expõe a porta 8000

### .dockerignore
Evita que arquivos desnecessários sejam incluídos na imagem:
- Ambiente virtual (`venv/`)
- Arquivos Git (`.git/`)
- Arquivos temporários

### docker-compose.yml
Orquestra os containers da aplicação:
- Define serviços
- Configura volumes
- Mapeia portas
- Facilita desenvolvimento local

## 🔄 GitHub Actions - Docker Image

O projeto inclui configuração para GitHub Actions que automatiza:
- Build da imagem Docker
- Testes da aplicação
- Push para Google Container Registry
- Deploy automático no Google Cloud Run

## 📁 Estrutura do Projeto

```
imersao-alura-devops/
├── app.py              # Arquivo principal da aplicação FastAPI
├── models.py           # Modelos do banco de dados (SQLAlchemy)
├── schemas.py          # Schemas de validação (Pydantic)
├── database.py         # Configuração do banco de dados SQLite
├── routers/            # Diretório com arquivos de rotas
│   ├── alunos.py
│   ├── cursos.py
│   └── matriculas.py
├── requirements.txt    # Dependências do projeto
├── Dockerfile         # Configuração da imagem Docker
├── .dockerignore      # Arquivos ignorados pelo Docker
├── docker-compose.yml # Orquestração de containers
└── README.md          # Documentação do projeto
```

## 💾 Banco de Dados

- O banco de dados SQLite será criado automaticamente como `escola.db` na primeira execução
- Para reiniciar o banco, basta apagar o arquivo `escola.db` (isso apagará todos os dados)
- Em produção, recomenda-se usar um banco mais robusto como PostgreSQL

## 🎯 Endpoints Disponíveis

A API oferece endpoints para:
- **Alunos**: Criar, listar, buscar, atualizar e deletar alunos
- **Cursos**: Gerenciar cursos disponíveis
- **Matrículas**: Gerenciar matrículas de alunos em cursos

Acesse `/docs` para ver a documentação interativa completa.

## 🤝 Contribuição

Este projeto foi desenvolvido para fins educacionais durante a Imersão DevOps. Sinta-se à vontade para explorar, estudar e adaptar o código para seus próprios projetos de aprendizado.

## 📝 Convenção de Commits

Durante a imersão, também aprendi sobre a importância da convenção de commits:
- `feat:` para novas funcionalidades
- `fix:` para correções de bugs
- `docs:` para documentação
- `style:` para formatação
- `refactor:` para refatoração
- `test:` para testes
- `chore:` para tarefas de manutenção

---

**Desenvolvido durante a Imersão DevOps da Alura com Google Cloud** 🚀



