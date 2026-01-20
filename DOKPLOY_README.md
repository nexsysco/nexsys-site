# 🚨 SOLUÇÃO PARA BAD GATEWAY NO DOKPLOY

## Problema
Se você está enfrentando erro **502 Bad Gateway** no Dokploy, mesmo com o build sendo bem-sucedido, use este guia.

## ✅ SOLUÇÃO PARA MÚLTIPLAS APPS NO DOKPLOY

### 🎯 Problema Identificado: Conflito de Portas!

Quando você tem **múltiplas aplicações** no Dokploy, o problema é **conflito de portas**. Seu outro projeto usa a porta 3000, então este projeto não pode usar a porta 80.

### 🚀 Solução: Use Porta 3000

**Arquivo Dockerfile:** `Dockerfile.nextjs-style`

**Configurações no Dokploy:**
- **Build Method**: Docker
- **Dockerfile Path**: `./Dockerfile.nextjs-style` ⭐
- **Port**: `3000` ⭐ (igual ao seu outro projeto)
- **Health Check Path**: `/health`

**Por que isso funciona:**
- Evita conflito com sua outra aplicação Next.js (que usa porta 3000)
- Usa a mesma arquitetura de porta que já funciona no seu Dokploy
- Nginx escuta na porta 3000 internamente, igual ao seu projeto Next.js
- Dokploy consegue rotear corretamente sem conflitos de rede

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