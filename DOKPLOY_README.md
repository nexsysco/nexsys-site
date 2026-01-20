# 🚨 SOLUÇÃO PARA BAD GATEWAY NO DOKPLOY

## Problema
Se você está enfrentando erro **502 Bad Gateway** no Dokploy, mesmo com o build sendo bem-sucedido, use este guia.

## ✅ Solução Rápida

### 1. Use o Dockerfile Simplificado
No Dokploy, configure para usar: `Dockerfile.simple` ao invés de `Dockerfile`

**Configurações no Dokploy:**
- **Build Method**: Docker
- **Dockerfile Path**: `./Dockerfile.simple`
- **Port**: `80`
- **Health Check Path**: `/health`

### 2. Verificação
Após o deploy, teste:
- `https://seu-dominio.com/health` → Deve retornar "healthy"
- `https://seu-dominio.com/` → Deve carregar o site

### 3. Se Ainda Não Funcionar

**Opção A: Rebuild Forçado**
- No Dokploy, faça um rebuild completo da aplicação
- Às vezes o cache causa problemas

**Opção B: Verificar Logs**
- Acesse os logs da aplicação no Dokploy
- Procure por erros relacionados ao nginx ou container

**Opção C: Teste Local**
```bash
# Teste o container localmente
docker build -f Dockerfile.simple -t nexsys-test .
docker run -p 8080:80 nexsys-test

# Teste os endpoints
curl http://localhost:8080/health
curl http://localhost:8080/
```

## 🔧 Por que isso acontece?

O Dokploy às vezes tem problemas com configurações complexas de nginx. O `Dockerfile.simple` usa uma configuração mais básica que funciona melhor na maioria dos casos.

## 📞 Suporte

Se o problema persistir:
1. Verifique se o build está completando sem erros
2. Teste localmente primeiro
3. Entre em contato com o suporte do Dokploy com os logs do container