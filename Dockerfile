# Use uma imagem Python Alpine para menor tamanho
FROM python:3.13.4-alpine3.22

# Criar diretório de trabalho
WORKDIR /app

# Copiar requirements.txt primeiro (para melhor cache do Docker)
COPY requirements.txt .

# Instalar dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código da aplicação
COPY . .

# Expor a porta da aplicação
EXPOSE 8000

# Comando para executar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]